part of 'client_type_bloc.dart';

enum ClientTypeStatus { initial, success, error, loading, selected, noData }

extension ClientTypeStatusX on ClientTypeStatus {
  bool get isInitial => this == ClientTypeStatus.initial;

  bool get isSuccess => this == ClientTypeStatus.success;

  bool get isError => this == ClientTypeStatus.error;

  bool get isLoading => this == ClientTypeStatus.loading;

  bool get isSelected => this == ClientTypeStatus.selected;
}

class ClientTypeState extends Equatable {
  final List<ClientTypeModel>? types;
  final ClientTypeModel? type;
  final ClientTypeStatus status;
  final int? idSelected;

  const ClientTypeState({
    List<ClientTypeModel>? types,
    this.type,
    this.status = ClientTypeStatus.initial,
    this.idSelected = 0,
  }) : types = types ?? const [];

  @override
  List<Object?> get props => [types, type, status, idSelected];

  // Copy state

  ClientTypeState copyWith({
    List<ClientTypeModel>? types,
    ClientTypeModel? type,
    ClientTypeStatus? status,
    int? idSelected,
  }) {
    return ClientTypeState(
      types: types ?? this.types,
      type: type ?? this.type,
      status: status ?? this.status,
      idSelected: idSelected ?? this.idSelected,
    );
  }
}

class ClientTypesInitial extends ClientTypeState {}

class ClientTypesLoading extends ClientTypeState {}

class ClientTypesSuccess extends ClientTypeState {
  const ClientTypesSuccess(types);

  @override
  List<Object?> get props => [types];
}

class ClientTypesError extends ClientTypeState {}

class ClientTypesNoData extends ClientTypeState {}

class ClientTypeInitial extends ClientTypeState {}

class ClientTypeLoading extends ClientTypeState {}

class ClientTypeSuccess extends ClientTypeState {
  const ClientTypeSuccess(type);

  @override
  List<Object?> get props => [type];
}

class ClientTypePosted extends ClientTypeState {}

class ClientTypeError extends ClientTypeState {}

class ClientTypeNoData extends ClientTypeState {}
