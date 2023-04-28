import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:kepuharjo_framework/model/berita_model.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  final String _url = 'http://192.168.1.18:8000/api/';
  Future<List<Berita>> getBerita() async {
    final response = await http.get(Uri.parse("${_url}berita"));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body)['data'];
      return jsonResponse.map((e) => Berita.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load');
    }
  }

  // Future<List<MasterSurat>> getSurat() async {
  //   final response = await http.get(Uri.parse("${_url}surat"));
  //   if (response.statusCode == 200) {
  //     List jsonResponse = json.decode(response.body);
  //     return jsonResponse.map((e) => MasterSurat.fromJson(e)).toList();
  //   } else {
  //     throw Exception('Failed to load');
  //   }
  // }
}
