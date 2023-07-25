import 'package:admin_panel_so/sub_admin/controller/sub_admin_profile_controller/sub_admin_profile_controller.dart';
import 'package:admin_panel_so/sub_admin/pages/sub_category.dart';
import 'package:admin_panel_so/sub_admin/pages/sub_homePage.dart';
import 'package:admin_panel_so/sub_admin/pages/sub_menupage.dart';
import 'package:admin_panel_so/sub_admin/pages/sub_reviews_page.dart';
import 'package:admin_panel_so/sub_admin/pages/sub_slider.dart';
import 'package:admin_panel_so/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubAdminDashBoard extends StatefulWidget {
  const SubAdminDashBoard({super.key});

  @override
  State<SubAdminDashBoard> createState() => _SubAdminDashBoardState();
}

class _SubAdminDashBoardState extends State<SubAdminDashBoard> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: GetBuilder<SubAdminProfileController>(initState: (state) {
      Get.put(SubAdminProfileController());
      SubAdminProfileController.to.getSubAdminProfileMethod();
    }, builder: (obj) {
      return SizedBox(
        height: height,
        width: width,
        child: Column(
          children: [
            Container(
              height: height * 0.1,
              width: width,
              color: AdminTheme.primaryColor,
              child: Padding(
                padding:
                    EdgeInsets.only(left: width * 0.03, right: width * 0.03),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      // snapshot.data!.branchName!.toUpperCase(),
                      obj.branchName.toUpperCase(),
                      style: TextStyle(
                          color: AdminTheme.secondryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: width * 0.02),
                    ),
                    SizedBox(
                      height: height,
                      width: width * 0.3,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            // snapshot.data!.name!.toUpperCase(),
                            obj.adminName.toUpperCase(),
                            style: TextStyle(
                                color: AdminTheme.secondryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: width * 0.02),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Container(
                              height: height,
                              width: width * 0.05,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: AdminTheme.secondryColor,
                                      width: 3),
                                  shape: BoxShape.circle),
                              child: Icon(
                                Icons.person,
                                color: AdminTheme.secondryColor,
                                size: width * 0.02,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                height: height,
                width: width,
                color: AdminTheme.lightColor,
                child: Padding(
                  padding: EdgeInsets.only(top: height * 0.01),
                  child: Row(
                    children: [
                      Container(
                        height: height,
                        width: width * 0.25,
                        decoration: const BoxDecoration(
                            color: AdminTheme.primaryColor,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20),
                                bottomRight: Radius.circular(20))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: height * 0.05,
                            ),
                            obj.subAdmin == "sub home"
                                ? Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Card(
                                      elevation: 10,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Container(
                                        height: height * 0.07,
                                        width: width * 0.8,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                                color:
                                                    AdminTheme.secondryColor)),
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              width: width * 0.01,
                                            ),
                                            Icon(
                                              Icons.home,
                                              color: AdminTheme.primaryColor,
                                              size: width * 0.02,
                                            ),
                                            Text(
                                              " HomePage",
                                              style: TextStyle(
                                                  color:
                                                      AdminTheme.primaryColor,
                                                  fontSize: width * 0.015),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                : Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: InkWell(
                                      onTap: () {
                                        obj.changeSubAdminMenue("sub home");
                                      },
                                      child: SizedBox(
                                        height: height * 0.07,
                                        width: width * 0.8,
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              width: width * 0.01,
                                            ),
                                            Icon(
                                              Icons.home,
                                              color: Colors.black,
                                              size: width * 0.02,
                                            ),
                                            Text(
                                              " HomePage",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: width * 0.015),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                            SizedBox(
                              height: height * 0.002,
                            ),

                            obj.subAdmin == "category"
                                ? Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Card(
                                      elevation: 10,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Container(
                                        height: height * 0.07,
                                        width: width * 0.8,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                                color:
                                                    AdminTheme.secondryColor)),
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              width: width * 0.01,
                                            ),
                                            Icon(
                                              Icons.shopping_bag_outlined,
                                              color: AdminTheme.primaryColor,
                                              size: width * 0.02,
                                            ),
                                            Text(
                                              " Menue Category",
                                              style: TextStyle(
                                                  color:
                                                      AdminTheme.primaryColor,
                                                  fontSize: width * 0.015),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                : Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: InkWell(
                                      onTap: () {
                                        obj.changeSubAdminMenue("category");
                                      },
                                      child: SizedBox(
                                        height: height * 0.07,
                                        width: width * 0.8,
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              width: width * 0.01,
                                            ),
                                            Icon(
                                              Icons.shopping_bag_outlined,
                                              color: Colors.black,
                                              size: width * 0.02,
                                            ),
                                            Text(
                                              " Menue  Category",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: width * 0.015),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                            SizedBox(
                              height: height * 0.002,
                            ),
                            obj.subAdmin == "menue"
                                ? Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Card(
                                      elevation: 10,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Container(
                                        height: height * 0.07,
                                        width: width * 0.8,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                                color:
                                                    AdminTheme.secondryColor)),
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              width: width * 0.01,
                                            ),
                                            Icon(
                                              Icons.store,
                                              color: AdminTheme.primaryColor,
                                              size: width * 0.02,
                                            ),
                                            Text(
                                              " Menue",
                                              style: TextStyle(
                                                  color:
                                                      AdminTheme.primaryColor,
                                                  fontSize: width * 0.015),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                : Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: InkWell(
                                      onTap: () {
                                        obj.changeSubAdminMenue("menue");
                                      },
                                      child: SizedBox(
                                        height: height * 0.07,
                                        width: width * 0.8,
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              width: width * 0.01,
                                            ),
                                            Icon(
                                              Icons.shopping_bag_outlined,
                                              color: Colors.black,
                                              size: width * 0.02,
                                            ),
                                            Text(
                                              " Menue ",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: width * 0.015),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                            SizedBox(
                              height: height * 0.002,
                            ),
                            obj.subAdmin == "Slider"
                                ? Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Card(
                                      elevation: 10,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Container(
                                        height: height * 0.07,
                                        width: width * 0.8,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                                color:
                                                    AdminTheme.secondryColor)),
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              width: width * 0.01,
                                            ),
                                            Icon(
                                              Icons.store,
                                              color: AdminTheme.primaryColor,
                                              size: width * 0.02,
                                            ),
                                            Text(
                                              " Slider",
                                              style: TextStyle(
                                                  color:
                                                      AdminTheme.primaryColor,
                                                  fontSize: width * 0.015),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                : Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: InkWell(
                                      onTap: () {
                                        obj.changeSubAdminMenue("Slider");
                                      },
                                      child: SizedBox(
                                        height: height * 0.07,
                                        width: width * 0.8,
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              width: width * 0.01,
                                            ),
                                            Icon(
                                              Icons.shopping_bag_outlined,
                                              color: Colors.black,
                                              size: width * 0.02,
                                            ),
                                            Text(
                                              " Slider ",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: width * 0.015),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                            SizedBox(
                              height: height * 0.002,
                            ),
                            obj.subAdmin == "Reviews"
                                ? Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Card(
                                      elevation: 10,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Container(
                                        height: height * 0.07,
                                        width: width * 0.8,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                                color:
                                                    AdminTheme.secondryColor)),
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              width: width * 0.01,
                                            ),
                                            Icon(
                                              Icons.store,
                                              color: AdminTheme.primaryColor,
                                              size: width * 0.02,
                                            ),
                                            Text(
                                              " Reviews ",
                                              style: TextStyle(
                                                  color:
                                                      AdminTheme.primaryColor,
                                                  fontSize: width * 0.015),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                : Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: InkWell(
                                      onTap: () {
                                        obj.changeSubAdminMenue("Reviews");
                                      },
                                      child: SizedBox(
                                        height: height * 0.07,
                                        width: width * 0.8,
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              width: width * 0.01,
                                            ),
                                            Icon(
                                              Icons.shopping_bag_outlined,
                                              color: Colors.black,
                                              size: width * 0.02,
                                            ),
                                            Text(
                                              " Reviews ",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: width * 0.015),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                            // SizedBox(
                            //   height: height * 0.002,
                            // ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: InkWell(
                                onTap: () {},
                                child: SizedBox(
                                  height: height * 0.07,
                                  width: width * 0.8,
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: width * 0.01,
                                      ),
                                      Icon(
                                        Icons.logout,
                                        color: Colors.black,
                                        size: width * 0.02,
                                      ),
                                      Text(
                                        " LogOut ",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: width * 0.015),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: height * 0.01,
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: width * 0.01,
                      ),
                      Expanded(
                        child: SizedBox(
                          height: height,
                          width: width,
                          child: obj.subAdmin == "sub home"
                              ? const SubHomePage()
                              : obj.subAdmin == "category"
                                  ? const SubCategoryPage()
                                  : obj.subAdmin == "menue"
                                      ? const SubMenuePage()
                                      : obj.subAdmin == "Slider"
                                          ? const SliderPage()
                                          : obj.subAdmin == "Reviews"
                                              ? const ReviewsPage()
                                              : const SizedBox(),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      );
    }));
  }
}
