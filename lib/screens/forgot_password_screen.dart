import 'package:admin_panel_so/utils/theme.dart';
import 'package:flutter/material.dart';

class ForgorPassScreen extends StatefulWidget {
  const ForgorPassScreen({super.key});

  @override
  State<ForgorPassScreen> createState() => _ForgorPassScreenState();
}

class _ForgorPassScreenState extends State<ForgorPassScreen> {
  TextEditingController forgotEmailController = TextEditingController();
  TextEditingController forgotPassController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: height,
        width: width,
        decoration: const BoxDecoration(
            // image: DecorationImage(
            //     fit: BoxFit.cover,
            //     image: AssetImage("assets/admin_panel_back.jpg"))
            ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Container(
                height: height * 0.4,
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
                                    controller: forgotEmailController,
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
                              child: InkWell(
                                onTap: () {
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
                                        borderRadius: BorderRadius.circular(20),
                                        color: AdminTheme.primaryColor),
                                    child: Text(
                                      "Request New Passord",
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
          ],
        ),
      ),
    );
  }
}
