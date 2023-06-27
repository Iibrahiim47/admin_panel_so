// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class LoginReqModel {
  String? email;
  String? password;
  LoginReqModel({
    this.email,
    this.password,
  });

  LoginReqModel copyWith({
    String? email,
    String? password,
  }) {
    return LoginReqModel(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'password': password,
    };
  }

  factory LoginReqModel.fromMap(Map<String, dynamic> map) {
    return LoginReqModel(
      email: map['email'] != null ? map['email'] as String : null,
      password: map['password'] != null ? map['password'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginReqModel.fromJson(String source) =>
      LoginReqModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'LoginReqModel(email: $email, password: $password)';

  @override
  bool operator ==(covariant LoginReqModel other) {
    if (identical(this, other)) return true;

    return other.email == email && other.password == password;
  }

  @override
  int get hashCode => email.hashCode ^ password.hashCode;
}
