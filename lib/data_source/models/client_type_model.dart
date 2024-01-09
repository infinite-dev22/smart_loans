class ClientTypeModel {
  int? id;
  String? name;
  String? code;
  String? description;
  int? isIndividual;

  ClientTypeModel({
    this.id,
    this.name,
    this.code,
    this.description,
    this.isIndividual,
  });

  factory ClientTypeModel.fromJson(Map<String?, dynamic> json) {
    return ClientTypeModel(
      id: json['id'],
      name: json['name'],
      code: json['code'],
      description: json['description'],
      isIndividual: json['is_individual'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'code': code,
      'description': description,
      'is_individual': isIndividual,
    };
  }
}
