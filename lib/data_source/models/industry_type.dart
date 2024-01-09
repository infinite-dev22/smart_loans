class IndustryTypeModel {
  final int? id;
  final String? name;
  final String? description;
  final String? code;
  final int? isActive;

  IndustryTypeModel({
    this.id,
    this.name,
    this.description,
    this.code,
    this.isActive,
  });

  factory IndustryTypeModel.fromJson(Map<String, dynamic> json) {
    return IndustryTypeModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      code: json['code'],
      isActive: json['is_active'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'code': code,
      'is_active': isActive,
    };
  }
}
