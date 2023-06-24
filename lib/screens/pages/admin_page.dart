// ignore_for_file: avoid_print

import 'package:admin_panel_so/controller/admin_main_controller.dart';
import 'package:admin_panel_so/controller/branch_controller.dart';
import 'package:admin_panel_so/models/admin_model.dart';
import 'package:admin_panel_so/models/branch_model.dart';
import 'package:admin_panel_so/utils/flushbar.dart';
import 'package:admin_panel_so/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:uuid/uuid.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String initialCountry = 'AE';
  PhoneNumber number = PhoneNumber(isoCode: 'AE');
  List<DropdownMenuItem<BranchModel>> branchdropdownMenuItems = [];
  String fullNumber = "xxxxxxxx";
  final formKey = GlobalKey<FormState>();
  clearcontroller() {
    fullNameController.clear();
    emailController.clear();
    numberController.clear();
    passwordController.clear();
  }

  @override
  void initState() {
    branchdropdownMenuItems = AdminMainController.to
        .buildBranchDropdownMenuItems(BranchController.to.allBranchesList);
    print(branchdropdownMenuItems.length);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: GetBuilder<AdminMainController>(initState: (state) {
        AdminMainController.to.getAdminListMethod();
      }, builder: (obj) {
        return Container(
          height: height,
          alignment: Alignment.center,
          width: width,
          child: Form(
            key: formKey,
            child: Column(
              children: [
                SizedBox(
                  height: height * 0.2,
                  width: width,
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: width * 0.01,
                      right: width * 0.01,
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: height * 0.02,
                        ),
                        Expanded(
                            child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: height,
                                width: width,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                        color: AdminTheme.primaryColor)),
                                child: Center(
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      left: width * 0.02,
                                    ),
                                    child: TextFormField(
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Required';
                                        }
                                        return null;
                                      },
                                      controller: fullNameController,
                                      decoration: const InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "ENTER FULL NAME"),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: width * 0.02,
                            ),
                            Expanded(
                              child: Container(
                                height: height,
                                width: width,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                        color: AdminTheme.primaryColor)),
                                child: Center(
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      left: width * 0.02,
                                    ),
                                    child: TextFormField(
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Required';
                                        }
                                        return null;
                                      },
                                      controller: emailController,
                                      decoration: const InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "ENTER EMAIL"),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: width * 0.02,
                            ),
                            Expanded(
                              child: Container(
                                height: height,
                                width: width,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                        color: AdminTheme.primaryColor)),
                                child: Center(
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      left: width * 0.02,
                                      right: width * 0.02,
                                    ),
                                    child: InternationalPhoneNumberInput(
                                      inputBorder: InputBorder.none,
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
                                      autoValidateMode:
                                          AutovalidateMode.disabled,
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
                            ),
                          ],
                        )),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        Expanded(
                            child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: height,
                                width: width,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                        color: AdminTheme.primaryColor)),
                                child: Center(
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      left: width * 0.02,
                                      right: width * 0.02,
                                    ),
                                    child: DropdownButton(
                                      hint: const Text(
                                        'Select Branch',
                                      ),
                                      value: obj.selectedBranch,
                                      underline: const SizedBox(),
                                      borderRadius: BorderRadius.circular(10),
                                      items: branchdropdownMenuItems,
                                      isExpanded: true,
                                      onChanged: obj.onBranchChangeDropdownItem,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: width * 0.02,
                            ),
                            Expanded(
                              child: Container(
                                height: height,
                                width: width,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                        color: AdminTheme.primaryColor)),
                                child: Center(
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      left: width * 0.02,
                                    ),
                                    child: TextFormField(
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Required';
                                        }
                                        return null;
                                      },
                                      controller: passwordController,
                                      decoration: const InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "ENTER Password"),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: width * 0.02,
                            ),
                            Expanded(
                              child: InkWell(
                                onTap: () async {
                                  if (formKey.currentState!.validate()) {
                                    var now = DateTime.now();

                                    String date =
                                        DateFormat.yMd().add_jm().format(now);

                                    var uuid = const Uuid();
                                    String id = uuid.v4();

                                    AdminModel model = AdminModel(
                                      adminId: id,
                                      addedBY: AdminMainController.to.adminName,
                                      branchId: AdminMainController
                                          .to.selectedBranchId,
                                      branchName: AdminMainController
                                          .to.selectedBranchName,
                                      branchaddress: AdminMainController
                                          .to.selectedBranchAddress,
                                      dateTime: date,
                                      password: passwordController.text,
                                      fullName: fullNameController.text,
                                      number: fullNumber,
                                      email: emailController.text,
                                    );

                                    obj.addAdminmethod(
                                      model,
                                      context,
                                    );
                                    clearcontroller();
                                    MyFlushBar.showSimpleFlushBar(
                                        "Added successfully",
                                        context,
                                        Colors.green,
                                        Colors.white);
                                  } else {
                                    MyFlushBar.showSimpleFlushBar(
                                        "Fill All the fields",
                                        context,
                                        AdminTheme.errorColor,
                                        AdminTheme.secondryColor);
                                  }
                                },
                                child: Container(
                                  height: height,
                                  width: width,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: AdminTheme.primaryColor,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Text(
                                    "ADD Admin",
                                    style: TextStyle(
                                      color: AdminTheme.secondryColor,
                                      fontSize: width * 0.015,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ))
                      ],
                    ),
                  ),
                ),
                const Divider(),
                Expanded(
                  child: SizedBox(
                    height: height,
                    width: width,
                    // color: Colors.amber,
                    child: obj.allAdminList.isEmpty
                        ? const Center(child: Text("No Products found"))
                        : GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4,
                            ),
                            itemCount: obj.allAdminList.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Card(
                                  elevation: 10,
                                  shadowColor: AdminTheme.primaryColor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  child: SizedBox(
                                    height: height * 0.25,
                                    width: width,
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                        left: width * 0.01,
                                      ),
                                      child: Column(
                                        children: [
                                          Expanded(
                                            child: Container(
                                              alignment: Alignment.center,
                                              height: height,
                                              width: width,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Text(
                                                    obj.allAdminList[index]
                                                        .fullName!,
                                                  ),
                                                  SizedBox(
                                                    width: width * 0.03,
                                                    height: height * 0.06,
                                                    // color: Colors.amber,
                                                    child: Center(
                                                      child: PopupMenuButton(
                                                        offset:
                                                            const Offset(0, 60),

                                                        ///here
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                        ),
                                                        icon: const Icon(
                                                            Icons.more_vert),
                                                        itemBuilder:
                                                            (BuildContext
                                                                context) {
                                                          return {
                                                            'Update',
                                                            'Delete'
                                                          }.map(
                                                              (String choice) {
                                                            return PopupMenuItem<
                                                                String>(
                                                              value: choice,
                                                              child:
                                                                  Text(choice),
                                                            );
                                                          }).toList();
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              alignment: Alignment.center,
                                              height: height,
                                              width: width,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Row(
                                                  children: [
                                                    const Text(
                                                      "Added BY: ",
                                                      style: TextStyle(
                                                          color: AdminTheme
                                                              .primaryColor),
                                                    ),
                                                    Text(obj.allAdminList[index]
                                                        .addedBY!),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: SizedBox(
                                              height: height,
                                              width: width,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  const Text(
                                                    "Date Time: ",
                                                    style: TextStyle(
                                                        color: AdminTheme
                                                            .primaryColor),
                                                  ),
                                                  Text(
                                                    obj.allAdminList[index]
                                                        .dateTime!,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: SizedBox(
                                              height: height,
                                              width: width,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  const Text(
                                                    "Email: ",
                                                    style: TextStyle(
                                                        color: AdminTheme
                                                            .primaryColor),
                                                  ),
                                                  Text(
                                                    obj.allAdminList[index]
                                                        .email!,
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
                            },
                          ),
                  ),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
