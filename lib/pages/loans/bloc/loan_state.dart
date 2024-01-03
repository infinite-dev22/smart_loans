part of 'loan_bloc.dart';

enum LoanStatus { initial, success, error, loading, selected, noData }

extension LoanStatusX on LoanStatus {
  bool get isInitial => this == LoanStatus.initial;

  bool get isSuccess => this == LoanStatus.success;

  bool get isError => this == LoanStatus.error;

  bool get isLoading => this == LoanStatus.loading;

  bool get isSelected => this == LoanStatus.selected;
}

class LoanState extends Equatable {
  final List<LoanModel>? loans;
  final LoanModel? loan;
  final LoanStatus status;
  final int? idSelected;

  const LoanState({
    List<LoanModel>? loans,
    this.loan,
    this.status = LoanStatus.initial,
    this.idSelected = 0,
  }) : loans = loans ?? const [];

  @override
  List<Object?> get props => [loans, loan, status, idSelected];

  // Copy state.
  LoanState copyWith({
    List<LoanModel>? loans,
    LoanModel? loan,
    LoanStatus? status,
    int? idSelected,
  }) {
    return LoanState(
      loans: loans ?? this.loans,
      loan: loan ?? this.loan,
      status: status ?? this.status,
      idSelected: idSelected ?? this.idSelected,
    );
  }
}

class LoansInitial extends LoanState {}

class LoansLoading extends LoanState {}

class LoansSuccess extends LoanState {
  const LoansSuccess(loans);

  @override
  List<Object?> get props => [loans];
}

class LoansError extends LoanState {}

class LoansNoData extends LoanState {}

class LoanInitial extends LoanState {}

class LoanLoading extends LoanState {}

class LoanSuccess extends LoanState {
  const LoanSuccess(loan);

  @override
  List<Object?> get props => [loan];
}

class LoanPosted extends LoanState {}

class LoanError extends LoanState {}

class LoanNoData extends LoanState {}
