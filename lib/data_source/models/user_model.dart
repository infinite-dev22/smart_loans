class UserModel {
  final int id;
  final String name;
  final String email;
  final DateTime? emailVerifiedAt;
  final int isActive;
  final String? token;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    this.emailVerifiedAt,
    required this.isActive,
    this.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['user']['id'] as int,
      name: json['user']['name'] as String,
      email: json['user']['email'] as String,
      emailVerifiedAt: json['user']['email_verified_at'] != null
          ? DateTime.parse(json['user']['email_verified_at'] as String)
          : null,
      isActive: json['user']['is_active'] as int,
      token: json['token'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'email_verified_at': emailVerifiedAt?.toIso8601String(),
      'is_active': isActive,
      'token': token,
    };
  }
}
