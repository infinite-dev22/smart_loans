part of 'loan_payment_bloc.dart';

enum LoanPaymentStatus { initial, success, error, noData, loading, selected }

extension LoanPaymentStatusX on LoanPaymentStatus {
  bool get isInitial => this == LoanPaymentStatus.initial;

  bool get isSuccess => this == LoanPaymentStatus.success;

  bool get isError => this == LoanPaymentStatus.error;

  bool get isLoading => this == LoanPaymentStatus.loading;

  bool get isSelected => this == LoanPaymentStatus.selected;
}

class LoanPaymentState extends Equatable {
  final List<LoanPaymentModel>? loanPayments;
  final LoanPaymentModel? loanPayment;
  final LoanPaymentStatus? status;
  final int? idSelected;
  final int? loanId;

  const LoanPaymentState(
      {this.loanPayments,
      this.loanPayment,
      this.status = LoanPaymentStatus.initial,
      this.idSelected = 0,
      this.loanId = 0});

  LoanPaymentState copyWith({
    List<LoanPaymentModel>? loanPayments,
    LoanPaymentModel? loanPayment,
    LoanPaymentStatus? status,
    int? idSelected,
    int? loanId,
  }) {
    return LoanPaymentState(
      loanPayments: loanPayments ?? this.loanPayments,
      loanPayment: loanPayment ?? this.loanPayment,
      status: status ?? this.status,
      idSelected: idSelected ?? this.idSelected,
      loanId: loanId ?? this.loanId,
    );
  }

  @override
  List<Object?> get props => [loanPayments, loanPayments, idSelected, status];
}

class LoanPaymentInitial extends LoanPaymentState {}

class LoanPaymentSuccess extends LoanPaymentState {
  @override
  List<Object?> get props => [loanPayment];
}

class LoanPaymentPosted extends LoanPaymentState {}

class LoanPaymentError extends LoanPaymentState {}

class LoanPaymentNoData extends LoanPaymentState {}
