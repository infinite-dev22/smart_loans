import 'package:intl/intl.dart';
class LoanPaymentModel {
  int? id;
  DateTime? dateReceived;
  DateTime? nextPaymentDate;
  String? principalAmount;
  String? loanInterest;
  String? feesAmount;
  String? penaltyAmount;
  int? loanId;
  String? description;
  int? loanScheduleId;

  LoanPaymentModel({
    this.id,
    this.dateReceived,
    this.nextPaymentDate,
    this.principalAmount,
    this.loanInterest,
    this.feesAmount,
    this.penaltyAmount,
    this.loanId,
    this.description,
    this.loanScheduleId,
  });

  factory LoanPaymentModel.fromJson(Map<String, dynamic> json) => LoanPaymentModel(
    id: json["id"],
    dateReceived: DateTime.parse(json["date_received"]),
    nextPaymentDate: DateTime.parse(json["next_payment_date"]),
    principalAmount: json["principal_amount"],
    loanInterest: json["loan_interest"],
    feesAmount: json["fees_amount"],
    penaltyAmount: json["penalty_amount"],
    loanId: json["loan_id"],
    description: json["description"],
    loanScheduleId: json["loan_schedule_id"],
  );

  Map<String, dynamic> toJson() => {
    // "id": id,
    "date_received": DateFormat('yyyy-MM-dd'),
    "next_payment_date": DateFormat('yyyy-MM-dd'),
    "principal_amount": principalAmount,
    "loan_interest": loanInterest,
    "fees_amount": feesAmount,
    "penalty_amount": penaltyAmount,
    "loan_id": loanId,
    "description": description,
    "loan_schedule_id": loanScheduleId,
  };

  List<dynamic> toList() => [
    // id,
    dateReceived,
    principalAmount,
    loanInterest,
    penaltyAmount,
    description,
    nextPaymentDate,

  ];
}