import 'package:smart_loans/data_source/models/client_type_model.dart';
import 'package:smart_loans/data_source/models/document_model.dart';
import 'package:smart_loans/data_source/models/nation_model.dart';

class ClientModel {
  int? id;
  String? name;
  String? firstName;
  String? lastName;
  String? otherName;
  String? occupation;
  String? address;
  String? tin;
  String? number;
  String? email;
  String? telephone;
  int? clientTypeId;
  int? inCharge;
  int? nationId;
  int? businessIndustryId;
  NationModel? nation;
  dynamic clientProfile;
  List<DocumentModel>? documents;
  ClientTypeModel? clientType;

  factory ClientModel.fromJson(Map<String, dynamic> json) {
    return ClientModel(
      id: json['id'],
      name: json['name'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      otherName: json['other_name'],
      address: json['address'],
      tin: json['tin'],
      number: json['number'],
      email: json['email'],
      telephone: json['telephone'],
      clientTypeId: json['client_type_id'],
      inCharge: json['in_charge'],
      nationId: json['nation_id'],
      businessIndustryId: json['business_industry_id'],
      nation:
          json['nation'] != null ? NationModel.fromJson(json['nation']) : null,
      clientProfile: json['client_profile'],
      documents: json['documents'] != null
          ? List<DocumentModel>.from(
              json['documents'].map((doc) => DocumentModel.fromJson(doc)))
          : null,
      clientType: json['client_type'] != null
          ? ClientTypeModel.fromJson(json['client_type'])
          : null,
    );
  }

  static reset() {
    return ClientModel(
      id: null,
      name: null,
      address: null,
      tin: null,
      number: null,
      email: null,
      telephone: null,
      clientTypeId: null,
      inCharge: null,
      nationId: null,
      businessIndustryId: null,
      nation: null,
      clientProfile: null,
      documents: null,
      clientType: null,
    );
  }

  Map<String, dynamic> toViewJson() {
    return {
      'id': id,
      'name': name,
      'address': address,
      'tin': tin,
      'number': number,
      'email': email,
      'telephone': telephone,
      'client_type_id': clientTypeId,
      'in_charge': inCharge,
      'nation_id': nationId,
      'business_industry_id': businessIndustryId,
      'nationality': nation!.name,
      'client_profile': clientProfile,
      'documents': documents!.map((doc) => doc.toJson()).toList(),
      'client_type': clientType!.toJson(),
    };
  }

  Map<String, dynamic> toApiJson() {
    return {
      'first_name': firstName,
      'middle_name': otherName,
      'last_name': lastName,
      'name': name,
      'address': address,
      'tin': tin,
      'number': number,
      'email': email,
      'telephone': telephone,
      'client_type_id': clientTypeId,
      'in_charge': inCharge ?? 1,
      'nation_id': nationId,
      'business_industry_id': businessIndustryId,
      'client_profile': clientProfile,
      "organisation_id": 1,
    };
  }

  ClientModel(
      {this.id,
      this.name,
      this.firstName,
      this.lastName,
      this.otherName,
      this.occupation,
      this.address,
      this.tin,
      this.number,
      this.email,
      this.telephone,
      this.clientTypeId,
      this.inCharge,
      this.nationId,
      this.businessIndustryId,
      this.nation,
      this.clientProfile,
      this.documents,
      this.clientType});
}
