part of 'loan_schedule_bloc.dart';

abstract class LoanScheduleEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetLoanSchedules extends LoanScheduleEvent {
  GetLoanSchedules(this.loanId);

  final int loanId;

  @override
  List<Object?> get props => [loanId];
}

class GetLoanSchedule extends LoanScheduleEvent {
  GetLoanSchedule(this.idSelected);

  final int idSelected;

  @override
  List<Object?> get props => [idSelected];
}

class CreateLoanSchedule extends LoanScheduleEvent {
  CreateLoanSchedule(this.loanSchedule);

  final LoanScheduleModel loanSchedule;

  @override
  List<Object?> get props => [loanSchedule];
}

class UpdateLoanSchedule extends LoanScheduleEvent {
  UpdateLoanSchedule(this.idSelected, this.loanSchedule);

  final int idSelected;
  final LoanScheduleModel loanSchedule;

  @override
  List<Object?> get props => [idSelected, loanSchedule];
}

class DeleteLoanSchedule extends LoanScheduleEvent {
  DeleteLoanSchedule(this.idSelected);

  final int idSelected;

  @override
  List<Object?> get props => [idSelected];
}

class SelectLoanSchedule extends LoanScheduleEvent {
  SelectLoanSchedule(this.idSelected);

  final int idSelected;

  @override
  List<Object?> get props => [idSelected];
}

class Success extends LoanScheduleEvent {}
