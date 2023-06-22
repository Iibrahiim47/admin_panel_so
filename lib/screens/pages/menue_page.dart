// ignore_for_file: avoid_print

import 'package:admin_panel_so/controller/category_controller.dart';
import 'package:admin_panel_so/controller/menu_controller.dart';
import 'package:admin_panel_so/models/menue_category_model.dart';
import 'package:admin_panel_so/utils/flushbar.dart';
import 'package:admin_panel_so/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MenuePage extends StatefulWidget {
  const MenuePage({super.key});

  @override
  State<MenuePage> createState() => _MenuePageState();
}

class _MenuePageState extends State<MenuePage> {
  final formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController arabicNameController = TextEditingController();
  TextEditingController descriptopnController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  List<DropdownMenuItem<MenueCategoryModel>> categorydropdownMenuItems = [];
  clearcontroller() {
    nameController.clear();
    arabicNameController.clear();
    descriptopnController.clear();
    priceController.clear();
    // categorydropdownMenuItems.clear();
  }

  @override
  void initState() {
    getData();

    super.initState();
  }

  getData() async {
    List<MenueCategoryModel> list =
        await CategoryCOntroller.to.getMyCategoryListMethod();
    print(list.length);
    categorydropdownMenuItems =
        MenuContreoller.to.buildCategoryDropdownMenuItems(list);
    print(categorydropdownMenuItems.length);
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: GetBuilder<MenuContreoller>(initState: (state) {
        MenuContreoller.to.getMyMenueListMethod();
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
                  height: height * 0.33,
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
                        SizedBox(
                          height: height * 0.23,
                          width: width,
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: width * 0.01,
                              right: width * 0.01,
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                obj.isImageSelected == false
                                    ? InkWell(
                                        onTap: () {
                                          obj.getFromGallery(context);
                                        },
                                        child: Container(
                                          height: height,
                                          width: width * 0.1,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(),
                                          ),
                                          child: const Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Icon(Icons.image),
                                              Text("Select Image")
                                            ],
                                          ),
                                        ),
                                      )
                                    : Container(
                                        height: height,
                                        width: width * 0.1,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: NetworkImage(
                                                    obj.imageUrl!)),
                                            border: Border.all()),
                                      ),
                                SizedBox(
                                  width: width * 0.02,
                                ),
                                Expanded(
                                  child: SizedBox(
                                    height: height,
                                    width: width,
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: height * 0.07,
                                          width: width,
                                          // color: Colors.amber,
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: Container(
                                                  height: height,
                                                  width: width,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                      border: Border.all(
                                                          color: AdminTheme
                                                              .primaryColor)),
                                                  child: Center(
                                                    child: Padding(
                                                      padding: EdgeInsets.only(
                                                        left: width * 0.02,
                                                      ),
                                                      child: TextFormField(
                                                        // validator: (value) {
                                                        //   if (value == null ||
                                                        //       value.isEmpty) {
                                                        //     return 'Required';
                                                        //   }
                                                        //   return null;
                                                        // },
                                                        controller:
                                                            nameController,
                                                        decoration:
                                                            const InputDecoration(
                                                                border:
                                                                    InputBorder
                                                                        .none,
                                                                hintText:
                                                                    "ENTER English NAME"),
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
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                      border: Border.all(
                                                          color: AdminTheme
                                                              .primaryColor)),
                                                  child: Center(
                                                    child: Padding(
                                                      padding: EdgeInsets.only(
                                                        left: width * 0.02,
                                                      ),
                                                      child: TextFormField(
                                                        // validator: (value) {
                                                        //   if (value == null ||
                                                        //       value.isEmpty) {
                                                        //     return 'Required';
                                                        //   }
                                                        //   return null;
                                                        // },
                                                        controller:
                                                            arabicNameController,
                                                        decoration:
                                                            const InputDecoration(
                                                                border:
                                                                    InputBorder
                                                                        .none,
                                                                hintText:
                                                                    "ENTER Arabic NAME"),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: height * 0.01,
                                        ),
                                        Expanded(
                                          child: SizedBox(
                                            // color: Colors.amber,
                                            height: height * 0.17,
                                            width: width,
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child: Container(
                                                    height: height,
                                                    width: width,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                        border: Border.all(
                                                            color: AdminTheme
                                                                .primaryColor)),
                                                    child: Center(
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                          left: width * 0.02,
                                                        ),
                                                        child: TextFormField(
                                                          maxLines: 4,
                                                          validator: (value) {
                                                            if (value == null ||
                                                                value.isEmpty) {
                                                              return 'Required';
                                                            }
                                                            return null;
                                                          },
                                                          controller:
                                                              descriptopnController,
                                                          decoration:
                                                              const InputDecoration(
                                                                  border:
                                                                      InputBorder
                                                                          .none,
                                                                  hintText:
                                                                      "ENTER Description"),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: width * 0.02,
                                                ),
                                                Expanded(
                                                  child: SizedBox(
                                                    height: height,
                                                    width: width,
                                                    child: Column(children: [
                                                      Expanded(
                                                        child: Container(
                                                          height: height,
                                                          width: width,
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20),
                                                              border: Border.all(
                                                                  color: AdminTheme
                                                                      .primaryColor)),
                                                          child: Center(
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .only(
                                                                left: width *
                                                                    0.02,
                                                              ),
                                                              child:
                                                                  TextFormField(
                                                                // validator:
                                                                //     (value) {
                                                                //   if (value ==
                                                                //           null ||
                                                                //       value
                                                                //           .isEmpty) {
                                                                //     return 'Required';
                                                                //   }
                                                                //   return null;
                                                                // },
                                                                controller:
                                                                    priceController,
                                                                decoration: const InputDecoration(
                                                                    border:
                                                                        InputBorder
                                                                            .none,
                                                                    hintText:
                                                                        "Price"),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: height * 0.01,
                                                      ),
                                                      Expanded(
                                                        child: Container(
                                                          height: height,
                                                          width: width,
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20),
                                                              border: Border.all(
                                                                  color: AdminTheme
                                                                      .primaryColor)),
                                                          child: Center(
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .only(
                                                                left: width *
                                                                    0.02,
                                                                right: width *
                                                                    0.02,
                                                              ),
                                                              child:
                                                                  DropdownButton(
                                                                hint:
                                                                    const Text(
                                                                  'Select Category',
                                                                ),
                                                                value: obj
                                                                    .selectedCategory,
                                                                underline:
                                                                    const SizedBox(),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10),
                                                                items:
                                                                    categorydropdownMenuItems,
                                                                isExpanded:
                                                                    true,
                                                                onChanged: obj
                                                                    .onCategoryChangeDropdownItem,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ]),
                                                  ),
                                                )
                                              ],
                                            ),
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
                        SizedBox(
                          height: height * 0.02,
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: width * 0.2,
                              right: width * 0.2,
                            ),
                            child: InkWell(
                              onTap: () {
                                if (formKey.currentState!.validate()) {
                                  obj.addMenueMethod(
                                      context,
                                      nameController.text,
                                      arabicNameController.text,
                                      obj.imageUrl!,
                                      descriptopnController.text,
                                      obj.selectedCategoryName!,
                                      priceController.text);
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
                                  "ADD menu",
                                  style: TextStyle(
                                    color: AdminTheme.secondryColor,
                                    fontSize: width * 0.015,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
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
                    child: obj.allMenueList.isEmpty
                        ? const Center(child: Text("No Products found"))
                        : GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4,
                            ),
                            itemCount: obj.allMenueList.length,
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
                                          SizedBox(
                                            height: height * 0.01,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Container(
                                                height: height * 0.1,
                                                width: width * 0.1,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    image: DecorationImage(
                                                        fit: BoxFit.cover,
                                                        image: NetworkImage(obj
                                                            .allMenueList[index]
                                                            .image!)),
                                                    border: Border.all()),
                                              ),
                                              SizedBox(
                                                width: width * 0.03,
                                                height: height * 0.06,
                                                // color: Colors.amber,
                                                child: Center(
                                                  child: PopupMenuButton(
                                                    offset: const Offset(0, 60),

                                                    ///here
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    icon: const Icon(
                                                        Icons.more_vert),
                                                    itemBuilder:
                                                        (BuildContext context) {
                                                      return {
                                                        'Update',
                                                        'Delete'
                                                      }.map((String choice) {
                                                        return PopupMenuItem<
                                                            String>(
                                                          value: choice,
                                                          child: Text(choice),
                                                        );
                                                      }).toList();
                                                    },
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Expanded(
                                            child: Container(
                                              alignment: Alignment.center,
                                              height: height,
                                              width: width,
                                              child: Text(
                                                obj.allMenueList[index].name!,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: SizedBox(
                                              height: height,
                                              width: width,
                                              child: const Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Date Time: ",
                                                    maxLines: 2,
                                                    style: TextStyle(
                                                        color: AdminTheme
                                                            .primaryColor),
                                                  ),
                                                  // Text(
                                                  //   obj.allMenueList[index]
                                                  //       .dateTime!
                                                  //       .toString(),
                                                  // ),
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
                                                    obj.allMenueList[index]
                                                        .arabicName!,
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
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
