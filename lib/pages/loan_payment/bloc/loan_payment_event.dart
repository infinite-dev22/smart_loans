part of 'loan_payment_bloc.dart';



abstract class LoanPaymentEvent extends Equatable{
  @override
  List<Object?> get props => [];
}

class GetLoanPayment extends LoanPaymentEvent{
   GetLoanPayment(this.idSelected);
  final int idSelected;

  @override
  List<Object?> get props => [idSelected];
}
class GetLoanPayments extends LoanPaymentEvent{
  GetLoanPayments( this.loanId);
  final int loanId;

  @override
  List<Object?> get props => [loanId];
}


class CreateLoanPayment extends LoanPaymentEvent {
  CreateLoanPayment(this.loanPayment, this.idSelected);

  final int idSelected;
  final LoanPaymentModel loanPayment;

}

class UpdateLoanPayment extends LoanPaymentEvent {
  UpdateLoanPayment(this.idSelected, this.loanPayment);

  final int idSelected;
  final LoanPaymentModel loanPayment;

  @override
  List<Object?> get props => [idSelected, loanPayment];
}

class DeleteLoanPayment extends LoanPaymentEvent {
  DeleteLoanPayment(this.idSelected);

  final int idSelected;

  @override
  List<Object?> get props => [idSelected];
}

class SelectLoanPayment extends LoanPaymentEvent {
  SelectLoanPayment(this.idSelected);

  final int idSelected;

  @override
  List<Object?> get props => [idSelected];
}

class Success extends LoanPaymentEvent {}
