// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:admin_panel_so/controller/admin_main_controller.dart';
import 'package:admin_panel_so/controller/branch_controller.dart';
import 'package:admin_panel_so/controller/category_controller.dart';
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
    // Get.put(AdbranchController());
    Get.put(AdminMainController());
    Get.put(BranchController());
    Get.put(CategoryCOntroller());
    Get.put(MenuContreoller());
    Get.put(SignUpController());
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
