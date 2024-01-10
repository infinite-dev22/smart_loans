class LoanStatusModel {
  int? id;
  String? name;
  String? code;
  String? description;

  LoanStatusModel({
    this.id,
    this.name,
    this.code,
    this.description,
  });

  LoanStatusModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        code = json['code'],
        description = json['description'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'code': code,
        'description': description,
      };
}
