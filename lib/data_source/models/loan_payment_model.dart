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

  factory LoanPaymentModel.fromJson(Map<String, dynamic> json) =>
      LoanPaymentModel(
        id: json["id"],
        dateReceived: json["date_received"] != null
            ? DateTime.parse(json["date_received"])
            : null,
        nextPaymentDate: json["next_payment_date"] != null
            ? DateTime.parse(json["next_payment_date"])
            : null,
        principalAmount: json["date_received"] != null
            ? json["principal_amount"] : "0",
        loanInterest: json["date_received"] != null
            ? json["loan_interest"] : "0",
        feesAmount: json["date_received"] != null
            ? json["fees_amount"] : "0",
        penaltyAmount: json["date_received"] != null
            ? json["penalty_amount"] : "0",
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

  List<dynamic> toList() {
    var formatter = NumberFormat("###,###.##");
    return [
      // id,
      dateReceived,
      formatter.format(double.parse(principalAmount ?? "0")),
      formatter.format(double.parse(loanInterest ?? "0")),
      formatter.format(double.parse(penaltyAmount ?? "0")),
      description,
      nextPaymentDate,
    ];
  }
}
