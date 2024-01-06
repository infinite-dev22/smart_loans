class NationModel {
  int? id;
  String? code;
  String? name;
  String? description;

  NationModel({
    required this.id,
    required this.code,
    required this.name,
    required this.description,
  });

  factory NationModel.fromJson(Map<String, dynamic> json) {
    return NationModel(
      id: json['id'],
      code: json['code'],
      name: json['name'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'code': code,
      'name': name,
      'description': description,
    };
  }
}
