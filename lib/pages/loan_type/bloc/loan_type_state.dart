part of 'loan_type_bloc.dart';

enum LoanTypeStatus { initial, success, error, loading, selected, noData }

extension LoanTypeStatusX on LoanTypeStatus {
  bool get isInitial => this == LoanTypeStatus.initial;

  bool get isSuccess => this == LoanTypeStatus.success;

  bool get isError => this == LoanTypeStatus.error;

  bool get isLoading => this == LoanTypeStatus.loading;

  bool get isSelected => this == LoanTypeStatus.selected;
}

class LoanTypeState extends Equatable {
  final List<LoanTypeModel>? loanTypes;
  final LoanTypeModel? loanType;
  final LoanTypeStatus status;
  final int? idSelected;

  const LoanTypeState({
    List<LoanTypeModel>? loanTypes,
    this.loanType,
    this.status = LoanTypeStatus.initial,
    this.idSelected = 0,
  }) : loanTypes = loanTypes ?? const [];

  @override
  List<Object?> get props => [loanTypes, loanType, status, idSelected];

  // Copy state

  LoanTypeState copyWith({
    List<LoanTypeModel>? loanTypes,
    LoanTypeModel? loanType,
    LoanTypeStatus? status,
    int? idSelected,
  }) {
    return LoanTypeState(
      loanTypes: loanTypes ?? this.loanTypes,
      loanType: loanType ?? this.loanType,
      status: status ?? this.status,
      idSelected: idSelected ?? this.idSelected,
    );
  }
}

class CurrenciesInitial extends LoanTypeState {}

class CurrenciesLoading extends LoanTypeState {}

class CurrenciesSuccess extends LoanTypeState {
  const CurrenciesSuccess(loanTypes);

  @override
  List<Object?> get props => [loanTypes];
}

class CurrenciesError extends LoanTypeState {}

class CurrenciesNoData extends LoanTypeState {}

class LoanTypeInitial extends LoanTypeState {}

class LoanTypeLoading extends LoanTypeState {}

class LoanTypeSuccess extends LoanTypeState {
  const LoanTypeSuccess(loanType);

  @override
  List<Object?> get props => [loanType];
}

class LoanTypePosted extends LoanTypeState {}

class LoanTypeError extends LoanTypeState {}

class LoanTypeNoData extends LoanTypeState {}
