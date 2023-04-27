import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:kepuharjo_framework/HomePage/HomePage.dart';
import 'package:kepuharjo_framework/Rt_Rw/dashboard.dart';
import 'package:kepuharjo_framework/Screen/Login/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String baseUrl = "http://192.168.0.117:8000/api/auth";
const Map<String, String> headers = {"Content-Type": "application/json"};

class AuthServices {
  Future logout(BuildContext context) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      var res = await http.post(Uri.parse('$baseUrl/logout'),
          headers: {"Authorization": "Bearer $token"});
      if (res.statusCode == 200) {
        prefs.remove('token');
        prefs.remove('user');
        prefs.remove('role');
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginPage(),
          ),
        );
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
