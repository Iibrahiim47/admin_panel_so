// ignore_for_file: avoid_print

import 'package:admin_panel_so/models/admin_model.dart';
import 'package:admin_panel_so/models/branch_model.dart';
import 'package:admin_panel_so/screens/dashboard.dart';
import 'package:admin_panel_so/utils/flushbar.dart';
import 'package:admin_panel_so/utils/static_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';     

class AdminMainController extends GetxController {
  static AdminMainController get to => Get.find();
  String menue = "home";
  String adminName = "ADMIN NAME";
  String branchName = "BRANCH NAME";
  String? selectedBranchName;
  String? selectedBranchAddress;
  String? selectedBranchId;
  BranchModel? selectedBranch;
  List<AdminModel> allAdminList = [];
  changeMenue(String v) {
    menue = v;
    update();
  }

  adminLoginMethod(String email, String pass, BuildContext context) async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection("admins")
        .where("email", isEqualTo: email)
        .where("password", isEqualTo: pass)
        .get();

    if (querySnapshot.docs.isEmpty) {
      // ignore: use_build_context_synchronously
      MyFlushBar.showSimpleFlushBar(
          "Login Faild", context, Colors.red, Colors.white);
    } else {
      // ignore: use_build_context_synchronously
      MyFlushBar.showSimpleFlushBar(
          "Login successfully", context, Colors.green, Colors.white);
      AdminModel model = AdminModel.fromMap(
          querySnapshot.docs[0].data() as Map<String, dynamic>);
      StaticData.adminModel = model;
      StaticData.adminId = model.adminId;
      adminName = model.fullName!;
      branchName = model.branchName!;
      Future.delayed(const Duration(seconds: 2), () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const AdminDashBoard(),
          ),
        );
      });
    }

    update();
  }

  addAdminmethod(AdminModel model, BuildContext context) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

    await firebaseFirestore
        .collection("admins")
        .doc(model.adminId)
        .set(model.toMap());
    // ignore: use_build_context_synchronously
    MyFlushBar.showSimpleFlushBar(
        'Inserted Successfully', context, Colors.green, Colors.white);
    getAdminListMethod();
  }

  Future<List<AdminModel>> getAdminListMethod() async {
    allAdminList.clear();
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection("admins").get();

    for (var doc in querySnapshot.docs) {
      allAdminList.add(AdminModel.fromMap(doc.data() as Map<String, dynamic>));
    }
    update();

    return allAdminList;
  }

////////////////////// Depart Drop Down//////////////////////////////
  List<DropdownMenuItem<BranchModel>> buildBranchDropdownMenuItems(
      List<BranchModel> branchList) {
    print("branch list=${branchList.length}");
    List<DropdownMenuItem<BranchModel>> items = [];
    for (BranchModel branch in branchList) {
      items.add(
        DropdownMenuItem(
          value: branch,
          child: Text(branch.branchName!),
        ),
      );
    }
    print("item list=${items.length}");
    return items;
  }

  onBranchChangeDropdownItem(BranchModel? mySelectedBranch) {
    selectedBranch = mySelectedBranch;
    selectedBranchName = mySelectedBranch!.branchName;
    selectedBranchAddress = mySelectedBranch.branchAddress;
    selectedBranchId = mySelectedBranch.branchId;

    update();
  }
}
