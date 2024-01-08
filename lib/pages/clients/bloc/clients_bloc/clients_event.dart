part of 'clients_bloc.dart';

@immutable
abstract class ClientsEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetClients extends ClientsEvent {}

class DeleteClients extends ClientsEvent {
  DeleteClients(this.idSelected);

  final int idSelected;

  @override
  List<Object?> get props => [idSelected];
}

class SelectClients extends ClientsEvent {
  SelectClients(this.client);

  final ClientModel client;

  @override
  List<Object?> get props => [client];
}

class Success extends ClientsEvent {}
