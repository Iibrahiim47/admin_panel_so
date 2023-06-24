import 'package:admin_panel_so/controller/branch_controller.dart';
import 'package:admin_panel_so/utils/flushbar.dart';
import 'package:admin_panel_so/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BranchPage extends StatefulWidget {
  const BranchPage({super.key});

  @override
  State<BranchPage> createState() => _BranchPageState();
}

class _BranchPageState extends State<BranchPage> {
  TextEditingController nameControler = TextEditingController();
  TextEditingController addressController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: GetBuilder<BranchController>(initState: (state) {
        BranchController.to.getMyBranchesListMethod();
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
                    height: height * 0.02,
                  ),
                  SizedBox(
                    height: height * 0.1,
                    width: width,
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: width * 0.01,
                        right: width * 0.01,
                      ),
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
                                    controller: nameControler,
                                    decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "ENTER BRANCH NAME"),
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
                                    controller: addressController,
                                    decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "ENTER BRANCH ADDRESS"),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: width * 0.02,
                          ),
                          InkWell(
                            onTap: () {
                              if (formKey.currentState!.validate()) {
                                obj.addBranchMethod(context, nameControler.text,
                                    addressController.text);

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
                              width: width * 0.2,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: AdminTheme.primaryColor,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Text(
                                "ADD Branch",
                                style: TextStyle(
                                  color: AdminTheme.secondryColor,
                                  fontSize: width * 0.015,
                                ),
                              ),
                            ),
                          )
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
                      child: obj.allBranchesList.isEmpty
                          ? const Center(child: Text("No Products found"))
                          : GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 4,
                              ),
                              itemCount: obj.allBranchesList.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Card(
                                    elevation: 10,
                                    shadowColor: AdminTheme.primaryColor,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
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
                                                      obj.allBranchesList[index]
                                                          .branchName!,
                                                    ),
                                                    SizedBox(
                                                      width: width * 0.03,
                                                      height: height * 0.06,
                                                      // color: Colors.amber,
                                                      child: Center(
                                                        child: PopupMenuButton(
                                                          offset: const Offset(
                                                              0, 60),

                                                          ///here
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                          ),
                                                          icon: const Icon(
                                                              Icons.more_vert),
                                                          itemBuilder:
                                                              (BuildContext
                                                                  context) {
                                                            return {
                                                              'Update',
                                                              'Delete'
                                                            }.map((String
                                                                choice) {
                                                              return PopupMenuItem<
                                                                  String>(
                                                                value: choice,
                                                                child: Text(
                                                                    choice),
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
                                                      Text(obj
                                                          .allBranchesList[
                                                              index]
                                                          .addedBy!),
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
                                                      obj.allBranchesList[index]
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
                                                      "Address: ",
                                                      style: TextStyle(
                                                          color: AdminTheme
                                                              .primaryColor),
                                                    ),
                                                    Text(
                                                      obj.allBranchesList[index]
                                                          .branchAddress!,
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
            ));
      }),
    );
  }
}
