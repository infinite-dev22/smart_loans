part of 'loan_details_bloc.dart';

@immutable
abstract class LoanDetailEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetLoanDetails extends LoanDetailEvent {}

class GetLoanDetail extends LoanDetailEvent {
  GetLoanDetail(this.idSelected);

  final int idSelected;

  @override
  List<Object?> get props => [idSelected];
}

class CreateLoanDetail extends LoanDetailEvent {
  CreateLoanDetail(this.loan);

  final LoanModel loan;

  @override
  List<Object?> get props => [loan];
}

class UpdateLoanDetail extends LoanDetailEvent {
  UpdateLoanDetail(this.idSelected, this.loan);

  final int idSelected;
  final LoanModel loan;

  @override
  List<Object?> get props => [idSelected, loan];
}

class DeleteLoanDetail extends LoanDetailEvent {
  DeleteLoanDetail(this.idSelected);

  final int idSelected;

  @override
  List<Object?> get props => [idSelected];
}

class SelectLoanDetail extends LoanDetailEvent {
  SelectLoanDetail(this.idSelected);

  final int idSelected;

  @override
  List<Object?> get props => [idSelected];
}

class Success extends LoanDetailEvent {}
