import 'package:flutter/material.dart';
import 'package:flutter_provider/core/base/baseview.dart';
import 'package:flutter_provider/core/viewmodel/authentication_view_model.dart';
import 'package:flutter_provider/temp2/views/authentication/register/register_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_provider/shared/styles/colors/colors.dart';
import 'package:flutter_provider/shared/styles/text/styles.dart';
import 'package:flutter_provider/shared/widgets/view/nested_stack.dart';

import 'login/login_view.dart';

class AuthenticationView extends StatefulWidget {
  @override
  _AuthenticationViewState createState() => _AuthenticationViewState();
}

class _AuthenticationViewState extends State<AuthenticationView> with SingleTickerProviderStateMixin {
  AuthenticationViewModel _authenticationViewModel;

  @override
  Widget build(BuildContext context) {
    return BaseView<AuthenticationViewModel>(
      onModelReady: (model) {
        _authenticationViewModel = model;
        _authenticationViewModel.scrollController = new ScrollController();
        _authenticationViewModel.tabController = new TabController(length: 2, vsync: this);
        _authenticationViewModel.setContext(context);
      },
      builder: (context, model, child) {
        return DefaultTabController(
          length: 2,
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: NestedScrollView(
              controller: _authenticationViewModel.scrollController,
              headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  SliverAppBar(
                    expandedHeight: ScreenUtil.instance.setHeight(700),
                    floating: true,
                    pinned: true,
                    forceElevated: innerBoxIsScrolled,
                    flexibleSpace: NestedStackWidget(
                      backgroundImage: "assets/images/background.jpg",
                      childImage: "assets/images/starforce.png",
                    ),
                    bottom: TabBar(
                      controller: _authenticationViewModel.tabController,
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
                controller: _authenticationViewModel.tabController,
                children: <Widget>[
                  LoginView(),
                  RegisterView(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
