part of 'loan_schedule_bloc.dart';

enum LoanScheduleStatus { initial, success, error, loading, selected, noData }

extension LoanScheduleStatusX on LoanScheduleStatus {
  bool get isInitial => this == LoanScheduleStatus.initial;

  bool get isSuccess => this == LoanScheduleStatus.success;

  bool get isError => this == LoanScheduleStatus.error;

  bool get isLoading => this == LoanScheduleStatus.loading;

  bool get isSelected => this == LoanScheduleStatus.selected;
}

class LoanScheduleState extends Equatable {
  final List<LoanScheduleModel>? loanSchedules;
  final LoanScheduleModel? loanSchedule;
  final LoanScheduleStatus status;
  final int? idSelected;
  final int? loanId;

  const LoanScheduleState({
    List<LoanScheduleModel>? loanSchedules,
    this.loanSchedule,
    this.status = LoanScheduleStatus.initial,
    this.idSelected = 0,
    this.loanId = 0,
  }) : loanSchedules = loanSchedules ?? const [];

  @override
  List<Object?> get props =>
      [loanSchedules, loanSchedule, status, idSelected, loanId];

  // Copy state

  LoanScheduleState copyWith({
    List<LoanScheduleModel>? loanSchedules,
    LoanScheduleModel? loanSchedule,
    LoanScheduleStatus? status,
    int? idSelected,
    int? loanId,
  }) {
    return LoanScheduleState(
      loanSchedules: loanSchedules ?? this.loanSchedules,
      loanSchedule: loanSchedule ?? this.loanSchedule,
      status: status ?? this.status,
      idSelected: idSelected ?? this.idSelected,
      loanId: loanId ?? this.loanId,
    );
  }
}

class LoanSchedulesInitial extends LoanScheduleState {}

class LoanSchedulesLoading extends LoanScheduleState {}

class LoanSchedulesSuccess extends LoanScheduleState {
  const LoanSchedulesSuccess(loanSchedules);

  @override
  List<Object?> get props => [loanSchedules];
}

class LoanSchedulesError extends LoanScheduleState {}

class LoanSchedulesNoData extends LoanScheduleState {}

class LoanScheduleInitial extends LoanScheduleState {}

class LoanScheduleLoading extends LoanScheduleState {}

class LoanScheduleSuccess extends LoanScheduleState {
  const LoanScheduleSuccess(loanSchedule);

  @override
  List<Object?> get props => [loanSchedule];
}

class LoanSchedulePosted extends LoanScheduleState {}

class LoanScheduleError extends LoanScheduleState {}

class LoanScheduleNoData extends LoanScheduleState {}
