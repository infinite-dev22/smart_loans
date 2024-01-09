part of 'industry_type_bloc.dart';

enum IndustryTypeStatus { initial, success, error, loading, selected, noData }

extension IndustryTypeStatusX on IndustryTypeStatus {
  bool get isInitial => this == IndustryTypeStatus.initial;

  bool get isSuccess => this == IndustryTypeStatus.success;

  bool get isError => this == IndustryTypeStatus.error;

  bool get isLoading => this == IndustryTypeStatus.loading;

  bool get isSelected => this == IndustryTypeStatus.selected;
}

class IndustryTypeState extends Equatable {
  final List<IndustryTypeModel>? types;
  final IndustryTypeModel? type;
  final IndustryTypeStatus status;
  final int? idSelected;

  const IndustryTypeState({
    List<IndustryTypeModel>? types,
    this.type,
    this.status = IndustryTypeStatus.initial,
    this.idSelected = 0,
  }) : types = types ?? const [];

  @override
  List<Object?> get props => [types, type, status, idSelected];

  // Copy state

  IndustryTypeState copyWith({
    List<IndustryTypeModel>? types,
    IndustryTypeModel? type,
    IndustryTypeStatus? status,
    int? idSelected,
  }) {
    return IndustryTypeState(
      types: types ?? this.types,
      type: type ?? this.type,
      status: status ?? this.status,
      idSelected: idSelected ?? this.idSelected,
    );
  }
}

class IndustryTypesInitial extends IndustryTypeState {}

class IndustryTypesLoading extends IndustryTypeState {}

class IndustryTypesSuccess extends IndustryTypeState {
  const IndustryTypesSuccess(types);

  @override
  List<Object?> get props => [types];
}

class IndustryTypesError extends IndustryTypeState {}

class IndustryTypesNoData extends IndustryTypeState {}

class IndustryTypeInitial extends IndustryTypeState {}

class IndustryTypeLoading extends IndustryTypeState {}

class IndustryTypeSuccess extends IndustryTypeState {
  const IndustryTypeSuccess(type);

  @override
  List<Object?> get props => [type];
}

class IndustryTypePosted extends IndustryTypeState {}

class IndustryTypeError extends IndustryTypeState {}

class IndustryTypeNoData extends IndustryTypeState {}
