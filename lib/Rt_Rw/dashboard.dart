import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:kepuharjo_framework/Auth/Auth_services.dart';
import 'package:kepuharjo_framework/Rt_Rw/Drawer/navigation_drawer.dart';
import 'package:kepuharjo_framework/Rt_Rw/custom_navigation_drawer.dart';
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
        backgroundColor: white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: white,
          shadowColor: Colors.transparent,
          title: Row(
            children: [
              Text(
                "S-Kepuharjo",
                style: MyFont.montserrat(
                    fontSize: 18, color: black, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          leading: InkWell(
            onTap: () {
              _openDrawer();
            },
            child: Icon(
              Icons.menu_rounded,
              color: black,
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Theme(
                data: Theme.of(context).copyWith(
                    textTheme: TextTheme().apply(bodyColor: Colors.white),
                    dividerColor: Colors.white,
                    iconTheme: IconThemeData(color: Colors.white)),
                child: PopupMenuButton<int>(
                  color: Colors.white,
                  itemBuilder: (context) => [
                    PopupMenuItem<int>(
                        value: 0,
                        child: Row(
                          children: [
                            Icon(
                              Icons.info,
                              color: blue,
                            ),
                            const SizedBox(
                              width: 7,
                            ),
                            Text(
                              "Info Aplikasi",
                              style: MyFont.poppins(fontSize: 12, color: black),
                            )
                          ],
                        )),
                    PopupMenuItem<int>(
                        value: 1,
                        child: Row(
                          children: [
                            Icon(
                              Icons.help,
                              color: blue,
                            ),
                            const SizedBox(
                              width: 7,
                            ),
                            Text(
                              "Log Out",
                              style: MyFont.poppins(fontSize: 12, color: black),
                            )
                          ],
                        )),
                  ],
                  onSelected: (item) => selectedItem(context, item),
                ),
              ),
            ),
          ],
        ),
        drawer: CollapsingNavigationDrawer(),
        body: SafeArea(
          child: Center(
            child: Container(
              foregroundDecoration: BoxDecoration(
                color: black,
                backgroundBlendMode: BlendMode.saturation,
              ),
            ),
          ),
        ));
  }
}
