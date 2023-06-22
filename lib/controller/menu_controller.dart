// ignore_for_file: avoid_print

import 'package:admin_panel_so/models/menu_model.dart';
import 'package:admin_panel_so/models/menue_category_model.dart';
import 'package:admin_panel_so/utils/flushbar.dart';
import 'package:admin_panel_so/utils/static_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

class MenuContreoller extends GetxController {
  static MenuContreoller get to => Get.find();
  String? selectedCategoryName;
  List<MenuModelClass> allMenueList = [];
  MenueCategoryModel? selectedCategory;
  String? selectedCategoryId;
  bool isImageSelected = false;
  final imagepicker = ImagePicker();
  XFile? catImage;
  String? imageUrl;

  Future<void> deleteImage() async {
    final Reference firebaseStorageRef =
        FirebaseStorage.instance.ref().child('/image');
    await firebaseStorageRef.delete();
  }

  changeImageStatus(bool v) {
    isImageSelected = v;
  }

  Future<XFile> getFromGallery(
    BuildContext context,
  ) async {
    final XFile? pickedFile =
        await imagepicker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      catImage = pickedFile;
    } else {
      // ignore: use_build_context_synchronously
      MyFlushBar.showSimpleFlushBar(
          "select image", context, Colors.red, Colors.white);
    }
    update();
    uploadImage(catImage!);
    return catImage!;
  }

  Future deletestorage() async {}

// post image on firebase
  Future postImage(XFile? imagefile) async {
    String urls;
    Reference ref =
        FirebaseStorage.instance.ref().child('/image').child(imagefile!.name);
    await ref.putData(
        await imagefile.readAsBytes(),
        SettableMetadata(
          contentType: "image/jpeg",
        ));
    urls = await ref.getDownloadURL();
    return urls;
  }

  uploadImage(XFile image) async {
    await postImage(image).then((value) {
      imageUrl = value;
      changeImageStatus(true);
    });

    update();
  }

  clearData() {
    imageUrl = null;
    update();
  }

  addMenueMethod(BuildContext context, String name, String arabic, String img,
      String description, String category, String price) async {
    //var now = DateTime.now();

    // String date = DateFormat.yMd().add_jm().format(now);

    var uuid = const Uuid();
    String id = uuid.v4();
    // Map<String, dynamic> model = {
    //     "adminId": StaticData.adminId,
    //     "arabicName": arabic,
    //     "catId": id,
    //     "catImage": img,
    //     "englishName": name,
    //     "dateTime": FieldValue.serverTimestamp()
    //   };
    Map<String, dynamic> model = {
      "addedby": StaticData.adminModel!.fullName,
      "arabicName": arabic,
      "menuid": id,
      "description": description,
      "image": img,
      "name": name,
      "price": price,
      "catId": selectedCategoryId,
      "dateTime": FieldValue.serverTimestamp()
    };

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

    await firebaseFirestore.collection("menues").doc(id).set(model);
    // ignore: use_build_context_synchronously
    MyFlushBar.showSimpleFlushBar(
        'Inserted Successfully', context, Colors.green, Colors.white);
    getMyMenueListMethod();
    changeImageStatus(false);
    clearData();
  }

  Future<List<MenuModelClass>> getMyMenueListMethod() async {
    allMenueList.clear();
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    QuerySnapshot querySnapshot = await firestore
        .collection("menues")
        .orderBy("dateTime", descending: false)
        .get();

    for (var doc in querySnapshot.docs) {
      allMenueList
          .add(MenuModelClass.fromMap(doc.data() as Map<String, dynamic>));
    }

    update();

    return allMenueList;
  }

///////////////////// Depart Drop Down//////////////////////////////
  List<DropdownMenuItem<MenueCategoryModel>> buildCategoryDropdownMenuItems(
      List<MenueCategoryModel> categoryList) {
    print("categoryList list=${categoryList.length}");
    List<DropdownMenuItem<MenueCategoryModel>> items = [];
    for (MenueCategoryModel category in categoryList) {
      items.add(
        DropdownMenuItem(
          value: category,
          child: Text(category.englishName!),
        ),
      );
    }
    update();
    print("item list=${items.length}");
    return items;
  }

  onCategoryChangeDropdownItem(MenueCategoryModel? mySelectedCategory) {
    selectedCategory = mySelectedCategory;
    selectedCategoryName = mySelectedCategory!.englishName;
    selectedCategoryId = mySelectedCategory.catId;
    update();
  }
}
