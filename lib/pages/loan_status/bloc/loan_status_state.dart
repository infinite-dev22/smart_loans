part of 'loan_status_bloc.dart';

enum LoanStatusStatus { initial, success, error, loading, selected, noData }

extension LoanStatusStatusX on LoanStatusStatus {
  bool get isInitial => this == LoanStatusStatus.initial;

  bool get isSuccess => this == LoanStatusStatus.success;

  bool get isError => this == LoanStatusStatus.error;

  bool get isLoading => this == LoanStatusStatus.loading;

  bool get isSelected => this == LoanStatusStatus.selected;
}

class LoanStatusState extends Equatable {
  final List<LoanStatusModel>? loanStatuses;
  final LoanStatusModel? loanStatus;
  final LoanStatusStatus status;
  final int? idSelected;

  const LoanStatusState({
    List<LoanStatusModel>? loanStatuses,
    this.loanStatus,
    this.status = LoanStatusStatus.initial,
    this.idSelected = 0,
  }) : loanStatuses = loanStatuses ?? const [];

  @override
  List<Object?> get props => [loanStatuses, loanStatus, status, idSelected];

  // Copy state

  LoanStatusState copyWith({
    List<LoanStatusModel>? loanStatuses,
    LoanStatusModel? loanStatus,
    LoanStatusStatus? status,
    int? idSelected,
  }) {
    return LoanStatusState(
      loanStatuses: loanStatuses ?? this.loanStatuses,
      loanStatus: loanStatus ?? this.loanStatus,
      status: status ?? this.status,
      idSelected: idSelected ?? this.idSelected,
    );
  }
}

class CurrenciesInitial extends LoanStatusState {}

class CurrenciesLoading extends LoanStatusState {}

class CurrenciesSuccess extends LoanStatusState {
  const CurrenciesSuccess(loanStatuses);

  @override
  List<Object?> get props => [loanStatuses];
}

class CurrenciesError extends LoanStatusState {}

class CurrenciesNoData extends LoanStatusState {}

class LoanStatusInitial extends LoanStatusState {}

class LoanStatusLoading extends LoanStatusState {}

class LoanStatusSuccess extends LoanStatusState {
  const LoanStatusSuccess(loanStatus);

  @override
  List<Object?> get props => [loanStatus];
}

class LoanStatusPosted extends LoanStatusState {}

class LoanStatusError extends LoanStatusState {}

class LoanStatusNoData extends LoanStatusState {}
