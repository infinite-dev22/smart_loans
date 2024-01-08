class RoleModel {
  final int id;
  final String name;
  final String guardName;

  RoleModel({
    required this.id,
    required this.name,
    required this.guardName,
  });

  factory RoleModel.fromJson(Map<String, dynamic> json) {
    return RoleModel(
      id: json['id'] as int,
      name: json['name'] as String,
      guardName: json['guard_name'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'guard_name': guardName,
    };
  }
}
