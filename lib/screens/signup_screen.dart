import 'package:admin_panel_so/controller/absecureController.dart';
import 'package:admin_panel_so/controller/admin_main_controller.dart';
import 'package:admin_panel_so/screens/login.dart';
import 'package:admin_panel_so/utils/flushbar.dart';
import 'package:admin_panel_so/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController signupfullnameController = TextEditingController();
  TextEditingController signupcontactnumController = TextEditingController();
  TextEditingController signupEmailController = TextEditingController();
  TextEditingController signupPassController = TextEditingController();
  TextEditingController signupcnfrmPassController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  String initialCountry = 'AE';
  PhoneNumber number = PhoneNumber(isoCode: 'AE');
  String fullNumber = "xxxxxxxx";

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
                width: width * 0.4,
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
                                height: height * 0.07,
                                width: width,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                        color: AdminTheme.primaryColor)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextFormField(
                                    controller: signupEmailController,
                                    cursorColor: AdminTheme.primaryColor,
                                    decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Enter Your Full Name",
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
                                  child: TextFormField(
                                    controller: signupEmailController,
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
                                  child: InternationalPhoneNumberInput(
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Required';
                                      }
                                      return null;
                                    },
                                    onInputChanged: (PhoneNumber number) {
                                      print(number.phoneNumber);
                                      setState(() {
                                        fullNumber = number.phoneNumber!;
                                      });
                                    },
                                    onInputValidated: (bool value) {
                                      print(value);
                                    },
                                    selectorConfig: const SelectorConfig(
                                      selectorType:
                                          PhoneInputSelectorType.BOTTOM_SHEET,
                                    ),
                                    ignoreBlank: false,
                                    autoValidateMode: AutovalidateMode.disabled,
                                    selectorTextStyle:
                                        const TextStyle(color: Colors.black),
                                    initialValue: number,
                                    textFieldController: numberController,
                                    formatInput: true,
                                    keyboardType:
                                        const TextInputType.numberWithOptions(
                                            signed: true, decimal: true),
                                    // inputBorder: const OutlineInputBorder(),
                                    onSaved: (PhoneNumber number) {
                                      print('On Saved: $number');
                                    },
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
                                      controller: signupPassController,
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
                                      controller: signupcnfrmPassController,
                                      cursorColor: AdminTheme.primaryColor,
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "Confirm Password",
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
                              height: height * 0.02,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: width * 0.05, right: width * 0.05),
                              child: InkWell(
                                onTap: () {
                                  MyFlushBar.showSimpleFlushBar(
                                      "Signup successfully",
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
                                              const AdminPannelLoginPage(),
                                        ),
                                      );
                                    },
                                  );
                                },
                                child: Container(
                                    height: height * 0.07,
                                    width: width,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: AdminTheme.primaryColor),
                                    child: Text(
                                      "Signup",
                                      style: TextStyle(
                                          color: AdminTheme.secondryColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: width * 0.02),
                                    )),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
