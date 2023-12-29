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

@immutable
class ClientState extends Equatable {
  final List<ClientModel>? clients;
  final ClientModel? client;
  final ClientStatus status;
  final int? idSelected;

  const ClientState({
    List<ClientModel>? clients,
    this.client,
    this.status = ClientStatus.initial,
    this.idSelected = 0,
  }) : clients = clients ?? const [];

  @override
  List<Object?> get props => [clients, client, status, idSelected];

  // Copy state.
  ClientState copyWith({
    List<ClientModel>? clients,
    ClientModel? client,
    ClientStatus? status,
    int? idSelected,
  }) {
    return ClientState(
      clients: clients ?? this.clients,
      client: client ?? this.client,
      status: status ?? this.status,
      idSelected: idSelected ?? this.idSelected,
    );
  }
}

class ClientsInitial extends ClientState {}

class ClientsLoading extends ClientState {}

class ClientsSuccess extends ClientState {
  const ClientsSuccess(clients);

  @override
  List<Object?> get props => [clients];
}

class ClientsError extends ClientState {}

class ClientsNoData extends ClientState {}

class ClientInitial extends ClientState {}

class ClientLoading extends ClientState {}

class ClientSuccess extends ClientState {
  const ClientSuccess(client);

  @override
  List<Object?> get props => [client];
}

class ClientPosted extends ClientState {}

class ClientError extends ClientState {}

class ClientNoData extends ClientState {}
