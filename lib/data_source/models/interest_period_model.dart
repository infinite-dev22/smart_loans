class InterestPeriodModel {
  int id;
  String name;
  String value;

  InterestPeriodModel({
    required this.id,
    required this.name,
    required this.value,
  });

  InterestPeriodModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        value = json['value'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'value': value,
      };
}
