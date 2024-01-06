part of 'client_bloc.dart';

// Just some preferred event design, it's a personal preference.
@immutable
abstract class ClientEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetClients extends ClientEvent {}

class GetClient extends ClientEvent {
  GetClient(this.idSelected);

  final int idSelected;

  @override
  List<Object?> get props => [idSelected];
}

class CreateClient extends ClientEvent {
  CreateClient(this.client);

  final ClientModel client;

  @override
  List<Object?> get props => [client];
}

class UpdateClient extends ClientEvent {
  UpdateClient(this.idSelected, this.client);

  final int idSelected;
  final ClientModel client;

  @override
  List<Object?> get props => [idSelected, client];
}

class DeleteClient extends ClientEvent {
  DeleteClient(this.idSelected);

  final int idSelected;

  @override
  List<Object?> get props => [idSelected];
}

class SelectClient extends ClientEvent {
  SelectClient(this.client);

  final ClientModel client;

  @override
  List<Object?> get props => [client];
}

class Success extends ClientEvent {}
