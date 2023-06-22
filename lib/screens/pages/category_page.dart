// ignore_for_file: avoid_print

import 'package:admin_panel_so/controller/category_controller.dart';
import 'package:admin_panel_so/utils/flushbar.dart';
import 'package:admin_panel_so/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController arabicController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  clearcontroller() {
    nameController.clear();
    arabicController.clear();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: GetBuilder<CategoryCOntroller>(initState: (state) {
        CategoryCOntroller.to.getMyCategoryListMethod();
      }, builder: (obj) {
        return SizedBox(
            height: height,
            width: width,
            child: Form(
              key: formKey,
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
                          obj.isImageSelected == false
                              ? InkWell(
                                  onTap: () {
                                    obj.getFromGallery(context);
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
                                          image: NetworkImage(obj.imageUrl!)),
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
                                          borderRadius:
                                              BorderRadius.circular(20),
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
                                          borderRadius:
                                              BorderRadius.circular(20),
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
                          Padding(
                            padding: const EdgeInsets.all(30.0),
                            child: GestureDetector(
                              onTap: () {
                                print(nameController.text);
                                print(arabicController.text);
                                print(obj.imageUrl);
                                if (formKey.currentState!.validate()) {
                                  obj.addCategoryMethod(
                                      context,
                                      nameController.text,
                                      arabicController.text,
                                      obj.imageUrl!);
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
                  Expanded(
                    child: SizedBox(
                      height: height,
                      width: width,
                      // color: Colors.amber,
                      child: obj.allCategoryList.isEmpty
                          ? const Center(child: Text("No Products found"))
                          : GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 4,
                              ),
                              itemCount: obj.allCategoryList.length,
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
                                                          image: NetworkImage(obj
                                                              .allCategoryList[
                                                                  index]
                                                              .catImage!)),
                                                      border: Border.all()),
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
                                                      itemBuilder: (BuildContext
                                                          context) {
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
                                                  obj.allCategoryList[index]
                                                      .englishName!,
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
                                                      obj.allCategoryList[index]
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
                  )
                ],
              ),
            ));
      }),
    );
  }
}
