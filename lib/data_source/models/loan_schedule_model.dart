class LoanScheduleModel {
  int? id;
  String? scheduleDate;
  String? description;
  String? principalAmount;
  String? loanInterest;
  String? penaltyAmount;
  String? due;
  String? paid;
  String? balance;
  int? loanId;
  int? organisationId;

  LoanScheduleModel({
    this.id,
    this.scheduleDate,
    this.description,
    this.principalAmount,
    this.loanInterest,
    this.penaltyAmount,
    this.due,
    this.paid,
    this.balance,
    this.loanId,
    this.organisationId,
  });

  LoanScheduleModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        scheduleDate = json['schedule_date'],
        description = json['description'],
        principalAmount = json['principal_amount'],
        loanInterest = json['loan_interest'],
        penaltyAmount = json['penalty_amount'],
        due = json['due'],
        paid = json['paid'],
        balance = json['balance'],
        loanId = json['loan_id'],
        organisationId = json['organisation_id'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'schedule_date': scheduleDate,
        'description': description,
        'principal_amount': principalAmount,
        'loan_interest': loanInterest,
        'penalty_amount': penaltyAmount,
        'due': due,
        'paid': paid,
        'balance': balance,
        'loan_id': loanId,
        'organisation_id': organisationId,
      };
}
