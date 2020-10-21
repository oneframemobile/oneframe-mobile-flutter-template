import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_provider/ui/screens/home/pages/chat.dart';
import 'package:flutter_provider/ui/screens/home/pages/dashboard.dart';
import 'package:flutter_provider/ui/screens/home/pages/profile_view.dart';
import 'package:flutter_provider/ui/screens/home/pages/settings.dart';
import 'package:flutter_provider/ui/shared/widgets/view/empty_view.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomeView> {
  // Properties & Variables needed

  int currentTab = 0; // to keep track of active tab index
  final List<Widget> screens = [
    Dashboard(),
    Chat(),
    ProfileView(),
    Settings(),
  ]; // to store nested tabs
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = Dashboard(); // Our first view in viewport

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
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
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen =
                            Dashboard(); // if user taps on this dashboard tab will be active
                        currentTab = 0;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.home,
                          color: currentTab == 0 ? Colors.orange : Colors.yellow,
                        ),
                        Text(
                          'Anasayfa',
                          style: TextStyle(
                            color: currentTab == 0 ? Colors.orange : Colors.yellow,
                          ),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen =
                            Chat(); // if user taps on this dashboard tab will be active
                        currentTab = 1;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.notifications,
                          color: currentTab == 1 ? Colors.orange : Colors.yellow,
                        ),
                        Text(
                          'Bildirim',
                          style: TextStyle(
                            color: currentTab == 1 ? Colors.orange : Colors.yellow,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),

              // Right Tab bar icons

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen =
                            ProfileView(); // if user taps on this dashboard tab will be active
                        currentTab = 2;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.map,
                          color: currentTab == 2 ? Colors.orange : Colors.yellow,
                        ),
                        Text(
                          'Konum',
                          style: TextStyle(
                            color: currentTab == 2 ? Colors.orange : Colors.yellow,
                          ),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen =
                            Settings(); // if user taps on this dashboard tab will be active
                        currentTab = 3;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.settings,
                          color: currentTab == 3 ? Colors.orange : Colors.yellow,
                        ),
                        Text(
                          'Ayarlar',
                          style: TextStyle(
                            color: currentTab == 3 ? Colors.orange : Colors.yellow,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )

            ],
          ),
        ),
      ),
    );
  }

  String username(HomeScreenArguments args) {
    var splits = args.email.split("@");
    return splits[0];
  }
}

class HomeScreenArguments {
  final String email;

  HomeScreenArguments(this.email);
}
