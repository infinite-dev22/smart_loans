part of 'loan_duration_bloc.dart';

@immutable
abstract class LoanDurationEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetLoanDurations extends LoanDurationEvent {}

class GetLoanDuration extends LoanDurationEvent {
  GetLoanDuration(this.idSelected);

  final int idSelected;

  @override
  List<Object?> get props => [idSelected];
}

class PostLoanDuration extends LoanDurationEvent {
  PostLoanDuration(this.loanDuration);

  final LoanDurationModel loanDuration;

  @override
  List<Object?> get props => [loanDuration];
}

class PutLoanDuration extends LoanDurationEvent {
  PutLoanDuration(this.loanDuration, this.idSelected);

  final int idSelected;
  final LoanDurationModel loanDuration;

  @override
  List<Object?> get props => [
        loanDuration,
        idSelected,
      ];
}

class DeleteLoanDuration extends LoanDurationEvent {
  DeleteLoanDuration(this.idSelected);

  final int idSelected;

  @override
  List<Object?> get props => [idSelected];
}

class DeleteMultipleLoanDuration extends LoanDurationEvent {
  DeleteMultipleLoanDuration(this.idsSelected);

  final List<int> idsSelected;

  @override
  List<Object?> get props => [idsSelected];
}
