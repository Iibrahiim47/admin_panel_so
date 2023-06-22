import 'package:admin_panel_so/models/menue_category_model.dart';
import 'package:admin_panel_so/utils/flushbar.dart';
import 'package:admin_panel_so/utils/static_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

class CategoryCOntroller extends GetxController {
  static CategoryCOntroller get to => Get.find();

  List<MenueCategoryModel> allCategoryList = [];
  bool isImageSelected = false;
  final imagepicker = ImagePicker();
  XFile? catImage;
  String? imageUrl;
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

  addCategoryMethod(
      BuildContext context, String name, String arabic, String img) async {
    // var now = DateTime.now();

    // String date = DateFormat.yMd().add_jm().format(now);

    var uuid = const Uuid();
    String id = uuid.v4();
    Map<String, dynamic> model = {
      "adminId": StaticData.adminId,
      "arabicName": arabic,
      "catId": id,
      "catImage": img,
      "englishName": name,
      "dateTime": FieldValue.serverTimestamp()
    };
    // MenueCategoryModel model = MenueCategoryModel(
    //     adminId: StaticData.adminId,
    //     arabicName: arabic,
    //     catId: id,
    //     catImage: img,
    //     englishName: name,
    //     dateTime: FieldValue.serverTimestamp());

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

    await firebaseFirestore.collection("category").doc(id).set(model);
    // ignore: use_build_context_synchronously
    MyFlushBar.showSimpleFlushBar(
        'Inserted Successfully', context, Colors.green, Colors.white);
    getMyCategoryListMethod();
    changeImageStatus(false);
    clearData();
  }

  Future<List<MenueCategoryModel>> getMyCategoryListMethod() async {
    allCategoryList.clear();
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    QuerySnapshot querySnapshot = await firestore
        .collection("category")
        .orderBy("dateTime", descending: false)
        .get();

    for (var doc in querySnapshot.docs) {
      allCategoryList
          .add(MenueCategoryModel.fromMap(doc.data() as Map<String, dynamic>));
    }

    update();

    return allCategoryList;
  }
}
