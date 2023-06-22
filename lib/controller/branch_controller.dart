import 'package:admin_panel_so/controller/admin_main_controller.dart';
import 'package:admin_panel_so/models/branch_model.dart';

import 'package:admin_panel_so/utils/flushbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

class BranchController extends GetxController {
  static BranchController get to => Get.find();

  List<BranchModel> allBranchesList = [];

  addBranchMethod(BuildContext context, String name, String address) async {
    var now = DateTime.now();

    String date = DateFormat.yMd().add_jm().format(now);

    var uuid = const Uuid();
    String id = uuid.v4();

    BranchModel model = BranchModel(
        addedBy: AdminMainController.to.adminName,
        branchAddress: address,
        branchId: id,
        branchName: name,
        dateTime: date);

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

    await firebaseFirestore.collection("branches").doc(id).set(model.toMap());
    // ignore: use_build_context_synchronously
    MyFlushBar.showSimpleFlushBar(
        'Inserted Successfully', context, Colors.green, Colors.white);
    getMyBranchesListMethod();
  }

  Future<List<BranchModel>> getMyBranchesListMethod() async {
    allBranchesList.clear();
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    QuerySnapshot querySnapshot = await firestore.collection("branches").get();

    for (var doc in querySnapshot.docs) {
      allBranchesList
          .add(BranchModel.fromMap(doc.data() as Map<String, dynamic>));
    }

    update();

    return allBranchesList;
  }
}
