class InterestModel {
  int? id;
  int? loanId;
  int? interestMethod;
  int? interestPeriod;
  int? repaymentCycleId;
  String? loanDurationPeriod;
  int? interestType;
  String? interestAmount;
  String? percentage;
  int? loanDurationId;
  String? installments;

  InterestModel({
    this.id,
    this.loanId,
    this.interestMethod,
    this.interestPeriod,
    this.repaymentCycleId,
    this.loanDurationPeriod,
    this.interestType,
    this.interestAmount,
    this.percentage,
    this.loanDurationId,
    this.installments,
  });

  factory InterestModel.fromJson(Map<String, dynamic> json) {
    return InterestModel(
      id: json['id'],
      loanId: json['loan_id'],
      interestMethod: json['interest_method'],
      interestPeriod: json['interest_period'],
      repaymentCycleId: json['repayment_cylce_id'],
      loanDurationPeriod: json['loan_duration_period'],
      interestType: json['interest_type'],
      interestAmount: json['interest_amount'],
      percentage: json['percentage'],
      loanDurationId: json['loan_duration_id'],
      installments: json['installments'],
    );
  }

  factory InterestModel.fromApiJson(Map<String, dynamic> json) {
    return InterestModel(
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'loan_id': loanId,
      'interest_method_id': interestMethod,
      'interest_period_id': interestPeriod,
      'repayment_cylce_id': repaymentCycleId,
      'loan_duration_period': loanDurationPeriod,
      'interest_type': interestType,
      'interest_amount': interestAmount,
      'percentage': percentage,
      'loan_duration_id': loanDurationId,
      'installments': installments,
    };
  }
}
