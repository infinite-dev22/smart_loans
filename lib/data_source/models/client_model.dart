class ClientModel {
  String clientNumber;
  String name;
  String telephone;
  String email;
  String nationality;

  ClientModel({
    required this.clientNumber,
    required this.name,
    required this.telephone,
    required this.email,
    required this.nationality,
  });

  factory ClientModel.fromJson(Map<String, dynamic> json) {
    return ClientModel(
        clientNumber: json['clientNumber'],
        name: json['name'],
        telephone: json['telephone'],
        email: json['email'],
        nationality: json['nationality']);
  }

  Map<String, dynamic> toJson() {
    return {
      'clientNumber': clientNumber,
      'name': name,
      'telephone': telephone,
      'email': email,
      'nationality': nationality,
    };
  }
}
