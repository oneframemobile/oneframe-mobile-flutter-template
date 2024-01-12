import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '/core/base/view/widgets/stack/nested_stack.dart';
import '/core/base/view/widgets/wrapper/keyboard_hider.dart';
import '/core/style/app_color.dart';
import '/core/style/app_text_style.dart';
import '../../../../core/localization/localization_key.dart';
import '/core/util/ui_helper.dart';
import '../../controller/authentication_controller.dart';
import 'tabs/temp_1_login_tab.dart';
import 'tabs/temp_1_register_tab.dart';

class Temp1AuthView extends GetView<AuthenticationController> {
  @override
  Widget build(BuildContext context) {
    return KeyboardHider(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: NestedScrollView(
            controller: controller.scrollController,
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  expandedHeight: UIHelper.Space500.h,
                  floating: true,
                  pinned: true,
                  forceElevated: innerBoxIsScrolled,
                  flexibleSpace: NestedStack(
                    backgroundImage: "assets/images/background.jpg",
                    childImage: "assets/images/starforceW.png",
                  ),
                  bottom: TabBar(
                    controller: controller.tabController,
                    labelStyle: tabTextStyle,
                    unselectedLabelStyle: tabUnselectedTextStyle,
                    indicatorColor: indicatorColor,
                    indicatorWeight: 4,
                    tabs: <Widget>[
                      Tab(text: LocalizationKey.Login.tr),
                      Tab(text: LocalizationKey.Register.tr),
                    ],
                  ),
                ),
              ];
            },
            body: TabBarView(
              controller: controller.tabController,
              children: <Widget>[
                Temp1LoginTab(),
                Temp1RegisterTab(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
