part of 'documents_bloc.dart';

// Just some preferred state design, it's a personal preference.
enum DocumentsStatus { initial, success, error, loading, selected, noData }

extension DocumentsStatusX on DocumentsStatus {
  bool get isInitial => this == DocumentsStatus.initial;

  bool get isSuccess => this == DocumentsStatus.success;

  bool get isError => this == DocumentsStatus.error;

  bool get isLoading => this == DocumentsStatus.loading;

  bool get isSelected => this == DocumentsStatus.selected;
}

//
@immutable
class DocumentsState extends Equatable {
  final List<DocumentModel>? documents;
  final DocumentsStatus status;
  final int? idSelected;

  const DocumentsState({
    List<DocumentModel>? documents,
    this.status = DocumentsStatus.initial,
    this.idSelected = 0,
  }) : documents = documents ?? const [];

  @override
  List<Object?> get props => [documents, status, idSelected];

  // Copy state.
  DocumentsState copyWith({
    List<DocumentModel>? documents,
    DocumentModel? document,
    DocumentsStatus? status,
    int? idSelected,
  }) {
    return DocumentsState(
      documents: documents ?? this.documents,
      status: status ?? this.status,
      idSelected: idSelected ?? this.idSelected,
    );
  }
}

class DocumentsInitial extends DocumentsState {}

class DocumentsLoading extends DocumentsState {}

class DocumentsSuccess extends DocumentsState {
  const DocumentsSuccess(documents);

  @override
  List<Object?> get props => [documents];
}

class DocumentsError extends DocumentsState {}

class DocumentsNoData extends DocumentsState {}
