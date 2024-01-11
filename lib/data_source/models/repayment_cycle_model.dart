class RepaymentCycleModel {
  int id;
  String name;
  String? description;

  RepaymentCycleModel({
    required this.id,
    required this.name,
    this.description,
  });

  RepaymentCycleModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        description = json['description'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
      };
}
