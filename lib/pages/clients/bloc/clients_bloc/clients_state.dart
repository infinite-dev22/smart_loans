part of 'clients_bloc.dart';

enum ClientsStatus { initial, success, error, loading, selected, noData }

extension ClientsStatusX on ClientsStatus {
  bool get isInitial => this == ClientsStatus.initial;

  bool get isSuccess => this == ClientsStatus.success;

  bool get isError => this == ClientsStatus.error;

  bool get isLoading => this == ClientsStatus.loading;

  bool get isSelected => this == ClientsStatus.selected;
}

//
@immutable
class ClientsState extends Equatable {
  final List<ClientModel>? clients;
  final ClientsStatus status;
  final int? idSelected;

  const ClientsState({
    List<ClientModel>? clients,
    this.status = ClientsStatus.initial,
    this.idSelected = 0,
  }) : clients = clients ?? const [];

  @override
  List<Object?> get props => [clients, status, idSelected];

  // Copy state.
  ClientsState copyWith({
    List<ClientModel>? clients,
    ClientModel? client,
    ClientsStatus? status,
    int? idSelected,
  }) {
    return ClientsState(
      clients: clients ?? this.clients,
      status: status ?? this.status,
      idSelected: idSelected ?? this.idSelected,
    );
  }
}

class ClientsInitial extends ClientsState {}

class ClientsLoading extends ClientsState {}

class ClientsSuccess extends ClientsState {
  const ClientsSuccess(clients);

  @override
  List<Object?> get props => [clients];
}

class ClientsError extends ClientsState {}

class ClientsNoData extends ClientsState {}
