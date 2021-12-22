import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:tugas_mulmed/screens/Contents/contents.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  int currentPage = 0;
  GlobalKey bottomNavigationKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          decoration: BoxDecoration(color: Colors.white),
          child: Center(
            child: _getPage(currentPage),
          ),
        ),
        bottomNavigationBar: FancyBottomNavigation(
          tabs: [
            TabData(
                iconData: Icons.verified_user_outlined,
                title: "Data Kasus",
                onclick: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => StatistikScreen()))),
            TabData(
                iconData: Icons.health_and_safety_outlined,
                title: "Data Vaksin",
                onclick: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => VaksinScreen()))),
          ],
          key: bottomNavigationKey,
          onTabChangedListener: (position) {
            setState(() {
              currentPage = position;
            });
          },
        ));
  }

  _getPage(int page) {
    switch (page) {
      case 0:
        return StatistikScreen();
        break;
      case 1:
        return VaksinScreen();
      default:
    }
  }
}
