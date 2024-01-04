class LoanModel {
  String? loanNumber;
  double? principalAmount;
  double? loanFees;
  int? clientId;
  String? clientName;
  int? loanTypeId;
  String? loanTypeName;
  int? loanCategoryId;
  String? loanCategoryName;
  int? loanStatusId;
  String? loanStatusName;
  int? currencyId;
  String? currencyName;
  int? branchId;
  String? branchName;


  LoanModel({
    required this.loanNumber,
    required this.principalAmount,
    required this.loanFees,
    required this.clientId,
    required this.clientName,
    required this.loanTypeId,
    required this.loanTypeName,
    required this.loanCategoryId,
    required this.loanCategoryName,
    required this.branchId,
    required this.branchName,
    required this.loanStatusId,
    required this.loanStatusName,
    required this.currencyId,
    required this.currencyName,
  });

  factory LoanModel.fromJson(Map<String, dynamic> json) {
    return LoanModel(
        loanNumber: json['loan_number'],
        principalAmount: json['principal_amount'],
        loanFees: json['loan_fees'],
        clientId: json['client_id'],
        clientName: json['client']['name'],
        loanTypeId: json['loan_type_id'],
        loanTypeName: json['loan_type']['name'],
        loanCategoryId: json['loan_category_id'],
        loanCategoryName: json['loan_category']['name'],
        branchId: json['branch_id'],
        branchName: json['branch']['name'],
        loanStatusId: json['loan_status_id'],
        loanStatusName: json['loan_status']['name'],
        currencyId: json['currency_id'],
        currencyName: json['currency']['name']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'loan_number': loanNumber,
      'principal': principalAmount,
      'fees': loanFees,
      'client_id': clientId,
      'client': clientName,
      'loan_type_id': loanTypeId,
      'loanType': loanTypeName,
      'loan_category_id':loanCategoryId,
      'loanCategory':loanCategoryName,
      'branch_id': branchId,
      'branch': branchName,
      'loanStatus': loanStatusName,
      'currency_id': currencyId,
      'currency': currencyName,
    };
  }
}
