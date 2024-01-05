class EmployeeModel {
  final int id;
  final String firstName;
  final String middleName;
  final String lastName;
  final String telephone;
  final DateTime? dateOfBirth;
  final int gender;
  final int departmentId;
  final String code;
  final String idNumber;
  final String nssfNumber;
  final String tinNumber;
  final double? height;
  final String bloodGroup;
  final String personalEmail;
  final String? permanentAddress;
  final String? presentAddress;
  final bool? isAddressSame;
  final String? officeNumber;
  final String? mobileNumber;
  final int userId;
  final int? salutationId;
  final int maritalStatusId;
  final int createdBy;
  final int? updatedBy;
  final DateTime createdAt;
  final DateTime updatedAt;

  EmployeeModel({
    required this.id,
    required this.firstName,
    required this.middleName,
    required this.lastName,
    required this.telephone,
    this.dateOfBirth,
    required this.gender,
    required this.departmentId,
    required this.code,
    required this.idNumber,
    required this.nssfNumber,
    required this.tinNumber,
    this.height,
    required this.bloodGroup,
    required this.personalEmail,
    this.permanentAddress,
    this.presentAddress,
    this.isAddressSame,
    this.officeNumber,
    this.mobileNumber,
    required this.userId,
    this.salutationId,
    required this.maritalStatusId,
    required this.createdBy,
    this.updatedBy,
    required this.createdAt,
    required this.updatedAt,
  });

  factory EmployeeModel.fromJson(Map<String, dynamic> json) {
    return EmployeeModel(
      id: json['id'] as int,
      firstName: json['first_name'] as String,
      middleName: json['middle_name'] as String,
      lastName: json['last_name'] as String,
      telephone: json['telephone'] as String,
      dateOfBirth: json['date_of_birth'] != null
          ? DateTime.parse(json['date_of_birth'] as String)
          : null,
      gender: json['gender'] as int,
      departmentId: json['department_id'] as int,
      code: json['code'] as String,
      idNumber: json['id_number'] as String,
      nssfNumber: json['nssf_number'] as String,
      tinNumber: json['tin_number'] as String,
      height: json['height'] != null ? json['height'] as double : null,
      bloodGroup: json['blood_group'] as String,
      personalEmail: json['personal_email'] as String,
      permanentAddress: json['permanent_address'] as String?,
      presentAddress: json['present_address'] as String?,
      isAddressSame: json['is_address_same'] as bool?,
      officeNumber: json['office_number'] as String?,
      mobileNumber: json['mobile_number'] as String?,
      userId: json['user_id'] as int,
      salutationId: json['salutation_id'] as int?,
      maritalStatusId: json['marital_status_id'] as int,
      createdBy: json['created_by'] as int,
      updatedBy: json['updated_by'] as int?,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'first_name': firstName,
      'middle_name': middleName,
      'last_name': lastName,
      'full_name': "$firstName ${middleName ?? ""} $lastName",
      'telephone': telephone,
      'date_of_birth': dateOfBirth?.toIso8601String(),
      'gender': gender,
      'department_id': departmentId,
      'code': code,
      'id_number': idNumber,
      'nssf_number': nssfNumber,
      'tin_number': tinNumber,
      'height': height,
      'blood_group': bloodGroup,
      'personal_email': personalEmail,
      'permanent_address': permanentAddress,
      'present_address': presentAddress,
      'is_address_same': isAddressSame,
      'office_number': officeNumber,
      'mobile_number': mobileNumber,
      'user_id': userId,
      'salutation_id': salutationId,
      'marital_status_id': maritalStatusId,
      'created_at': createdAt,
    };
  }
}
