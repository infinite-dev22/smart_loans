class LoanCategoryModel {
  int? id;
  String? name;
  String? description;

  LoanCategoryModel({
    this.id,
    this.name,
    this.description,
  });

  LoanCategoryModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        description = json['description'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
      };
}
