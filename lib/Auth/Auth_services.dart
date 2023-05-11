import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:kepuharjo_framework/HomePage/HomePage.dart';
import 'package:kepuharjo_framework/Model/keluarga.dart';
import 'package:kepuharjo_framework/Model/user_model.dart';
import 'package:kepuharjo_framework/Rt_Rw/dashboard.dart';
import 'package:kepuharjo_framework/Screen/Login/login.dart';
import 'package:kepuharjo_framework/Services/api_connect.dart';
import 'package:shared_preferences/shared_preferences.dart';

// const String baseUrl = "http://192.168.1.18:8000/api/auth";
// const Map<String, String> headers = {"Content-Type": "application/json"};

class AuthServices {
  Future logout(BuildContext context) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      var res = await http.post(Uri.parse(Api.logout),
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

  Future<User?> me() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      var res = await http
          .get(Uri.parse(Api.me), headers: {"Authorization": "Bearer $token"});
      if (res.statusCode == 200) {
        final jsonData = json.decode(res.body)['data'];
        final user = User.fromJson(jsonData);
        prefs.setString('data', json.encode(jsonData));
        return user;
      } else {
        throw Exception("Failed to fetch user data");
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<List<Keluarga>> getMasyarakat() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    var res = await http.get(Uri.parse(Api.keluarga),
        headers: {"Authorization": "Bearer $token"});
    if (res.statusCode == 200) {
      Map<String, dynamic> jsonResponse = json.decode(res.body)['data'];
      List<dynamic> masyarakat = jsonResponse['masyarakat'];
      return masyarakat.map((e) => Keluarga.fromJson(jsonResponse)).toList();
    } else {
      throw Exception("Failed to get keluarga data");
    }
  }
}
