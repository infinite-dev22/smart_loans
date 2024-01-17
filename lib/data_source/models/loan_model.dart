import 'package:intl/intl.dart';
import 'package:smart_loans/data_source/models/branch_model.dart';
import 'package:smart_loans/data_source/models/client_model.dart';
import 'package:smart_loans/data_source/models/currency_model.dart';
import 'package:smart_loans/data_source/models/interest_model.dart';
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
  InterestModel? interest;
  LoanStatusModel? loanStatus;
  String? branchName;
  String? flowType;

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
    this.interest,
    this.loanStatus,
    this.loanStatusName,
    this.flowType,
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
  }

  LoanModel.fromJsonToView(Map<String, dynamic> json) {
    id = json['id'];
    loanNumber = json['loan_number'];
    loansFeesType = json['loans_fees_type'];
    description = json['description'];
    clientId = json['client_id'];
    loanTypeId = json['loan_type_id'];
    loanCategoryId = json['loan_category_id'];
    currencyId = json['currency_id'];
    branchId = json['branch_id'];
    loanStatusId = json['loan_status_id'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    organisationId = json['organisation_id'];
    loanStatusId = json['loan_status_id'];
    currencyId = json['currency_id'];
  }

  LoanModel.fromApiJson(Map<String, dynamic> json) {
    id = json['id'];
    loanNumber = json['loan_number'];
    principalAmount = json['principal_amount'];
    loanFees = json['loan_fees'];
    loansFeesType = json['loans_fees_type'];
    description = json['description'];
    clientId = json['client_id'];
    clientName = json['client']['name'];
    loanTypeId = json['loan_type_id'];
    // loanTypeName = json['loan_type']['name'];
    loanCategoryId = json['loan_category_id'];
    currencyId = json['currency_id'];
    // loanCategoryName = json['loan_category']['name'];
    branchId = json['branch_id'];
    loanStatusId = json['loan_status_id'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    organisationId = json['organisation_id'];
    client = ClientModel.fromJson(json['client']);
    // loanType = LoanTypeModel.fromJson(json['loan_type']);
    // loanCategory = LoanCategoryModel.fromJson(json['loan_category']);
    // currency = CurrencyModel.fromJson(json['currency']);
    // branch = BranchModel.fromJson(json['branch']);
    interest = json['loan_interest'] != null
        ? InterestModel.fromJson(json['loan_interest'])
        : null;
    // loanStatus = LoanStatusModel.fromJson(json['loan_status']);
    loanStatusId = json['loan_status_id'];
    // loanStatusName = json['loan_status']['name'];
    currencyId = json['currency_id'];
    // currencyName = json['currency']['name'];
    flowType = json['flowType']['code'];
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
    data['client_name'] = clientName;
    data['loan_type_name'] = loanType?.name;
    data['loan_category_name'] = loanCategory?.name;
    data['currency_name'] = currency?.name;
    data['branch_name'] = branch?.name;
    data['loan_status_name'] = loanStatus?.name;
    return data;
  }

  Map<String, dynamic> toViewJson() {
    var format = NumberFormat("###,###.##");
    return {
      'id': id,
      'loan_number': loanNumber,
      'client_name': clientName,
      'principal_amount':
          "${principalAmount != null ? "${currency!.code!} " : ""}${principalAmount != null ? format.format(principalAmount) : principalAmount}",
      'loan_fees':
          "${loanFees != null ? "${currency!.code!} " : ""}${loanFees != null ? format.format(loanFees) : loanFees}",
      'client': clientName,
      'loan_type_name': loanTypeName,
      'loan_category_name': loanCategoryName,
      'branch_name': branchName,
      'loan_status_name': loanStatusName,
    };
  }
}
