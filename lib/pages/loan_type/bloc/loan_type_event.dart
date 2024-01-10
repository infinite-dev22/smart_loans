part of 'loan_type_bloc.dart';

abstract class LoanTypeEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetLoanTypes extends LoanTypeEvent {}

class GetLoanType extends LoanTypeEvent {
  GetLoanType(this.idSelected);

  final int idSelected;

  @override
  List<Object?> get props => [idSelected];
}

class CreateLoanType extends LoanTypeEvent {
  CreateLoanType(this.loanType);

  final LoanTypeModel loanType;

  @override
  List<Object?> get props => [loanType];
}

class UpdateLoanType extends LoanTypeEvent {
  UpdateLoanType(this.idSelected, this.loanType);

  final int idSelected;
  final LoanTypeModel loanType;

  @override
  List<Object?> get props => [idSelected, loanType];
}

class DeleteLoanType extends LoanTypeEvent {
  DeleteLoanType(this.idSelected);

  final int idSelected;

  @override
  List<Object?> get props => [idSelected];
}

class SelectLoanType extends LoanTypeEvent {
  SelectLoanType(this.idSelected);

  final int idSelected;

  @override
  List<Object?> get props => [idSelected];
}

class Success extends LoanTypeEvent {}
