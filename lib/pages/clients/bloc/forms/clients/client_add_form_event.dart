part of 'client_add_form_bloc.dart';

@immutable
abstract class ClientAddFormEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetFormClient extends ClientAddFormEvent {
  GetFormClient(this.idSelected);

  final int idSelected;

  @override
  List<Object?> get props => [idSelected];
}

class PutClient extends ClientAddFormEvent {
  PutClient(this.client, this.idSelected);

  final int idSelected;
  final ClientModel client;

  @override
  List<Object?> get props => [
        client,
        idSelected,
      ];
}

class PostClient extends ClientAddFormEvent {
  PostClient(this.client);

  final ClientModel client;

  @override
  List<Object?> get props => [client];
}

class Success extends ClientAddFormEvent {}

class SetIndividual extends ClientAddFormEvent {}

class SetCompany extends ClientAddFormEvent {}
