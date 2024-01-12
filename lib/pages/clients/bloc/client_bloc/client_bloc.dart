import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:smart_loans/data_source/models/client_model.dart';
import 'package:smart_loans/data_source/models/document_model.dart';
import 'package:smart_loans/data_source/repositories/client_repo.dart';

part 'client_event.dart';
part 'client_state.dart';

class ClientBloc extends Bloc<ClientEvent, ClientState> {
  ClientBloc() : super(const ClientState()) {
    on<GetClient>(_mapGetClientEventToState);
    on<CreateClient>(_mapCreateClientEventToState);
    on<UpdateClient>(_mapUpdateClientEventToState);
    on<DeleteClient>(_mapDeleteClientEventToState);
    on<SelectClient>(_mapSelectClientEventToState);
    on<GetClientDocuments>(_mapGetClientDocumentsEventToState);
  }

  _mapGetClientEventToState(GetClient event, Emitter<ClientState> emit) async {
    emit(state.copyWith(status: ClientStatus.loading));
    try {
      var client = await ClientRepo.fetch(event.idSelected);
      emit(state.copyWith(status: ClientStatus.success, client: client));
    } catch (e) {
      emit(state.copyWith(status: ClientStatus.error));
    }
  }

  _mapCreateClientEventToState(
      CreateClient event, Emitter<ClientState> emit) async {
    emit(state.copyWith(status: ClientStatus.loading));
    await ClientRepo.post(event.client).then((client) {
      emit(state.copyWith(status: ClientStatus.success, client: client));
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error);
        print(stackTrace);
      }
      emit(state.copyWith(status: ClientStatus.error));
    });
  }

  _mapUpdateClientEventToState(
      UpdateClient event, Emitter<ClientState> emit) async {
    emit(state.copyWith(status: ClientStatus.loading));
    await ClientRepo.put(event.client, event.idSelected).then((client) {
      emit(state.copyWith(status: ClientStatus.success, client: client));
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error);
        print(stackTrace);
      }
      emit(state.copyWith(status: ClientStatus.error));
    });
  }

  _mapDeleteClientEventToState(DeleteClient event, Emitter<ClientState> emit) {
    emit(state.copyWith(status: ClientStatus.loading));
    try {
      emit(state.copyWith(status: ClientStatus.success));
    } catch (e) {
      emit(state.copyWith(status: ClientStatus.error));
    }
  }

  _mapSelectClientEventToState(SelectClient event, Emitter<ClientState> emit) {
    emit(state.copyWith(status: ClientStatus.loading));
    try {
      emit(state.copyWith(status: ClientStatus.success, client: event.client));
    } catch (e) {
      emit(state.copyWith(status: ClientStatus.error));
    }
  }

  _mapGetClientDocumentsEventToState(
      GetClientDocuments event, Emitter<ClientState> emit) async {
    emit(state.copyWith(status: ClientStatus.loading));
    try {
      var documents = event.client.documents;
      emit(state.copyWith(status: ClientStatus.success, documents: documents));
    } catch (e) {
      emit(state.copyWith(status: ClientStatus.error));
    }
  }

  @override
  void onChange(Change<ClientState> change) {
    super.onChange(change);
    if (kDebugMode) {
      print("Change: $change");
    }
  }

  @override
  void onEvent(ClientEvent event) {
    super.onEvent(event);
    if (kDebugMode) {
      print("Event: $event");
    }
  }

  @override
  void onTransition(Transition<ClientEvent, ClientState> transition) {
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
