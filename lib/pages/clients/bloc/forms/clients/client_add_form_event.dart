part of 'client_add_form_bloc.dart';

@immutable
abstract class ClientFormEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetFormClient extends ClientFormEvent {
  GetFormClient(this.clientId);

  final int clientId;

  @override
  List<Object?> get props => [clientId];
}

class PutClient extends ClientFormEvent {
  PutClient(this.client, this.idSelected);

  final int idSelected;
  final ClientModel client;

  @override
  List<Object?> get props => [
        client,
        idSelected,
      ];
}

class PostClient extends ClientFormEvent {
  PostClient(this.client);

  final ClientModel client;

  @override
  List<Object?> get props => [client];
}

class Success extends ClientFormEvent {}

class SetIndividual extends ClientFormEvent {}

class SetCompany extends ClientFormEvent {}
