class EmployeeModel {
  int? id;
  String? firstName;
  String? middleName;
  String? lastName;
  String? telephone;
  DateTime? dateOfBirth;
  int? gender;
  int? departmentId;
  String? code;
  String? idNumber;
  String? nssfNumber;
  String? tinNumber;
  double? height;
  String? bloodGroup;
  String? personalEmail;
  String? permanentAddress;
  String? presentAddress;
  bool? isAddressSame;
  String? officeNumber;
  String? mobileNumber;
  int? userId;
  int? salutationId;
  int? maritalStatusId;
  DateTime? createdAt;

  EmployeeModel({
    this.id,
    this.firstName,
    this.middleName,
    this.lastName,
    this.telephone,
    this.dateOfBirth,
    this.gender,
    this.departmentId,
    this.code,
    this.idNumber,
    this.nssfNumber,
    this.tinNumber,
    this.height,
    this.bloodGroup,
    this.personalEmail,
    this.permanentAddress,
    this.presentAddress,
    this.isAddressSame,
    this.officeNumber,
    this.mobileNumber,
    this.userId,
    this.salutationId,
    this.maritalStatusId,
    this.createdAt,
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
      createdAt: DateTime.parse(json['created_at'] as String),
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

  static reset(Map<String, dynamic> json) {
    return EmployeeModel(
      id: null,
      firstName: null,
      middleName: null,
      lastName: null,
      telephone: null,
      dateOfBirth: null,
      gender: null,
      departmentId: null,
      code: null,
      idNumber: null,
      nssfNumber: null,
      tinNumber: null,
      height: null,
      bloodGroup: null,
      personalEmail: null,
      permanentAddress: null,
      presentAddress: null,
      isAddressSame: null,
      officeNumber: null,
      mobileNumber: null,
      userId: null,
      salutationId: null,
      maritalStatusId: null,
      createdAt: null,
    );
  }
}
