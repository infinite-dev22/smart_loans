import 'package:intl/intl.dart';

class LoanDetailModel {
  int id;
  dynamic loanNumber;
  dynamic principalAmount;
  dynamic loanFees;
  dynamic loansFeesType;
  dynamic description;
  dynamic client;
  dynamic loanType;
  dynamic loanCategory;
  dynamic currency;
  dynamic branch;
  dynamic loanStatusName;
  dynamic loanStatusCode;
  dynamic createdAt;
  dynamic flowType;
  dynamic repaymentCycle;
  dynamic loanDuration;
  dynamic actionCreatedAt;
  dynamic releasedAt;
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
    required this.loanStatusName,
    required this.loanStatusCode,
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
    var formatter = NumberFormat("###,###.##");
    return LoanDetailModel(
      id: json['id'],
      loanNumber: json['loan_number'],
      principalAmount: json['principal_amount'] != null
          ? formatter.format(json['principal_amount'])
          : 0,
      loanFees: json['loan_fees'] != null
          ? formatter.format(json['loan_fees'] ?? "0")
          : 0,
      loansFeesType: json['loans_fees_type'],
      description: json['description'],
      client: json['client'],
      loanType: json['loan_type'],
      loanCategory: json['loan_category'],
      currency: json['currency'],
      branch: json['branch'],
      loanStatusName: json['loan_status_name'],
      loanStatusCode: json['loan_status_code'],
      createdAt: json['created_at'] != null
          ? DateFormat("yyyy-MM-dd").parse(json['created_at'])
          : null,
      flowType: json['flowType'],
      repaymentCycle: json['repayment_cycle'],
      loanDuration: json['loan_duration'],
      actionCreatedAt: json['actionCreatedAt'],
      releasedAt: json['releasedAt'] != null
          ? DateFormat("yyyy-MM-dd").parse(json['releasedAt'])
          : null,
      maturity:
          json['maturity'] != null ? formatter.format(json['maturity']) : "0",
      loanInterest: json['loanInterest'] != null
          ? formatter.format(double.parse(json['loanInterest']))
          : "0",
      paidAmount: json['paidAmount'] != null
          ? formatter.format(double.parse(json['paidAmount']))
          : "0",
      balanceAmount: json['balanceAmount'] != null
          ? formatter.format(json['balanceAmount'])
          : "0",
      dueAmount: json['dueAmount'] != null
          ? formatter.format(double.parse(json['dueAmount']))
          : "0",
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
      'loan_status_name': loanStatusName,
      'loan_status_code': loanStatusCode,
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
