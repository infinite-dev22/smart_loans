part of 'client_type_bloc.dart';

abstract class ClientTypeEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetClientTypes extends ClientTypeEvent {}

class GetClientType extends ClientTypeEvent {
  GetClientType(this.idSelected);

  final int idSelected;

  @override
  List<Object?> get props => [idSelected];
}

class CreateClientType extends ClientTypeEvent {
  CreateClientType(this.type);

  final ClientTypeModel type;

  @override
  List<Object?> get props => [type];
}

class UpdateClientType extends ClientTypeEvent {
  UpdateClientType(this.idSelected, this.type);

  final int idSelected;
  final ClientTypeModel type;

  @override
  List<Object?> get props => [idSelected, type];
}

class DeleteClientType extends ClientTypeEvent {
  DeleteClientType(this.idSelected);

  final int idSelected;

  @override
  List<Object?> get props => [idSelected];
}

class SelectClientType extends ClientTypeEvent {
  SelectClientType(this.idSelected);

  final int idSelected;

  @override
  List<Object?> get props => [idSelected];
}

class Success extends ClientTypeEvent {}
