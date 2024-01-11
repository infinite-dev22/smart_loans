class InterestMethodModel {
  int id;
  String name;
  String? description;

  InterestMethodModel({
    required this.id,
    required this.name,
    this.description,
  });

  InterestMethodModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        description = json['description'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
      };
}
