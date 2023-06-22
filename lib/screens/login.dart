import 'package:admin_panel_so/controller/absecureController.dart';
import 'package:admin_panel_so/controller/admin_main_controller.dart';
import 'package:admin_panel_so/utils/flushbar.dart';
import 'package:admin_panel_so/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminPannelLoginPage extends StatefulWidget {
  const AdminPannelLoginPage({super.key});

  @override
  State<AdminPannelLoginPage> createState() => _AdminPannelLoginPageState();
}

class _AdminPannelLoginPageState extends State<AdminPannelLoginPage> {
  TextEditingController loginEmailController = TextEditingController();
  TextEditingController loginPassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: GetBuilder<AdminMainController>(builder: (obj) {
        return Container(
            height: height,
            width: width,
            decoration: const BoxDecoration(
                // image: DecorationImage(
                //     fit: BoxFit.cover,
                //     image: AssetImage("assets/admin_panel_back.jpg"))
                ),
            child: Center(
              child: Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Container(
                  height: height * 0.6,
                  width: width * 0.5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: height,
                          width: width,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    left: width * 0.05, right: width * 0.05),
                                child: Container(
                                  height: height * 0.08,
                                  width: width,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(
                                          color: AdminTheme.primaryColor)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(
                                      controller: loginEmailController,
                                      cursorColor: AdminTheme.primaryColor,
                                      decoration: const InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "Enter Your Email",
                                          prefixIcon: Icon(
                                            Icons.email,
                                            color: AdminTheme.primaryColor,
                                          )),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: height * 0.02,
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: width * 0.05, right: width * 0.05),
                                child: Container(
                                  height: height * 0.08,
                                  width: width,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(
                                          color: AdminTheme.primaryColor)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: GetBuilder<AbsecureTextController>(
                                        initState: (state) {
                                      Get.put(AbsecureTextController());
                                    }, builder: (absobj) {
                                      return TextFormField(
                                        obscureText: absobj.isTexthide,
                                        controller: loginPassController,
                                        cursorColor: AdminTheme.primaryColor,
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: "Enter Your Password",
                                            prefixIcon: InkWell(
                                              onTap: () {
                                                absobj.absecureText();
                                              },
                                              child: Icon(
                                                absobj.isTexthide
                                                    ? Icons.lock
                                                    : Icons.lock_open,
                                                color: AdminTheme.primaryColor,
                                              ),
                                            )),
                                      );
                                    }),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: height * 0.05,
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: width * 0.05, right: width * 0.05),
                                child: InkWell(
                                  onTap: () {
                                    if (loginEmailController.isBlank! ||
                                        loginPassController.isBlank!) {
                                      MyFlushBar.showSimpleFlushBar(
                                          "Fill All the fields",
                                          context,
                                          AdminTheme.errorColor,
                                          AdminTheme.secondryColor);
                                    } else {
                                      obj.adminLoginMethod(
                                          loginEmailController.text,
                                          loginPassController.text,
                                          context);
                                    }
                                  },
                                  child: Container(
                                      height: height * 0.08,
                                      width: width,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: AdminTheme.primaryColor),
                                      child: Text(
                                        "LOGIN",
                                        style: TextStyle(
                                            color: AdminTheme.secondryColor,
                                            fontWeight: FontWeight.bold,
                                            fontSize: width * 0.02),
                                      )),
                                ),
                              ),
                              SizedBox(
                                height: height * 0.02,
                                width: width,
                                // color: Colors.amber,
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: width * 0.05, right: width * 0.05),
                                child: Container(
                                  height: height * 0.06,
                                  width: width,
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    "Forgot Password?",
                                    style: TextStyle(
                                      fontSize: width * 0.012,
                                    ),
                                  ),
                                  // color: Colors.amber,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ));
      }),
    );
  }
}