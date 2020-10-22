import 'package:flutter/material.dart';
import 'package:flutter_provider/core/base/baseview.dart';
import 'package:flutter_provider/core/viewmodel/temp1_auth_view_model.dart';
import 'package:flutter_provider/shared/styles/colors/colors.dart';
import 'package:flutter_provider/shared/styles/text/styles.dart';
import 'package:flutter_provider/shared/widgets/view/nested_stack.dart';
import 'package:flutter_provider/temp1/views/authentication/register/temp1_register_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';


import 'login/temp1_login_view.dart';

class Temp1AuthView extends StatefulWidget {
  @override
  _Temp1AuthViewState createState() => _Temp1AuthViewState();
}

class _Temp1AuthViewState extends State<Temp1AuthView>
    with
        AutomaticKeepAliveClientMixin<Temp1AuthView>,
        SingleTickerProviderStateMixin {

  ScrollController scrollController;
  TabController tabController;

  Temp1AuthViewModel _authViewModel;
  @override
  void initState() {
    super.initState();
    tabController = new TabController(length: 2, vsync: this);

    scrollController = new ScrollController();

    KeyboardVisibilityNotification().addNewListener(
      onChange: (bool visible) {
        scrollController.animateTo(
            visible
                ? ScreenUtil.instance.setHeight(600)
                : scrollController.position.minScrollExtent,
            curve: Curves.easeIn,
            duration: Duration(milliseconds: 500));
      },
    );

  }

  Widget build(BuildContext context) {
    var headerWidget = NestedStackWidget(
      backgroundImage: "assets/images/background.jpg",
      childImage: "assets/images/starforceW.png",
    );

    return BaseView<Temp1AuthViewModel>(
      onModelReady: (model){
        _authViewModel = model;
        model.setContext(context);
      },
      builder: (context, model, child){
        return DefaultTabController(
          length: 2,
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: NestedScrollView(
              controller: scrollController,
              headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  SliverAppBar(
                    expandedHeight: ScreenUtil.instance.setHeight(700),
                    floating: true,
                    pinned: true,
                    forceElevated: innerBoxIsScrolled,
                    flexibleSpace: headerWidget,
                    bottom: TabBar(
                      controller: tabController,
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
                controller: tabController,
                children: <Widget>[
                  Temp1LoginView(),
                  Temp1RegisterView(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;



  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }
}
