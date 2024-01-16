import 'package:intl/intl.dart';

class LoanDetailModel {
  int id;
  dynamic loanNumber;
  int principalAmount;
  dynamic loanFees;
  dynamic loansFeesType;
  dynamic description;
  dynamic client;
  dynamic loanType;
  dynamic loanCategory;
  dynamic currency;
  dynamic branch;
  dynamic loanStatus;
  DateTime createdAt;
  dynamic flowType;
  dynamic repaymentCycle;
  dynamic loanDuration;
  dynamic actionCreatedAt;
  DateTime releasedAt;
  dynamic maturity;
  dynamic loanInterest;
  dynamic paidAmount;
  dynamic balanceAmount;
  dynamic dueAmount;

  LoanDetailModel({
    required this.id,
    required this.loanNumber,
    required this.principalAmount,
    required this.loanFees,
    required this.loansFeesType,
    required this.description,
    required this.client,
    required this.loanType,
    required this.loanCategory,
    required this.currency,
    required this.branch,
    required this.loanStatus,
    required this.createdAt,
    required this.flowType,
    required this.repaymentCycle,
    required this.loanDuration,
    required this.actionCreatedAt,
    required this.releasedAt,
    required this.maturity,
    required this.loanInterest,
    required this.paidAmount,
    required this.balanceAmount,
    required this.dueAmount,
  });

  factory LoanDetailModel.fromJson(Map<String, dynamic> json) {
    return LoanDetailModel(
      id: json['id'],
      loanNumber: json['loan_number'],
      principalAmount: json['principal_amount'],
      loanFees: json['loan_fees'],
      loansFeesType: json['loans_fees_type'],
      description: json['description'],
      client: json['client'],
      loanType: json['loan_type'],
      loanCategory: json['loan_category'],
      currency: json['currency'],
      branch: json['branch'],
      loanStatus: json['loan_status'],
      createdAt: DateFormat("yyyy-MM-dd").parse(json['created_at']),
      flowType: json['flowType'],
      repaymentCycle: json['repayment_cycle'],
      loanDuration: json['loan_duration'],
      actionCreatedAt: json['actionCreatedAt'],
      releasedAt: DateFormat("yyyy-MM-dd").parse(json['releasedAt']),
      maturity: json['maturity'],
      loanInterest: json['loanInterest'],
      paidAmount: json['paidAmount'],
      balanceAmount: json['balanceAmount'],
      dueAmount: json['dueAmount'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'loan_number': loanNumber,
      'principal_amount': principalAmount,
      'loan_fees': loanFees,
      'loans_fees_type': loansFeesType,
      'description': description,
      'client': client,
      'loan_type': loanType,
      'loan_category': loanCategory,
      'currency': currency,
      'branch': branch,
      'loan_status': loanStatus,
      'created_at': createdAt,
      'flowType': flowType,
      'repayment_cycle': repaymentCycle,
      'loan_duration': loanDuration,
      'actionCreatedAt': actionCreatedAt,
      'releasedAt': releasedAt,
      'maturity': maturity,
      'loanInterest': loanInterest,
      'paidAmount': paidAmount,
      'balanceAmount': balanceAmount,
      'dueAmount': dueAmount,
    };
  }
}
