import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/base/view/widgets/button/navigation_bar_button.dart';
import '../../../core/translation/localization_key.dart';
import '../../../core/util/ui_helper.dart';
import '../controller/home_controller.dart';

class HomeView extends GetView<HomeController> {

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: Text(controller.getTitle()),
          backgroundColor: Colors.black,
          automaticallyImplyLeading: false, 
        ),
        body: PageStorage(
          child: controller.currentScreen,
          bucket: controller.bucket,
        ),
        floatingActionButton: FloatingActionButton(
          heroTag: "22",
          child: Icon(
            Icons.pets,
            color: Colors.black,
          ),
          backgroundColor: Colors.yellow,
          onPressed: () {},
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 10,
          color: Colors.black,
          child: Container(
            height: UIHelper.Space200.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    NavigationBarButton(
                      onPressed: () => controller.changeScreen(index: 0),
                      iconData: Icons.home,
                      text: LocalizationKey.Home.tr,
                      color: controller.screenIndex.value == 0
                          ? Colors.orange
                          : Colors.yellow,
                    ),
                    NavigationBarButton(
                      onPressed: () => controller.changeScreen(index: 1),
                      iconData: Icons.notifications,
                      text: LocalizationKey.Notification.tr,
                      color: controller.screenIndex.value == 1
                          ? Colors.orange
                          : Colors.yellow,
                    ),
                  ],
                ),

                // Right Tab bar icons

                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    NavigationBarButton(
                      onPressed: () => controller.changeScreen(index: 2),
                      iconData: Icons.map,
                      text: LocalizationKey.Location.tr,
                      color: controller.screenIndex.value == 2
                          ? Colors.orange
                          : Colors.yellow,
                    ),
                    NavigationBarButton(
                      onPressed: () => controller.changeScreen(index: 3),
                      iconData: Icons.settings,
                      text: LocalizationKey.Settings.tr,
                      color: controller.screenIndex.value == 3
                          ? Colors.orange
                          : Colors.yellow,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
