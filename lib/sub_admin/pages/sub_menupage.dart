// ignore_for_file: avoid_print

import 'package:admin_panel_so/controller/branch_controller.dart';
import 'package:admin_panel_so/controller/menu_controller.dart';
import 'package:admin_panel_so/sub_admin/model/get_category_model.dart';
import 'package:admin_panel_so/utils/flushbar.dart';
import 'package:admin_panel_so/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubMenuePage extends StatefulWidget {
  const SubMenuePage({super.key});

  @override
  State<SubMenuePage> createState() => _SubMenuePageState();
}

class _SubMenuePageState extends State<SubMenuePage> {
  final formKey = GlobalKey<FormState>();
  TextEditingController engnameController = TextEditingController();
  TextEditingController arabicNameController = TextEditingController();
  TextEditingController descriptopnController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  List<DropdownMenuItem<DataList>> categorydropdownMenuItems = [];
  clearcontroller() {
    engnameController.clear();
    arabicNameController.clear();
    descriptopnController.clear();
    priceController.clear();
    // categorydropdownMenuItems.clear();
  }

  @override
  void initState() {
    getData();

    print("product list is ${MenuContreoller.to.getProductListData.length}");
    // MenuContreoller.to.getProductList();
    super.initState();
  }

  getData() async {
    List<DataList> list =
        await CategoryGetandPostController.to.getCatagoriesList();
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
        // MenuContreoller.to.getMyMenueListMethod();
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
                                obj.addImage == null
                                    ? InkWell(
                                        onTap: () {
                                          obj.addProductImage(context);
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
                                                    obj.image!.path)),
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
                                                        validator: (value) {
                                                          if (value == null ||
                                                              value.isEmpty) {
                                                            return 'Required';
                                                          }
                                                          return null;
                                                        },
                                                        controller:
                                                            engnameController,
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
                                                        validator: (value) {
                                                          if (value == null ||
                                                              value.isEmpty) {
                                                            return 'Required';
                                                          }
                                                          return null;
                                                        },
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
                                                                validator:
                                                                    (value) {
                                                                  if (value ==
                                                                          null ||
                                                                      value
                                                                          .isEmpty) {
                                                                    return 'Required';
                                                                  }
                                                                  return null;
                                                                },
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
                            child: GestureDetector(
                              onTap: () {
                                if (formKey.currentState!.validate()) {
                                  obj.addProductItem(
                                      arabicNameController.text,
                                      engnameController.text,
                                      descriptopnController.text,
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
                    child: Column(
                      children: [
                        SizedBox(
                          height: height * 0.1,
                          width: width,
                          child: ListView.builder(
                            itemCount: CategoryGetandPostController
                                .to.getCatagoriesListData.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: InkWell(
                                  onTap: () {
                                    obj.getProductList();
                                  },
                                  child: Card(
                                    elevation: 10,
                                    shadowColor: AdminTheme.primaryColor,
                                    child: SizedBox(
                                      height: height,
                                      width: width * 0.1,
                                      child: Center(
                                        child: Text(
                                            "${CategoryGetandPostController.to.getCatagoriesListData[index].araName}"),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: height,
                            width: width,
                            color: Colors.amber,
                            child: GridView.builder(
                              itemCount: obj.getProductListData.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 8),
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: height * 0.1,
                                    width: width * 0.4,
                                    color: Colors.red,
                                    child: Text(
                                      '${obj.getProductListData[index].araName}  ${obj.getProductListData[index].engName}',
                                      style: TextStyle(
                                        fontSize: width * 0.025,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      maxLines: 2,
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
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
