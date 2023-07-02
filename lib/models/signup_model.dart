// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class SignupResponseModel {
  int? adminId;
  String? adminName;
  String? email;
  String? mobileNumber;
  String? password;
  String? registerdateTime;
  int? status;
  SignupResponseModel({
    this.adminId,
    this.adminName,
    this.email,
    this.mobileNumber,
    this.password,
    this.registerdateTime,
    this.status,
  });


  SignupResponseModel copyWith({
    int? adminId,
    String? adminName,
    String? email,
    String? mobileNumber,
    String? password,
    String? registerdateTime,
    int? status,
  }) {
    return SignupResponseModel(
      adminId: adminId ?? this.adminId,
      adminName: adminName ?? this.adminName,
      email: email ?? this.email,
      mobileNumber: mobileNumber ?? this.mobileNumber,
      password: password ?? this.password,
      registerdateTime: registerdateTime ?? this.registerdateTime,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'adminId': adminId,
      'adminName': adminName,
      'email': email,
      'mobileNumber': mobileNumber,
      'password': password,
      'registerdateTime': registerdateTime,
      'status': status,
    };
  }

  factory SignupResponseModel.fromMap(Map<String, dynamic> map) {
    return SignupResponseModel(
      adminId: map['adminId'] != null ? map['adminId'] as int : null,
      adminName: map['adminName'] != null ? map['adminName'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      mobileNumber: map['mobileNumber'] != null ? map['mobileNumber'] as String : null,
      password: map['password'] != null ? map['password'] as String : null,
      registerdateTime: map['registerdateTime'] != null ? map['registerdateTime'] as String : null,
      status: map['status'] != null ? map['status'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory SignupResponseModel.fromJson(String source) => SignupResponseModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'SignupResponseModel(adminId: $adminId, adminName: $adminName, email: $email, mobileNumber: $mobileNumber, password: $password, registerdateTime: $registerdateTime, status: $status)';
  }

  @override
  bool operator ==(covariant SignupResponseModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.adminId == adminId &&
      other.adminName == adminName &&
      other.email == email &&
      other.mobileNumber == mobileNumber &&
      other.password == password &&
      other.registerdateTime == registerdateTime &&
      other.status == status;
  }

  @override
  int get hashCode {
    return adminId.hashCode ^
      adminName.hashCode ^
      email.hashCode ^
      mobileNumber.hashCode ^
      password.hashCode ^
      registerdateTime.hashCode ^
      status.hashCode;
  }
}
