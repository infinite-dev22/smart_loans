part of 'loan_status_bloc.dart';

abstract class LoanStatusEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetCurrencies extends LoanStatusEvent {}

class GetLoanStatus extends LoanStatusEvent {
  GetLoanStatus(this.idSelected);

  final int idSelected;

  @override
  List<Object?> get props => [idSelected];
}

class CreateLoanStatus extends LoanStatusEvent {
  CreateLoanStatus(this.loanStatus);

  final LoanStatusModel loanStatus;

  @override
  List<Object?> get props => [loanStatus];
}

class UpdateLoanStatus extends LoanStatusEvent {
  UpdateLoanStatus(this.idSelected, this.loanStatus);

  final int idSelected;
  final LoanStatusModel loanStatus;

  @override
  List<Object?> get props => [idSelected, loanStatus];
}

class DeleteLoanStatus extends LoanStatusEvent {
  DeleteLoanStatus(this.idSelected);

  final int idSelected;

  @override
  List<Object?> get props => [idSelected];
}

class SelectLoanStatus extends LoanStatusEvent {
  SelectLoanStatus(this.idSelected);

  final int idSelected;

  @override
  List<Object?> get props => [idSelected];
}

class Success extends LoanStatusEvent {}
