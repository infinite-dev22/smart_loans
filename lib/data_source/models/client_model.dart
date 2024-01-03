class ClientModel {
  String? clientNumber;
  String? name;
  String? telephone;
  String? email;
  int? nationality;

  ClientModel({
    required this.clientNumber,
    required this.name,
    required this.telephone,
    required this.email,
    required this.nationality,
  });

  factory ClientModel.fromJson(Map<String, dynamic> json) {
    return ClientModel(
        clientNumber: json['number'],
        name: json['name'],
        telephone: json['telephone'],
        email: json['email'],
        nationality: json['nation_id']);
  }

  Map<String, dynamic> toJson() {
    return {
      'number': clientNumber,
      'name': name,
      'telephone': telephone,
      'email': email,
      'nation_id': nationality,
    };
  }
}
