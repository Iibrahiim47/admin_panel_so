// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:admin_panel_so/controller/add_admin_controller/add_admin_controller.dart';
import 'package:admin_panel_so/controller/add_branch_controller/add_branch_controller.dart';
import 'package:admin_panel_so/controller/admin_main_controller.dart';
import 'package:admin_panel_so/controller/branch_controller.dart';
import 'package:admin_panel_so/controller/get_branch_controller/get_branch_controller.dart';
import 'package:admin_panel_so/controller/get_reviews_controller/get_reviews_controller.dart';
import 'package:admin_panel_so/controller/get_users_profile_ontroller/get_user_profile_controller.dart';
import 'package:admin_panel_so/controller/login_controller/login_controller.dart';
import 'package:admin_panel_so/controller/menu_controller.dart';
import 'package:admin_panel_so/controller/signup_controller/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'screens/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  var height, width;
  @override
  void initState() {
    Get.put(AdminLoginController());
    Get.put(AdminMainController());
    Get.put(AddBranchController());
    Get.put(MenuContreoller());
    Get.put(GetBranchListController());
    Get.put(SignUpController());
    Get.put(AddadminController());
    Get.put(GetuserProfileController());
    Get.put(CategoryGetandPostController());
    Get.put(GetReviewsController());
    // getDatafromSf();
    Future.delayed(
      const Duration(seconds: 2),
      () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AdminPannelLoginPage(),
            ));
      },
    );
    super.initState();
  }

  // void getDatafromSf() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   String? userValue = prefs.getString("Email");
  //   print(userValue);

  //   if (userValue == null) {
  //     Future.delayed(const Duration(milliseconds: 2250), () {
  //       Navigator.push(
  //           context,
  //           MaterialPageRoute(
  //               builder: (context) => const AdminPannelLoginPage()));
  //     });
  //   } else {
  //     Future.delayed(const Duration(milliseconds: 2250), () {
  //       Navigator.push(context,
  //           MaterialPageRoute(builder: (context) => const SubAdminDashBoard()));
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: height,
        width: width,
      ),
    );
  }
}
