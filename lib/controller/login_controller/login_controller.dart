import 'dart:convert';

import 'package:admin_panel_so/models/login_model.dart';
import 'package:admin_panel_so/utils/static.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AdminLoginController extends GetxController {
  static AdminLoginController get to => Get.find();
  Future<LoginResponse> userloginUPMethiod(LoginReqModel model) async {
    http.Response response =
        await http.post(Uri.parse(StaticValues.userLoginUrl),
            headers: <String, String>{
              "Content-type": " application/json-patch+json",
            },
            body: jsonEncode(model.toMap()));

    if (response.statusCode == 200) {
      return LoginResponse.fromMap(jsonDecode(response.body));
    } else {
      throw Exception('Failed To Load Model');
    }
  }
}
