part of 'loan_form_bloc.dart';

enum LoanFormStatus {
  initial,
  success,
  error,
  loading,
  selected,
  noData,
  fixedRate,
  percentage
}

extension LoanFormStatusX on LoanFormStatus {
  bool get isInitial => this == LoanFormStatus.initial;

  bool get isSuccess => this == LoanFormStatus.success;

  bool get isError => this == LoanFormStatus.error;

  bool get isLoading => this == LoanFormStatus.loading;

  bool get isSelected => this == LoanFormStatus.selected;

  bool get showFixedRate => this == LoanFormStatus.fixedRate;

  bool get showPercentage => this == LoanFormStatus.percentage;
}

//
@immutable
class LoanFormState extends Equatable {
  final LoanModel? loan;
  final List<RoleModel>? roles;
  final LoanFormStatus status;
  final int? idSelected;

  const LoanFormState({
    this.loan,
    this.roles,
    this.status = LoanFormStatus.initial,
    this.idSelected,
  });

  @override
  List<Object?> get props => [loan, roles, status, idSelected];

  // Copy state.
  LoanFormState copyWith({
    LoanModel? loan,
    final List<RoleModel>? roles,
    LoanFormStatus? status,
    int? idSelected,
  }) {
    return LoanFormState(
      loan: loan ?? this.loan,
      roles: roles ?? this.roles,
      status: status ?? this.status,
      idSelected: idSelected ?? this.idSelected,
    );
  }
}

class LoanInitial extends LoanFormState {}

class LoanLoading extends LoanFormState {}

class LoanSuccess extends LoanFormState {
  const LoanSuccess(loan);

  @override
  List<Object?> get props => [loan];
}

class LoanError extends LoanFormState {}

class LoanNoData extends LoanFormState {}

class ShowCompany extends LoanFormState {}

class ShowIndividual extends LoanFormState {}
