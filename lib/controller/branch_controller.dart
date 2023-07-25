// ignore_for_file: deprecated_member_use, prefer_typing_uninitialized_variables

import 'dart:convert';
import 'dart:io';
import 'package:admin_panel_so/models/branch_model.dart';
import 'package:admin_panel_so/sub_admin/controller/sub_admin_profile_controller/sub_admin_profile_controller.dart';
import 'package:admin_panel_so/sub_admin/model/get_category_model.dart';
import 'package:admin_panel_so/utils/static.dart';
import 'package:admin_panel_so/utils/static_data.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:dio/dio.dart' as deo;
import 'package:http/http.dart' as http;

class CategoryGetandPostController extends GetxController {
  static CategoryGetandPostController get to => Get.find();
  var picker = ImagePicker();
  File? addImage;
  bool isImageSelected = false;
  http.Response? response;
  PickedFile? image;
  String? fileName;
  List<BranchModel> allBranchesList = [];
  int? categoryId;
  int selectedCategoryType = 0;
  String dropDownValue = "Food";
  var typeList = ["Food", "Drinks"];

  changeCatoryType(String value) {
    print(value);
    dropDownValue = value;
    if (value == "Food") {
      selectedCategoryType = 1;
    } else {
      selectedCategoryType = 2;
    }
    print(selectedCategoryType);
    update();
  }

  // changeSelectImageStatus(bool value) {
  //   isImageSelected = value;
  //   update();
  // }

  Future addCategoryImage(BuildContext context) async {
    image = await picker.getImage(source: ImageSource.gallery);

    update();
  }

  uploadFooterItem(
    String arName,
    String enName,
  ) async {
    var result;

    List<int> bytes = await image!.readAsBytes();

    try {
      deo.FormData data = deo.FormData.fromMap({
        "Image": deo.MultipartFile.fromBytes(
          bytes,
          filename: basename("${image!.path}.jpg"),
        ),
        "ARName": arName,
        "EngName": enName,
        "CategoryType": selectedCategoryType,
        "BranchId": SubAdminProfileController.to.branchId,
      });
      print("data------${data.fields}");
      deo.Dio dio = deo.Dio();
      var response = await dio.post(
        "https://api.socafe.cafe/api/Categories/AddCategory",
        data: data,
        options: Options(
          headers: <String, String>{
            "Content-type": "multipart/form-data",
            "Authorization": "Bearer ${StaticData.token}"
          },
        ),
      );

      result = response.data;
      print("result ------$result");
      print("Exception = ${response.statusCode}");
      if (response.statusCode == 200) {
        if (response.data != null) {
          getCatagoriesList();
        }
      }
      return response.data;
    } catch (e) {
      print("Exception = $e");
    }
  }

  //////////getbranches///////////

  List<DataList> getCatagoriesListData = [];

  Future<List<DataList>> getCatagoriesList() async {
    getCatagoriesListData.clear();
    print("${SubAdminProfileController.to.branchId}");
    response = await http.get(
      Uri.parse(
          "${StaticValues.getAllCategoryUrl}${SubAdminProfileController.to.branchId}"),
      headers: {
        "Content-type": " application/json-patch+json",
        "Authorization": " Bearer ${StaticData.token}"
      },
    );
    print("ibra ${response!.statusCode}");
    if (response!.statusCode == 200) {
      var catData = GetCatagoryListModel.fromJson(jsonDecode(response!.body));
      for (var u in catData.data!) {
        getCatagoriesListData.add(u);
      }

      print("ibra $getCatagoriesListData");
    }
    return getCatagoriesListData;
  }
}
