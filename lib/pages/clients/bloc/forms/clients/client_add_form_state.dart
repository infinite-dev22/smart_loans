part of 'client_add_form_bloc.dart';

enum ClientFormStatus {
  initial,
  success,
  error,
  loading,
  selected,
  noData,
  individual,
  company
}

extension ClientFormStatusX on ClientFormStatus {
  bool get isInitial => this == ClientFormStatus.initial;

  bool get isSuccess => this == ClientFormStatus.success;

  bool get isError => this == ClientFormStatus.error;

  bool get isLoading => this == ClientFormStatus.loading;

  bool get isSelected => this == ClientFormStatus.selected;

  bool get showIndividual => this == ClientFormStatus.initial;

  bool get showCompany => this == ClientFormStatus.company;
}

//
@immutable
class ClientFormState extends Equatable {
  final ClientModel? client;
  final List<RoleModel>? roles;
  final ClientFormStatus status;
  final int? idSelected;

  const ClientFormState({
    this.client,
    this.roles,
    this.status = ClientFormStatus.initial,
    this.idSelected,
  });

  @override
  List<Object?> get props => [client, roles, status, idSelected];

  // Copy state.
  ClientFormState copyWith({
    ClientModel? client,
    final List<RoleModel>? roles,
    ClientFormStatus? status,
    int? idSelected,
  }) {
    return ClientFormState(
      client: client ?? this.client,
      roles: roles ?? this.roles,
      status: status ?? this.status,
      idSelected: idSelected ?? this.idSelected,
    );
  }
}

class ClientInitial extends ClientFormState {}

class ClientLoading extends ClientFormState {}

class ClientSuccess extends ClientFormState {
  const ClientSuccess(client);

  @override
  List<Object?> get props => [client];
}

class ClientError extends ClientFormState {}

class ClientNoData extends ClientFormState {}

class ShowCompany extends ClientFormState {}

class ShowIndividual extends ClientFormState {}
