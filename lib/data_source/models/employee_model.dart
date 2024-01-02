class EmployeeModel {
  String name;
  String telephone;
  String email;
  String addedAt;

  EmployeeModel({
    required this.name,
    required this.telephone,
    required this.email,
    required this.addedAt,
  });

  factory EmployeeModel.fromJson(Map<String, dynamic> json) {
    return EmployeeModel(
        name: json['name'],
        telephone: json['telephone'],
        email: json['email'],
        addedAt: json['created_at']);
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'telephone': telephone,
      'email': email,
      'created_at': addedAt,
    };
  }
}
