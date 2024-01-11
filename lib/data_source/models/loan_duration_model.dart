class LoanDurationModel {
  int? id;
  String? name;
  String? value;

  LoanDurationModel({
    this.id,
    this.name,
    this.value,
  });

  LoanDurationModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        value = json['value'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'value': value,
      };
}
