import 'package:flutter/material.dart';
import 'package:kepuharjo_framework/HomePage/Home/Home.dart';
import 'package:kepuharjo_framework/HomePage/Pengajuan/Pengajuan.dart';
import 'package:kepuharjo_framework/HomePage/Status/Status.dart';
import 'package:kepuharjo_framework/Shared/Mycolor.dart';
import 'package:kepuharjo_framework/Shared/Myfont.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;
  List<Widget> screen = <Widget>[
    const Home(),
    const Pengajuan(),
    const Status(),
  ];

  List navbutton = [
    {
      "active_icon": Icons.home_rounded,
      "non_active_icon": Icons.home_outlined,
      "label": "Home"
    },
    {
      "active_icon": Icons.assignment,
      "non_active_icon": Icons.assignment_outlined,
      "label": "Pengajuan"
    },
    {
      "active_icon": Icons.restore,
      "non_active_icon": Icons.restore,
      "label": "Status"
    },
  ];
  void onTap(value) {
    setState(() {
      index = value;
      // _currentUser.getUserInfo();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: screen[index],
      bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: true,
          unselectedLabelStyle: MyFont.poppins(
              fontSize: 12, color: grey, fontWeight: FontWeight.w300),
          selectedLabelStyle: MyFont.poppins(
              fontSize: 12, color: white, fontWeight: FontWeight.w500),
          selectedFontSize: 12,
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: true,
          selectedItemColor: blue,
          unselectedItemColor: softgrey,
          currentIndex: index,
          onTap: onTap,
          elevation: 0,
          backgroundColor: Colors.transparent,
          items: List.generate(3, (index) {
            var navBtn = navbutton[index];
            return BottomNavigationBarItem(
                icon: Icon(navBtn["non_active_icon"]),
                activeIcon: Icon(navBtn["active_icon"]),
                label: navBtn["label"]);
          })),
    );
  }
}
