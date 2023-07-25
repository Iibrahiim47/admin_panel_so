import 'dart:convert';
import 'package:admin_panel_so/models/get_users_model.dart';
import 'package:admin_panel_so/utils/static.dart';
import 'package:admin_panel_so/utils/static_data.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class GetuserProfileController extends GetxController {
  static GetuserProfileController get to => Get.find();

  http.Response? response;
  List<Data> ownerProfile = [];

  Future<List<Data>> getuserProfileMethod() async {
    ownerProfile.clear();

    response = await http.get(
      Uri.parse(StaticValues.getUserUrl),
      headers: <String, String>{
        'Content-type': 'application/json; charset=utf-8',
        "Authorization": " Bearer ${StaticData.token}"
      },
    );
    if (response!.statusCode == 200) {
      GetUsersProfile model =
          GetUsersProfile.fromJson(jsonDecode(response!.body));
      for (int i = 0; i < model.data!.length; i++) {
        Data d = model.data![i];
        ownerProfile.add(d);
      }
    }
    print("lala tabaha ssheee");
    print(ownerProfile.length);
    update();
    return ownerProfile;
  }
}
