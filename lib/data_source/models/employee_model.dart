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
  String? department;
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
  int? nationId;
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
    this.department,
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
    this.nationId,
    this.createdAt,
  });

  factory EmployeeModel.fromJson(Map<String, dynamic> json) {
    return EmployeeModel(
      id: json['id'],
      firstName: json['first_name'],
      middleName: json['middle_name'],
      lastName: json['last_name'],
      telephone: json['telephone'],
      dateOfBirth: json['date_of_birth'] != null
          ? DateTime.parse(json['date_of_birth'])
          : null,
      gender: json['gender'],
      departmentId: json['department_id'],
      department: json['department_name'],
      code: json['code'],
      idNumber: json['id_number'],
      nssfNumber: json['nssf_number'],
      tinNumber: json['tin_number'],
      height: json['height'] != null ? json['height'] : null,
      bloodGroup: json['blood_group'],
      personalEmail: json['personal_email'],
      permanentAddress: json['permanent_address'],
      presentAddress: json['present_address'],
      isAddressSame: json['is_address_same'],
      officeNumber: json['office_number'],
      mobileNumber: json['mobile_number'],
      userId: json['user_id'],
      salutationId: json['salutation_id'],
      maritalStatusId: json['marital_status_id'],
      createdAt: DateTime.parse(json['created_at']),
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
      'role': department,
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

  Map<String, dynamic> toApiJson() {
    return {
      'firstName': firstName,
      'middleName': middleName,
      'secondName': lastName,
      'gender': gender,
      'department_id': departmentId,
      'date_of_birth': dateOfBirth?.toIso8601String(),
      'code': code,
      'id_number': idNumber,
      'nssf_number': nssfNumber,
      'tin_number': tinNumber,
      'blood_group': bloodGroup,
      'personal_email': personalEmail,
      'permanent_address': permanentAddress,
      'present_address': presentAddress,
      'is_address_same': isAddressSame,
      'office_number': officeNumber,
      'mobile_number': mobileNumber,
      'height': height,
      "address": "Kampala",
      "countryOfOrigin": nationId,
      "marital_status_id": maritalStatusId,
      "email": personalEmail,
      "telephone":telephone,
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
