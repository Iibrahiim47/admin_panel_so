import 'dart:convert';
import 'package:admin_panel_so/models/get_branches.dart';
import 'package:admin_panel_so/utils/static.dart';
import 'package:admin_panel_so/utils/static_data.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class GetBranchListController extends GetxController {
  static GetBranchListController get to => Get.find();

  http.Response? response;
  List<Data> allBranchList = [];
  bool loading = false;

  Future<List<Data>> getBranchesMethod() async {
    allBranchList.clear();

    checLoding(true);
    response = await http.get(
      Uri.parse(StaticValues.getBranchUrl),
      headers: <String, String>{
        'Content-type': 'application/json; charset=utf-8',
        "Authorization": " Bearer ${StaticData.token}"
      },
    );

    if (response!.statusCode == 200) {
      print(
          ",,,,,,,,,,,,,,,,,,,store catagory list...........${response!.body.toString()}");
      GetBranchModel model =
          GetBranchModel.fromJson(jsonDecode(response!.body));
      for (int i = 0; i < model.data!.length; i++) {
        Data d = model.data![i];
        allBranchList.add(d);
      }
    }
    print(allBranchList.length);
    update();
    return allBranchList;
  }

  checLoding(bool value) {
    loading = value;
    update();
  }
}
