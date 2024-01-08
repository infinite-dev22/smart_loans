part of 'documents_bloc.dart';

@immutable
abstract class DocumentsEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetDocuments extends DocumentsEvent {}

class DeleteDocuments extends DocumentsEvent {
  DeleteDocuments(this.idSelected);

  final int idSelected;

  @override
  List<Object?> get props => [idSelected];
}

class SelectDocuments extends DocumentsEvent {
  SelectDocuments(this.document);

  final DocumentModel document;

  @override
  List<Object?> get props => [document];
}

class Success extends DocumentsEvent {}
