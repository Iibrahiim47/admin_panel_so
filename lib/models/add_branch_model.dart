// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class AddBranchModel {
  String? branchName;
  String? branchAddress;
  Timestamp? createdDateTime;
  int? status;
  String? branchimg;
  AddBranchModel({
    this.branchName,
    this.branchAddress,
    this.createdDateTime,
    this.status,
    this.branchimg,
  });

  AddBranchModel copyWith({
    String? branchName,
    String? branchAddress,
    Timestamp? createdDateTime,
    int? status,
    String? branchimg,
  }) {
    return AddBranchModel(
      branchName: branchName ?? this.branchName,
      branchAddress: branchAddress ?? this.branchAddress,
      createdDateTime: createdDateTime ?? this.createdDateTime,
      status: status ?? this.status,
      branchimg: branchimg ?? this.branchimg,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'branchName': branchName,
      'branchAddress': branchAddress,
      'createdDateTime': createdDateTime,
      'status': status,
      'branchimg': branchimg,
    };
  }

  factory AddBranchModel.fromMap(Map<String, dynamic> map) {
    return AddBranchModel(
      branchName:
          map['branchName'] != null ? map['branchName'] as String : null,
      branchAddress:
          map['branchAddress'] != null ? map['branchAddress'] as String : null,
      createdDateTime: map['createdDateTime'] != null
          ? map['createdDateTime'] as Timestamp
          : null,
      status: map['status'] != null ? map['status'] as int : null,
      branchimg: map['branchimg'] != null ? map['branchimg'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory AddBranchModel.fromJson(String source) =>
      AddBranchModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AddBranchModel(branchName: $branchName, branchAddress: $branchAddress, createdDateTime: $createdDateTime, status: $status, branchimg: $branchimg)';
  }

  @override
  bool operator ==(covariant AddBranchModel other) {
    if (identical(this, other)) return true;

    return other.branchName == branchName &&
        other.branchAddress == branchAddress &&
        other.createdDateTime == createdDateTime &&
        other.status == status &&
        other.branchimg == branchimg;
  }

  @override
  int get hashCode {
    return branchName.hashCode ^
        branchAddress.hashCode ^
        createdDateTime.hashCode ^
        status.hashCode ^
        branchimg.hashCode;
  }
}
