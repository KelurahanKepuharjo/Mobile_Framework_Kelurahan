import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:kepuharjo_framework/Auth/Auth_services.dart';
import 'package:kepuharjo_framework/Dashboard_RT/MyHomepage_RtRw.dart';
import 'package:kepuharjo_framework/HomePage/Home/widget_berita.dart';
import 'package:kepuharjo_framework/HomePage/Home/widget_headers.dart';
import 'package:kepuharjo_framework/HomePage/Home/widget_text_berita.dart';
import 'package:kepuharjo_framework/Dashboard_RT/Drawer/navigation_drawer.dart';
import 'package:kepuharjo_framework/Dashboard_RT/custom_navigation_drawer.dart';
import 'package:kepuharjo_framework/Dashboard_RT/widget_card.dart';
import 'package:kepuharjo_framework/Dashboard_RT/widget_dashboard.dart';
import 'package:kepuharjo_framework/Dashboard_RT/widget_teks_dashboard.dart';
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
        showSuccessDialog(context);
        break;
    }
  }

  showSuccessDialog(BuildContext context) {
    AwesomeDialog(
      context: context,
      animType: AnimType.SCALE,
      dialogType: DialogType.WARNING,
      title: 'Warning!',
      titleTextStyle: MyFont.poppins(
          fontSize: 25, color: lavender, fontWeight: FontWeight.bold),
      desc: 'Apakah anda yakin, untuk Keluar dari aplikasi',
      descTextStyle: MyFont.poppins(fontSize: 12, color: softgrey),
      btnOkOnPress: () {
        authServices.logout(context);
      },
      btnCancelOnPress: () {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const DashboardRT(),
            ),
            (route) => false);
      },
      btnCancelIcon: Icons.highlight_off_rounded,
      btnOkIcon: Icons.task_alt_rounded,
    ).show();
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
            crossAxisAlignment: CrossAxisAlignment.start,
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
