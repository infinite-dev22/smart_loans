import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:smart_loans/data_source/models/document_model.dart';
import 'package:smart_loans/data_source/repositories/document_repo.dart';

part 'documents_event.dart';
part 'documents_state.dart';

class DocumentsBloc extends Bloc<DocumentsEvent, DocumentsState> {
  DocumentsBloc() : super(const DocumentsState()) {
    on<GetDocuments>(_mapGetDocumentsEventToState);
    on<DeleteDocuments>(_mapDeleteDocumentsEventToState);
    on<SelectDocuments>(_mapSelectDocumentsEventToState);
  }

  _mapGetDocumentsEventToState(
      GetDocuments event, Emitter<DocumentsState> emit) async {
    emit(state.copyWith(status: DocumentsStatus.loading));
    await DocumentRepo.fetchAll().then((documents) {
      emit(state.copyWith(
          status: DocumentsStatus.success, documents: documents));
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error);
        print(stackTrace);
      }
      emit(state.copyWith(status: DocumentsStatus.error));
    });
  }

  _mapDeleteDocumentsEventToState(
      DeleteDocuments event, Emitter<DocumentsState> emit) {
    emit(state.copyWith(status: DocumentsStatus.loading));
    try {
      emit(state.copyWith(status: DocumentsStatus.success));
    } catch (e) {
      emit(state.copyWith(status: DocumentsStatus.error));
    }
  }

  _mapSelectDocumentsEventToState(
      SelectDocuments event, Emitter<DocumentsState> emit) {
    emit(state.copyWith(status: DocumentsStatus.loading));
    try {
      print("Document: ${event.document.name}");
      emit(state.copyWith(
          status: DocumentsStatus.success, document: event.document));
    } catch (e) {
      emit(state.copyWith(status: DocumentsStatus.error));
    }
  }

  @override
  void onChange(Change<DocumentsState> change) {
    super.onChange(change);
    if (kDebugMode) {
      print("Change: $change");
    }
  }

  @override
  void onEvent(DocumentsEvent event) {
    super.onEvent(event);
    if (kDebugMode) {
      print("Event: $event");
    }
  }

  @override
  void onTransition(Transition<DocumentsEvent, DocumentsState> transition) {
    super.onTransition(transition);
    if (kDebugMode) {
      print("Transition: $transition");
    }
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    if (kDebugMode) {
      print("Error: $error");
      print("StackTrace: $stackTrace");
    }
  }
}
