import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:kepuharjo_framework/Auth/Auth_services.dart';
import 'package:kepuharjo_framework/HomePage/Home/widget_berita.dart';
import 'package:kepuharjo_framework/HomePage/Home/widget_headers.dart';
import 'package:kepuharjo_framework/HomePage/Home/widget_text_berita.dart';
import 'package:kepuharjo_framework/Rt_Rw/Drawer/navigation_drawer.dart';
import 'package:kepuharjo_framework/Rt_Rw/custom_navigation_drawer.dart';
import 'package:kepuharjo_framework/Rt_Rw/widget_card.dart';
import 'package:kepuharjo_framework/Rt_Rw/widget_dashboard.dart';
import 'package:kepuharjo_framework/Rt_Rw/widget_teks_dashboard.dart';
import 'package:kepuharjo_framework/Screen/Login/login.dart';
import 'package:kepuharjo_framework/Shared/Mycolor.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboarRtRw extends StatefulWidget {
  const DashboarRtRw({super.key});

  @override
  State<DashboarRtRw> createState() => _DashboarRtRwState();
}

class _DashboarRtRwState extends State<DashboarRtRw> {
  var userData;
  void _getUserInfo() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var userJson = localStorage.getString('user');
    var user = json.decode(userJson!);
    setState(() {
      userData = user;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getUserInfo();
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _openDrawer() {
    _scaffoldKey.currentState?.openDrawer();
  }

  final authServices = AuthServices();
  void selectedItem(BuildContext context, item) {
    switch (item) {
      case 0:
        // Navigator.of(context).push(
        //     MaterialPageRoute(builder: (context) => const InfoAplikasi()));
        break;

      case 1:
        authServices.logout(context);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: Color.fromARGB(255, 248, 248, 248),
        // drawer: CollapsingNavigationDrawer(),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            children: const [
              WidgetTextDashboard(),
              WidgetCard(),
              WidgetTextBerita(),
              WidgetBerita(),
              SizedBox(
                height: 30,
              )
            ],
          ),
        )));
  }
}
