class FlowTypeModel {
  int id;
  String name;
  String code;
  String description;
  int isActive;

  FlowTypeModel({
    required this.id,
    required this.name,
    required this.code,
    required this.description,
    required this.isActive,
  });

  factory FlowTypeModel.fromJson(Map<String, dynamic> json) {
    return FlowTypeModel(
      id: json['id'],
      name: json['name'],
      code: json['code'],
      description: json['description'],
      isActive: json['is_active'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'code': code,
      'description': description,
      'is_active': isActive,
    };
  }
}
