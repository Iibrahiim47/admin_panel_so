import 'package:flutter/material.dart';

class MenueSettingPage extends StatefulWidget {
  const MenueSettingPage({super.key});

  @override
  State<MenueSettingPage> createState() => _MenueSettingPageState();
}

class _MenueSettingPageState extends State<MenueSettingPage> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: height,
        alignment: Alignment.center,
        width: width,
        child: const Text("Menue Setting Page"),
      ),
    );
  }
}
