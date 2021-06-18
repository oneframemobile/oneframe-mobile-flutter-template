import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/base/view/widgets/stack/nested_stack.dart';
import '../../../core/style/app_colors.dart';
import '../../../core/style/app_text_styles.dart';
import '../../../core/util/ui_helper.dart';
import '../controller/temp_2_auth_controller.dart';
import 'tabs/temp_2_login_tab.dart';
import 'tabs/temp_2_register_tab.dart';

class Temp2AuthView extends GetView<Temp2AuthController> {
  final controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: NestedScrollView(
          controller: controller.scrollController,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: UIHelper.Space700.h,
                floating: true,
                pinned: true,
                forceElevated: innerBoxIsScrolled,
                flexibleSpace: NestedStack(
                  backgroundImage: "assets/images/background.jpg",
                  childImage: "assets/images/starforce.png",
                ),
                bottom: TabBar(
                  controller: controller.tabController,
                  labelStyle: tabTextStyle,
                  unselectedLabelStyle: tabUnselectedTextStyle,
                  indicatorColor: indicatorColor,
                  indicatorWeight: 4,
                  tabs: <Widget>[
                    Tab(
                      text: "Giriş",
                    ),
                    Tab(
                      text: "Üye Ol",
                    ),
                  ],
                ),
              ),
            ];
          },
          body: TabBarView(
            controller: controller.tabController,
            children: <Widget>[
              Temp2LoginTab(),
              Temp2RegisterTab(),
            ],
          ),
        ),
      ),
    );
  }
}
