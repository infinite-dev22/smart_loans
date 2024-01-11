part of 'loan_duration_bloc.dart';

enum LoanDurationStatus {
  initial,
  success,
  error,
  loading,
  selected,
  noData,
  fixedRate,
  percentage
}

extension LoanDurationStatusX on LoanDurationStatus {
  bool get isInitial => this == LoanDurationStatus.initial;

  bool get isSuccess => this == LoanDurationStatus.success;

  bool get isError => this == LoanDurationStatus.error;

  bool get isLoading => this == LoanDurationStatus.loading;

  bool get isSelected => this == LoanDurationStatus.selected;

  bool get showFixedRate => this == LoanDurationStatus.fixedRate;

  bool get showPercentage => this == LoanDurationStatus.percentage;
}

@immutable
class LoanDurationState extends Equatable {
  final LoanDurationModel? loanDuration;
  final List<LoanDurationModel>? loanDurations;
  final LoanDurationStatus status;
  final int? idSelected;

  const LoanDurationState({
    this.loanDuration,
    this.loanDurations,
    this.status = LoanDurationStatus.initial,
    this.idSelected,
  });

  @override
  List<Object?> get props => [loanDuration, loanDurations, status, idSelected];

  LoanDurationState copyWith({
    LoanDurationModel? loanDuration,
    final List<LoanDurationModel>? loanDurations,
    LoanDurationStatus? status,
    int? idSelected,
  }) {
    return LoanDurationState(
      loanDuration: loanDuration ?? this.loanDuration,
      loanDurations: loanDurations ?? this.loanDurations,
      status: status ?? this.status,
      idSelected: idSelected ?? this.idSelected,
    );
  }
}

class Initial extends LoanDurationState {}

class Loading extends LoanDurationState {}

class Success extends LoanDurationState {
  const Success(loanDuration);

  @override
  List<Object?> get props => [loanDuration];
}

class Error extends LoanDurationState {}

class NoData extends LoanDurationState {}
