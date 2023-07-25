// ignore_for_file: avoid_print

import 'package:admin_panel_so/controller/branch_controller.dart';
import 'package:admin_panel_so/sub_admin/model/get_category_model.dart';
import 'package:admin_panel_so/utils/flushbar.dart';
import 'package:admin_panel_so/utils/static.dart';
import 'package:admin_panel_so/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubCategoryPage extends StatefulWidget {
  const SubCategoryPage({super.key});

  @override
  State<SubCategoryPage> createState() => _SubCategoryPageState();
}

class _SubCategoryPageState extends State<SubCategoryPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController arabicController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  clearcontroller() {
    nameController.clear();
    arabicController.clear();
  }

  @override
  void initState() {
    // CategoryGetandPostController.to.changeSelectImageStatus(false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: GetBuilder<CategoryGetandPostController>(builder: (obj) {
        return SizedBox(
            height: height,
            width: width,
            child: Column(
              children: [
                SizedBox(
                  height: height * 0.02,
                ),
                SizedBox(
                  height: height * 0.15,
                  width: width,
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: width * 0.01,
                      right: width * 0.01,
                    ),
                    child: Row(
                      children: [
                        obj.image == null
                            ? InkWell(
                                onTap: () {
                                  obj.addCategoryImage(context);
                                },
                                child: Container(
                                  height: height,
                                  width: width * 0.1,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
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
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                        obj.image!.path,
                                      ),
                                    ),
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
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Required';
                                            }
                                            return null;
                                          },
                                          controller: nameController,
                                          decoration: const InputDecoration(
                                              border: InputBorder.none,
                                              hintText: "ENTER English NAME"),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: height * 0.02,
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
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Required';
                                            }
                                            return null;
                                          },
                                          controller: arabicController,
                                          decoration: const InputDecoration(
                                              border: InputBorder.none,
                                              hintText: "ENTER Arabic NAME"),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
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
                                border:
                                    Border.all(color: AdminTheme.primaryColor)),
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.only(
                                  left: width * 0.02,
                                  right: width * 0.02,
                                ),
                                child: DropdownButton(
                                  hint: const Text(
                                    'Select Category',
                                  ),
                                  items: obj.typeList.map((String items) {
                                    return DropdownMenuItem(
                                        value: items, child: Text(items));
                                  }).toList(),
                                  onChanged: (value) {
                                    obj.changeCatoryType(value!);
                                  },
                                  value: obj.dropDownValue,
                                  underline: const SizedBox(),
                                  borderRadius: BorderRadius.circular(10),
                                  // items:
                                  //     categorydropdownMenuItems,
                                  isExpanded: true,
                                  // onChanged: obj
                                  //     .onCategoryChangeDropdownItem,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: width * 0.02,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: GestureDetector(
                            onTap: () {
                              print(nameController.text);
                              print(arabicController.text);
                              print(obj.image);
                              if (formKey.currentState!.validate()) {
                                CategoryGetandPostController.to
                                    .uploadFooterItem(
                                  nameController.text,
                                  arabicController.text,
                                );
                                // obj.addCategoryMethod(
                                //     context,
                                //     nameController.text,
                                //     arabicController.text,
                                //     obj.imageUrl!);
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
                              width: width * 0.2,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: AdminTheme.primaryColor,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Text(
                                "ADD Category",
                                style: TextStyle(
                                  color: AdminTheme.secondryColor,
                                  fontSize: width * 0.015,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const Divider(),
                FutureBuilder<List<DataList>>(
                    future: obj.getCatagoriesList(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Expanded(
                          child: SizedBox(
                            height: height,
                            width: width,
                            // color: Colors.amber,
                            child: GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 4,
                              ),
                              itemCount: obj.getCatagoriesListData.length,
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
                                          left: width * 0.02,
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
                                                      image: NetworkImage(
                                                        "${StaticValues.imageUrl}${snapshot.data![index].imageUrl!}",
                                                      ),
                                                    ),
                                                    border: Border.all(),
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
                                                  snapshot
                                                      .data![index].araName!,
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
                                                    // Text(obj
                                                    //     .allCategoryList[index]
                                                    //     .dateTime!
                                                    //     .toString()),
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
                                                      snapshot.data![index]
                                                          .araName!,
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
                        );
                      } else {
                        return Container(
                          color: Colors.amber,
                          height: height * 0.5,
                          child:
                              const Center(child: CircularProgressIndicator()),
                        );
                      }
                    })
              ],
            ));
      }),
    );
  }
}
