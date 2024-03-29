import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kepuharjo_framework/Dashboard_RW/homepage_rw.dart';

import 'HomePage/HomePage.dart';
import 'package:kepuharjo_framework/Dashboard_RT/Drawer/select.dart';
import 'package:kepuharjo_framework/Dashboard_RT/MyHomepage_RtRw.dart';
import 'package:kepuharjo_framework/Dashboard_RT/dashboard.dart';
import 'package:kepuharjo_framework/Screen/Login/login.dart';
import 'package:kepuharjo_framework/Screen/Wellcome/onboarding.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(ChangeNotifierProvider(
      create: (_) => SelectedPage(), child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isLoggedIn = false;
  String _userRole = '';
  void _checkIfLoggedIn() async {
    // check if token is there
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = localStorage.getString('token');
    if (token != null) {
      var userJson = localStorage.getString('user');
      var role = localStorage.getString('role');
      var user = json.decode(userJson!);
      setState(() {
        _isLoggedIn = true;
        _userRole = role!;
      });
    }
  }

  Future<String> _getUserRole() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var userJson = localStorage.getString('role');
    return userJson.toString();
  }

  @override
  void initState() {
    _checkIfLoggedIn();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'S-Kepuharjo',
        themeMode: ThemeMode.system,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: _isLoggedIn
            ? FutureBuilder(
                future: _getUserRole(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else {
                    if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      var userRole = snapshot.data;
                      if (userRole == '4') {
                        return HomePage();
                      } else if (userRole == '2') {
                        return DashboardRT();
                      } else if (userRole == '3') {
                        return DashboardRW();
                      } else {
                        return OnboardingScreen();
                      }
                    }
                  }
                },
              )
            : OnboardingScreen());
  }
}
