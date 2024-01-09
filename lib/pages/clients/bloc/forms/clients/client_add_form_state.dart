part of 'client_add_form_bloc.dart';

enum ClientAddFormStatus {
  initial,
  success,
  error,
  loading,
  selected,
  noData,
  individual,
  company
}

extension ClientAddFormStatusX on ClientAddFormStatus {
  bool get isInitial => this == ClientAddFormStatus.initial;

  bool get isSuccess => this == ClientAddFormStatus.success;

  bool get isError => this == ClientAddFormStatus.error;

  bool get isLoading => this == ClientAddFormStatus.loading;

  bool get isSelected => this == ClientAddFormStatus.selected;

  bool get showIndividual => this == ClientAddFormStatus.initial;

  bool get showCompany => this == ClientAddFormStatus.company;
}

//
@immutable
class ClientAddFormState extends Equatable {
  final ClientModel? client;
  final List<RoleModel>? roles;
  final ClientAddFormStatus status;
  final int? idSelected;

  const ClientAddFormState({
    this.client,
    this.roles,
    this.status = ClientAddFormStatus.initial,
    this.idSelected,
  });

  @override
  List<Object?> get props => [client, roles, status, idSelected];

  // Copy state.
  ClientAddFormState copyWith({
    ClientModel? client,
    final List<RoleModel>? roles,
    ClientAddFormStatus? status,
    int? idSelected,
  }) {
    return ClientAddFormState(
      client: client ?? this.client,
      roles: roles ?? this.roles,
      status: status ?? this.status,
      idSelected: idSelected ?? this.idSelected,
    );
  }
}

class ClientInitial extends ClientAddFormState {}

class ClientLoading extends ClientAddFormState {}

class ClientSuccess extends ClientAddFormState {
  const ClientSuccess(client);

  @override
  List<Object?> get props => [client];
}

class ClientError extends ClientAddFormState {}

class ClientNoData extends ClientAddFormState {}

class RoleLoading extends ClientAddFormState {}

class RoleError extends ClientAddFormState {}

class RoleSuccess extends ClientAddFormState {
  const RoleSuccess(roles);

  @override
  List<Object?> get props => [roles];
}

class ShowCompany extends ClientAddFormState {}

class ShowIndividual extends ClientAddFormState {}
