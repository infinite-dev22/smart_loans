class BranchModel {
  int? id;
  String? name;
  String? address;
  int? organisationId;

  BranchModel({
    this.id,
    this.name,
    this.address,
    this.organisationId,
  });

  BranchModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        address = json['address'],
        organisationId = json['organisation_id'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'address': address,
        'organisation_id': organisationId,
      };
}
