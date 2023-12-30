part of 'loan_bloc.dart';

@immutable
abstract class LoanEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetLoans extends LoanEvent {}

class GetLoan extends LoanEvent {
  GetLoan(this.idSelected);

  final int idSelected;

  @override
  List<Object?> get props => [idSelected];
}

class CreateLoan extends LoanEvent {
  CreateLoan(this.loan);

  final LoanModel loan;

  @override
  List<Object?> get props => [loan];
}

class UpdateLoan extends LoanEvent {
  UpdateLoan(this.idSelected, this.loan);

  final int idSelected;
  final LoanModel loan;

  @override
  List<Object?> get props => [idSelected, loan];
}

class DeleteLoan extends LoanEvent {
  DeleteLoan(this.idSelected);

  final int idSelected;

  @override
  List<Object?> get props => [idSelected];
}

class SelectLoan extends LoanEvent {
  SelectLoan(this.idSelected);

  final int idSelected;

  @override
  List<Object?> get props => [idSelected];
}

class Success extends LoanEvent {}
