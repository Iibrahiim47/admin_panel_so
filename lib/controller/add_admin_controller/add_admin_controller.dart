import 'dart:convert';

import 'package:admin_panel_so/controller/get_users_profile_ontroller/get_user_profile_controller.dart';
import 'package:admin_panel_so/models/get_branches.dart';
import 'package:admin_panel_so/models/signup_model.dart';
import 'package:admin_panel_so/utils/static.dart';
import 'package:admin_panel_so/utils/static_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AddadminController extends GetxController {
  static AddadminController get to => Get.find();
  String adminName = "ADMIN NAME";
  String branchName = "BRANCH NAME";
  String? selectedBranchName;
  String? selectedBranchAddress;
  int? selectedBranchId;
  Data? selectedBranch;
  Future<SignupResponseModel> addadminMethiod(SignupResponseModel model) async {
    print(StaticValues.userLoginUrl);
    http.Response response =
        await http.post(Uri.parse(StaticValues.userSignUpUrl),
            headers: <String, String>{
              "Content-type": " application/json-patch+json",
              "Authorization": " Bearer ${StaticData.token}"
            },
            body: jsonEncode(model.toMap()));
    print("Status code-- ${response.statusCode}");
    print(response.body);
    if (response.statusCode == 200) {
      GetuserProfileController.to.getuserProfileMethod();
      return SignupResponseModel.fromMap(jsonDecode(response.body));
    } else {
      throw Exception('Failed To Load Model');
    }
  }

  ////////////////////// Depart Drop Down//////////////////////////////
  List<DropdownMenuItem<Data>> buildBranchDropdownMenuItems(
      List<Data> branchList) {
    print("branch list=${branchList.length}");
    List<DropdownMenuItem<Data>> items = [];
    for (Data branch in branchList) {
      items.add(
        DropdownMenuItem(
          value: branch,
          child: Text(branch.name!),
        ),
      );
    }
    print("item list=${items.length}");
    return items;
  }

  onBranchChangeDropdownItem(Data? mySelectedBranch) {
    selectedBranch = mySelectedBranch;
    selectedBranchName = mySelectedBranch!.name;
    selectedBranchAddress = mySelectedBranch.address;
    selectedBranchId = mySelectedBranch.branchId;

    update();
  }
}
