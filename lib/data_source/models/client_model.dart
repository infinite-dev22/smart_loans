class ClientModel {
  String? clientNumber;
  String? name;
  String? telephone;
  String? email;
  String? nationality;
  int? nationId;

  ClientModel({
    this.clientNumber,
    this.name,
    this.telephone,
    this.email,
    this.nationality,
    this.nationId,
  });

  factory ClientModel.fromJson(Map<String, dynamic> json) {
    return ClientModel(
        clientNumber: json['number'],
        name: json['name'],
        telephone: json['telephone'],
        email: json['email'],
        nationality: json['nation']['name']);
  }

  Map<String, dynamic> toJson() {
    return {
      'number': clientNumber,
      'name': name,
      'telephone': telephone,
      'email': email,
      'nationality': nationality,
      'nation_id': nationId,
    };
  }
}
