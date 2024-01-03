class EmployeeModel {
  String? first_name;
  String? telephone;
  String? email;
  String? addedAt;

  EmployeeModel({
    required this.first_name,
    required this.telephone,
    required this.email,
    required this.addedAt,
  });

  factory EmployeeModel.fromJson(Map<String, dynamic> json) {
    return EmployeeModel(
        first_name: json['first_name'],
        telephone: json['telephone'],
        email: json['email'],
        addedAt: json['created_at']);
  }

  Map<String, dynamic> toJson() {
    return {
      'first_name': first_name,
      'telephone': telephone,
      'email': email,
      'created_at': addedAt,
    };
  }
}
