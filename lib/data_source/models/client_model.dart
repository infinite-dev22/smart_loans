import 'package:smart_loans/data_source/models/client_type_model.dart';
import 'package:smart_loans/data_source/models/document_model.dart';
import 'package:smart_loans/data_source/models/nation_model.dart';

class ClientModel {
  int? id;
  String? name;
  String? address;
  String? tin;
  String? number;
  String? email;
  String? telephone;
  int? clientTypeId;
  int? inCharge;
  int? nationId;
  int? businessIndustryId;
  NationModel nation;
  dynamic clientProfile;
  List<DocumentModel> documents;
  ClientTypeModel clientType;

  ClientModel({
    required this.id,
    required this.name,
    required this.address,
    required this.tin,
    required this.number,
    required this.email,
    required this.telephone,
    required this.clientTypeId,
    required this.inCharge,
    required this.nationId,
    required this.businessIndustryId,
    required this.nation,
    required this.clientProfile,
    required this.documents,
    required this.clientType,
  });

  factory ClientModel.fromJson(Map<String, dynamic> json) {
    return ClientModel(
      id: json['id'],
      name: json['name'],
      address: json['address'],
      tin: json['tin'],
      number: json['number'],
      email: json['email'],
      telephone: json['telephone'],
      clientTypeId: json['client_type_id'],
      inCharge: json['in_charge'],
      nationId: json['nation_id'],
      businessIndustryId: json['business_industry_id'],
      nation: NationModel.fromJson(json['nation']),
      clientProfile: json['client_profile'],
      documents: List<DocumentModel>.from(
          json['documents'].map((doc) => DocumentModel.fromJson(doc))),
      clientType: ClientTypeModel.fromJson(json['client_type']),
    );
  }

  Map<String, dynamic> toJson() {
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
      'nation': nation.toJson(),
      'client_profile': clientProfile,
      'documents': documents.map((doc) => doc.toJson()).toList(),
      'client_type': clientType.toJson(),
    };
  }
}
