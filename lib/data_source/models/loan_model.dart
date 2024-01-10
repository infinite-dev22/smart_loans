import 'package:smart_loans/data_source/models/branch_model.dart';
import 'package:smart_loans/data_source/models/client_model.dart';
import 'package:smart_loans/data_source/models/currency_model.dart';
import 'package:smart_loans/data_source/models/loan_category_model.dart';
import 'package:smart_loans/data_source/models/loan_status_model.dart';
import 'package:smart_loans/data_source/models/loan_type_model.dart';

class LoanModel {
  int? id;
  String? loanNumber;
  int? principalAmount; // should be double but api returns int.
  int? loanFees; // should be double but api returns int.
  int? loansFeesType;
  String? description;
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
  int? createdBy;
  int? updatedBy;
  String? createdAt;
  String? updatedAt;
  int? organisationId;
  ClientModel? client;
  LoanTypeModel? loanType;
  LoanCategoryModel? loanCategory;
  CurrencyModel? currency;
  BranchModel? branch;
  LoanStatusModel? loanStatus;
  String? branchName;

  LoanModel({
    this.id,
    this.loanNumber,
    this.principalAmount,
    this.loanFees,
    this.clientId,
    this.clientName,
    this.loanTypeId,
    this.loanTypeName,
    this.loansFeesType,
    this.description,
    this.loanCategoryId,
    this.loanCategoryName,
    this.branchId,
    this.branchName,
    this.currencyId,
    this.loanStatusId,
    this.createdBy,
    this.updatedBy,
    this.createdAt,
    this.updatedAt,
    this.organisationId,
    this.client,
    this.loanType,
    this.loanCategory,
    this.currency,
    this.branch,
    this.loanStatus,
    this.loanStatusName,
    this.currencyName,
  });

  LoanModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    loanNumber = json['loan_number'];
    principalAmount = json['principal_amount'];
    loanFees = json['loan_fees'];
    loansFeesType = json['loans_fees_type'];
    description = json['description'];
    clientId = json['client_id'];
    clientName = json['client']['name'];
    loanTypeId = json['loan_type_id'];
    loanTypeName = json['loan_type']['name'];
    loanCategoryId = json['loan_category_id'];
    currencyId = json['currency_id'];
    loanCategoryName = json['loan_category']['name'];
    branchId = json['branch_id'];
    loanStatusId = json['loan_status_id'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    organisationId = json['organisation_id'];
    client = ClientModel.fromJson(json['client']);
    loanType = LoanTypeModel.fromJson(json['loan_type']);
    loanCategory = LoanCategoryModel.fromJson(json['loan_category']);
    currency = CurrencyModel.fromJson(json['currency']);
    branch = BranchModel.fromJson(json['branch']);
    loanStatus = LoanStatusModel.fromJson(json['loan_status']);
    branchName = json['branch']['name'];
    loanStatusId = json['loan_status_id'];
    loanStatusName = json['loan_status']['name'];
    currencyId = json['currency_id'];
    currencyName = json['currency']['name'];
  }

  LoanModel.fromCreateJson(Map<String, dynamic> json) {
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['loan_number'] = loanNumber;
    data['principal_amount'] = principalAmount;
    data['loan_fees'] = loanFees;
    data['loans_fees_type'] = loansFeesType;
    data['description'] = description;
    data['client_id'] = clientId;
    data['loan_type_id'] = loanTypeId;
    data['loan_category_id'] = loanCategoryId;
    data['currency_id'] = currencyId;
    data['branch_id'] = branchId;
    data['loan_status_id'] = loanStatusId;
    data['created_by'] = createdBy;
    data['updated_by'] = updatedBy;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['organisation_id'] = organisationId;
    data['client'] = client?.toApiJson();
    data['loan_type'] = loanType?.toJson();
    data['loan_category'] = loanCategory?.toJson();
    data['currency'] = currency?.toJson();
    data['branch'] = branch?.toJson();
    data['loan_status'] = loanStatus?.toJson();
    return data;
  }

  Map<String, dynamic> toViewJson() {
    return {
      'loan_number': loanNumber,
      'principal': principalAmount,
      'fees': loanFees,
      'client_id': clientId,
      'client': clientName,
      'loan_type_id': loanTypeId,
      'loanType': loanTypeName,
      'loan_category_id': loanCategoryId,
      'loanCategory': loanCategoryName,
      'branch_id': branchId,
      'branch': branchName,
      'loanStatus': loanStatusName,
      'currency_id': currencyId,
      'currency': currencyName,
    };
  }
}
