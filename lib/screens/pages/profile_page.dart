import 'package:admin_panel_so/controller/menu_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: GetBuilder<MenuContreoller>(
        initState: (state) {
          MenuContreoller.to.deleteImage();
        },
        builder: (obj) {
          return Container(
            height: height,
            alignment: Alignment.center,
            width: width,
            child: const Text("profile Page"),
          );
        },
      ),
    );
  }
}
