import 'package:admin_panel_so/controller/absecureController.dart';
import 'package:admin_panel_so/controller/admin_main_controller.dart';
import 'package:admin_panel_so/controller/login_controller/login_controller.dart';
import 'package:admin_panel_so/models/login_model.dart';
import 'package:admin_panel_so/screens/dashboard.dart';
import 'package:admin_panel_so/screens/forgot_password_screen.dart';
import 'package:admin_panel_so/sub_admin/sub_dashboard.dart';
import 'package:admin_panel_so/utils/flushbar.dart';
import 'package:admin_panel_so/utils/static_data.dart';
import 'package:admin_panel_so/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AdminPannelLoginPage extends StatefulWidget {
  const AdminPannelLoginPage({super.key});
  @override
  State<AdminPannelLoginPage> createState() => _AdminPannelLoginPageState();
}

class _AdminPannelLoginPageState extends State<AdminPannelLoginPage> {
  TextEditingController loginEmailController = TextEditingController();
  TextEditingController loginPassController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: GetBuilder<AdminMainController>(builder: (obj) {
        return SizedBox(
          height: height,
          width: width,
          // decoration: const BoxDecoration(
          //   image: DecorationImage(
          //     fit: BoxFit.cover,
          //     image: AssetImage(
          //       'images/bg.jpg',
          //     ),
          //   ),
          // ),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: height * 0.05,
                  width: width * 0.2,
                  // color: Colors.amber,
                  child: Center(
                    child: Text(
                      'Admin',
                      style: TextStyle(
                        fontSize: width * 0.015,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                // Container(
                //   height: height * 0.15,
                //   width: width * 0.2,
                //   // color: Colors.amber,
                //   decoration: const BoxDecoration(
                //     image: DecorationImage(
                //       fit: BoxFit.cover,
                //       image: AssetImage(
                //         'images/logo.png',
                //       ),
                //     ),
                //   ),
                // ),
                SizedBox(
                  height: height * 0.05,
                  width: width * 0.2,
                  // color: Colors.amber,
                  child: Center(
                    child: Text(
                      'Login To Your Account',
                      style: TextStyle(
                        fontSize: width * 0.015,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                Card(
                  elevation: 20,
                  shadowColor: AdminTheme.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Container(
                    height: height * 0.4,
                    width: width * 0.4,
                    decoration: BoxDecoration(
                      color: Colors.white,
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
                                    height: height * 0.07,
                                    width: width,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(
                                        color: AdminTheme.primaryColor,
                                      ),
                                    ),
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
                                    height: height * 0.07,
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
                                                  color:
                                                      AdminTheme.primaryColor,
                                                ),
                                              )),
                                        );
                                      }),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: height * 0.02,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: width * 0.05, right: width * 0.05),
                                  child: InkWell(
                                    onTap: () {
                                      if (_formKey.currentState!.validate()) {
                                        LoginReqModel model = LoginReqModel(
                                          email: loginEmailController.text,
                                          password: loginPassController.text,
                                        );
                                        print(model);

                                        AdminLoginController.to
                                            .userloginUPMethiod(model)
                                            .then((value) {
                                          if (value.status ==
                                              "Login Successfully") {
                                            if (value.isAdmin == true) {
                                              // saveIntroValue(
                                              //     loginEmailController.text);
                                              StaticData.token = value.data;
                                              print("${StaticData.token}");
                                              MyFlushBar.showSimpleFlushBar(
                                                  "Login successfully",
                                                  context,
                                                  Colors.green,
                                                  Colors.white);
                                              Future.delayed(
                                                  const Duration(seconds: 1),
                                                  () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        const AdminDashBoard(),
                                                  ),
                                                );
                                              });
                                            } else {
                                              // saveIntroValue(
                                              //     loginEmailController.text);
                                              StaticData.token = value.data;
                                              print("${StaticData.token}");

                                              Future.delayed(
                                                  const Duration(seconds: 1),
                                                  () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        const SubAdminDashBoard(),
                                                  ),
                                                );
                                              });
                                              print("sub Admin");
                                            }
                                          } else {
                                            MyFlushBar.showSimpleFlushBar(
                                                "Login Failed",
                                                context,
                                                Colors.red,
                                                Colors.white);
                                          }
                                        });
                                      }
                                      // if (loginEmailController.isBlank! ||
                                      //     loginPassController.isBlank!) {
                                      //   MyFlushBar.showSimpleFlushBar(
                                      //       "Fill All the fields",
                                      //       context,
                                      //       AdminTheme.errorColor,
                                      //       AdminTheme.secondryColor);
                                      // } else {
                                      //   obj.adminLoginMethod(
                                      //       loginEmailController.text,
                                      //       loginPassController.text,
                                      //       context);
                                      // }
                                    },
                                    child: Container(
                                        height: height * 0.07,
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
                                    height: height * 0.04,
                                    width: width,
                                    // color: Colors.amber,
                                    alignment: Alignment.centerRight,
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const ForgorPassScreen(),
                                          ),
                                        );
                                      },
                                      child: Text(
                                        "Forgot Password?",
                                        style: TextStyle(
                                          fontSize: width * 0.01,
                                        ),
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
              ],
            ),
          ),
        );
      }),
    );
  }

  void saveIntroValue(String email) async {
    final prefs = await SharedPreferences.getInstance();
    String? userValue = prefs.setString('Email', email) as String?;
  }
}
