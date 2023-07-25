// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';

import 'package:admin_panel_so/controller/branch_controller.dart';
import 'package:admin_panel_so/models/menu_model.dart';
import 'package:admin_panel_so/sub_admin/controller/sub_admin_profile_controller/sub_admin_profile_controller.dart';
import 'package:admin_panel_so/sub_admin/model/get_category_model.dart';
import 'package:admin_panel_so/sub_admin/model/get_product_model.dart';
import 'package:admin_panel_so/sub_admin/model/get_slider_model.dart' as slider;
import 'package:admin_panel_so/utils/static.dart';
import 'package:admin_panel_so/utils/static_data.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart' as deo;

class MenuContreoller extends GetxController {
  static MenuContreoller get to => Get.find();
  String? selectedCategoryName;
  List<MenuModelClass> allMenueList = [];
  DataList? selectedCategory;
  int? selectedCategoryId;
  bool isImageSelected = false;
  final imagepicker = ImagePicker();
  XFile? catImage;
  String? imageUrl;
  var picker = ImagePicker();
  File? addImage;
  http.Response? response;
  int? sliderId;

  PickedFile? image;
  PickedFile? sliderImage;

  String? fileName;

  Future deletestorage() async {}

///////////////////// Depart Drop Down//////////////////////////////
  List<DropdownMenuItem<DataList>> buildCategoryDropdownMenuItems(
      List<DataList> categoryList) {
    print("categoryList list=${categoryList.length}");
    List<DropdownMenuItem<DataList>> items = [];
    for (DataList category in categoryList) {
      items.add(
        DropdownMenuItem(
          value: category,
          child: Text(category.engName!),
        ),
      );
    }
    update();
    print("item list=${items.length}");
    return items;
  }

  onCategoryChangeDropdownItem(DataList? mySelectedCategory) {
    selectedCategory = mySelectedCategory;
    selectedCategoryName = mySelectedCategory!.engName;
    selectedCategoryId = mySelectedCategory.categoryId!;
    update();
  }

///////////////////////////////////////////////server
  Future addProductImage(BuildContext context) async {
    image =
        await picker.getImage(source: ImageSource.gallery, imageQuality: 80);
    addImage = File(image!.path);
    update();
  }

  addProductItem(
    String arName,
    String enName,
    String description,
    String price,
  ) async {
    var result;

    List<int> bytes = await image!.readAsBytes();

    try {
      deo.FormData data = deo.FormData.fromMap({
        "EngName": enName,
        "AraName": arName,
        "Description": description,
        "Price": price,
        "CategoryId": MenuContreoller.to.selectedCategoryId,
        "Image": deo.MultipartFile.fromBytes(
          bytes,
          filename: basename("${image!.path}.jpg"),
        ),
      });
      print("chacha------${data.fields}");
      deo.Dio dio = deo.Dio();
      var response = await dio.post(
        StaticValues.addProductUrl,
        data: data,
        options: Options(
          headers: <String, String>{
            "Content-type": "multipart/form-data",
            "Authorization": "Bearer ${StaticData.token}"
          },
        ),
      );
      result = response.data;

      if (response.statusCode == 200) {
        if (response.data != null) {}
      }
      return response.data;
    } catch (e) {
      print("Exception = $e");
    }
  }

  //////////getProducts///////////

  List<Data> getProductListData = [];

  Future<List<Data>> getProductList() async {
    getProductListData.clear();
    print(
        "${StaticValues.getproducteUrl}${CategoryGetandPostController.to.categoryId}");
    response = await http.get(
      Uri.parse(
          "${StaticValues.getproducteUrl}${CategoryGetandPostController.to.categoryId}"),
      headers: {
        "Content-type": " application/json-patch+json",
        // "Authorization": " Bearer ${StaticData.token}"
      },
    );
    print("response of menu is----- ${response!.statusCode}");
    print(response!.body);
    if (response!.statusCode == 200) {
      var catData = GetProductModel.fromJson(jsonDecode(response!.body));
      for (var u in catData.data!) {
        getProductListData.add(u);
      }
      print("getCatagoriesListData $getProductListData");
    }
    update();
    return getProductListData;
  }

  /////////////////caroselslideruploadmethor///////////////
  Future addSliderImage(BuildContext context) async {
    sliderImage = await picker.getImage(source: ImageSource.gallery);

    update();
  }

  addSliderItem() async {
    var result;

    List<int> bytes = await sliderImage!.readAsBytes();
    print(SubAdminProfileController.to.branchId);

    try {
      deo.FormData data = deo.FormData.fromMap({
        "BranchId": SubAdminProfileController.to.branchId,
        "Image": deo.MultipartFile.fromBytes(
          bytes,
          filename: basename("${sliderImage!.path}.jpg"),
        ),
      });
      print("slider list------${data.fields}");
      print(sliderImage!.path);
      deo.Dio dio = deo.Dio();
      var response = await dio.post(
        StaticValues.addSliderUrl,
        data: data,
        options: Options(
          headers: <String, String>{
            "Content-type": "multipart/form-data",
          },
        ),
      );
      result = response.data;

      if (response.statusCode == 200) {
        if (response.data != null) {}
      }
      return response.data;
    } catch (e) {
      print("Exception = $e");
    }
    update();
  }

  ///////////getsliderimagemethod////////
  List<slider.Data> getSliderListData = [];

  Future<List<slider.Data>> getSliderList() async {
    getSliderListData.clear();
    response = await http.get(
      Uri.parse(
          "${StaticValues.getSliderUrl}${SubAdminProfileController.to.branchId}"),
      headers: {
        "Content-type": " application/json-patch+json",
      },
    );
    print("response of menu is----- ${response!.statusCode}");
    print(response!.body);
    if (response!.statusCode == 200) {
      var catData = slider.GetSliderModel.fromJson(jsonDecode(response!.body));
      for (var u in catData.data!) {
        getSliderListData.add(u);
      }
      print("getCatagoriesListData $getSliderListData");
      sliderId = getSliderListData.first.sliderId;
    }
    return getSliderListData;
  }
}
