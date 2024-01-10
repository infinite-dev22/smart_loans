part of 'loan_form_bloc.dart';

@immutable
abstract class LoanFormEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetLoan extends LoanFormEvent {
  GetLoan(this.idSelected);

  final int idSelected;

  @override
  List<Object?> get props => [idSelected];
}

class PutLoan extends LoanFormEvent {
  PutLoan(this.loan, this.idSelected);

  final int idSelected;
  final LoanModel loan;

  @override
  List<Object?> get props => [
        loan,
        idSelected,
      ];
}

class PostLoan extends LoanFormEvent {
  PostLoan(this.loan);

  final LoanModel loan;

  @override
  List<Object?> get props => [loan];
}

class Success extends LoanFormEvent {}

class SetFixedRate extends LoanFormEvent {}

class SetPercentage extends LoanFormEvent {}
