import 'dart:convert';

import 'package:admin_panel_so/controller/get_branch_controller/get_branch_controller.dart';
import 'package:admin_panel_so/models/add_branch_model.dart';
import 'package:admin_panel_so/utils/static.dart';
import 'package:admin_panel_so/utils/static_data.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AddBranchController extends GetxController {
  static AddBranchController get to => Get.find();
  Future<AddBranchModel> addBranchPMethiod(AddBranchModel model) async {
    print(StaticValues.addBranchUrl);
    http.Response response =
        await http.post(Uri.parse(StaticValues.addBranchUrl),
            headers: <String, String>{
              "Content-type": "application/json-patch+json",
              "Authorization": " Bearer ${StaticData.token}"
            },
            body: jsonEncode(model.toMap()));
    print("Status code-- ${response.statusCode}");
    print(response.body);
    if (response.statusCode == 200) {
      GetBranchListController.to.getBranchesMethod();
      return AddBranchModel.fromMap(jsonDecode(response.body));
    } else {
      throw Exception('Failed To Load Model');
    }
  }
}
