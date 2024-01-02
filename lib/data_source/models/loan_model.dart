
class LoanModel {
  String loanNumber;
  String principalAmount;
  String loanFees;
  String clientId;
  String loanTypeId;
  String loanCategoryId;
  String loanStatusId;
  String currencyId;
  String branchId;

  LoanModel({
    required this.loanNumber,
    required this.principalAmount,
    required this.loanFees,
    required this.clientId,
    required this.loanTypeId,
    required this.loanCategoryId,
    required this.branchId,
    required this.loanStatusId,
    required this.currencyId,
  });

  factory LoanModel.fromJson(Map<String, dynamic> json) {
    return LoanModel(
        loanNumber: json['loanNumber'],
        principalAmount: json['principalAmount'],
        loanFees: json['loanFees'],
        clientId: json['clientId'],
        loanTypeId: json['loanTypeId'],
        loanCategoryId: json['loanCategoryId'],
        branchId: json['branchId'],
        loanStatusId: json['loanStatusId'],
        currencyId: json['currencyId']);
        
  }

  Map<String, dynamic> toJson() {
    return {
      'loanNumber': loanNumber,
      'principalAmount': principalAmount,
      'loanFees': loanFees,
      'clientId': clientId,
      'loanTypeId': loanTypeId,
      'branchId': branchId,
      'loanStatusId': loanStatusId,
      'currencyId': currencyId,
    };
  }
}
