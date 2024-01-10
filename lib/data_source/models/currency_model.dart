class CurrencyModel {
  int? id;
  String? name;
  String? code;
  int? isActive;

  CurrencyModel({
    this.id,
    this.name,
    this.code,
    this.isActive,
  });

  CurrencyModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        code = json['code'],
        isActive = json['is_active'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'code': code,
        'is_active': isActive,
      };
}
