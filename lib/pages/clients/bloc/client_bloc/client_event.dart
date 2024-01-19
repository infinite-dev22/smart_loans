part of 'client_bloc.dart';

// Just some preferred event design, it's a personal preference.
@immutable
abstract class ClientEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetClient extends ClientEvent {
  GetClient(this.clientId);

  final int clientId;

  @override
  List<Object?> get props => [clientId];
}

class CreateClient extends ClientEvent {
  CreateClient(this.client);

  final ClientModel client;

  @override
  List<Object?> get props => [client];
}

class UpdateClient extends ClientEvent {
  UpdateClient(this.clientId, this.client);

  final int clientId;
  final ClientModel client;

  @override
  List<Object?> get props => [clientId, client];
}

class DeleteClient extends ClientEvent {
  DeleteClient(this.clientId);

  final int clientId;

  @override
  List<Object?> get props => [clientId];
}

class SelectClient extends ClientEvent {
  SelectClient(this.client);

  final ClientModel client;

  @override
  List<Object?> get props => [client];
}

class GetClientDocuments extends ClientEvent {
  GetClientDocuments(this.client);

  final ClientModel client;

  @override
  List<Object?> get props => [client];
}

class GetClientDocument extends ClientEvent {
  GetClientDocument(this.clientId);

  final int clientId;

  @override
  List<Object?> get props => [clientId];
}

class DeleteClientDocuments extends ClientEvent {
  DeleteClientDocuments(this.idsSelected);

  final List<int> idsSelected;

  @override
  List<Object?> get props => [idsSelected];
}

class DeleteClientDocument extends ClientEvent {
  DeleteClientDocument(this.clientId);

  final int clientId;

  @override
  List<Object?> get props => [clientId];
}

class UpdateClientDocument extends ClientEvent {
  UpdateClientDocument(this.document);

  final DocumentModel document;

  @override
  List<Object?> get props => [document];
}

class Success extends ClientEvent {}
