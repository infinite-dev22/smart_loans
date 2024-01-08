part of 'client_bloc.dart';

// Just some preferred state design, it's a personal preference.
enum ClientStatus { initial, success, error, loading, selected, noData }

extension ClientStatusX on ClientStatus {
  bool get isInitial => this == ClientStatus.initial;

  bool get isSuccess => this == ClientStatus.success;

  bool get isError => this == ClientStatus.error;

  bool get isLoading => this == ClientStatus.loading;

  bool get isSelected => this == ClientStatus.selected;
}

//
@immutable
class ClientState extends Equatable {
  final ClientModel? client;
  final List<DocumentModel>? documents;
  final ClientStatus status;
  final int? idSelected;

  const ClientState({
    this.client,
    this.documents,
    this.status = ClientStatus.initial,
    this.idSelected = 0,
  });

  @override
  List<Object?> get props => [client, documents, status, idSelected];

  // Copy state.
  ClientState copyWith({
    ClientModel? client,
    List<DocumentModel>? documents,
    ClientStatus? status,
    int? idSelected,
  }) {
    return ClientState(
      client: client ?? this.client,
      documents: documents ?? this.documents,
      status: status ?? this.status,
      idSelected: idSelected ?? this.idSelected,
    );
  }
}

class ClientInitial extends ClientState {}

class ClientLoading extends ClientState {}

class ClientSuccess extends ClientState {
  const ClientSuccess(client);

  @override
  List<Object?> get props => [client];
}

class ClientSelected extends ClientState {}

class ClientPosted extends ClientState {}

class ClientError extends ClientState {}

class ClientNoData extends ClientState {}

class DocumentsLoading extends ClientState {}

class DocumentsSuccess extends ClientState {
  const DocumentsSuccess(documents);

  @override
  List<Object?> get props => [documents];
}
