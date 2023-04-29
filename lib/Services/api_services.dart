import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:kepuharjo_framework/Model/pengajuan_model.dart';
import 'package:kepuharjo_framework/Model/surat_model.dart';
import 'package:kepuharjo_framework/Services/api_connect.dart';
import 'package:kepuharjo_framework/model/berita_model.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  final String _url = 'http://192.168.1.18:8000/api/';
  Future<List<Berita>> getBerita() async {
    final response = await http.get(Uri.parse(Api.berita));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body)['data'];
      return jsonResponse.map((e) => Berita.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load');
    }
  }

  Future<List<MasterSurat>> getSurat() async {
    final response = await http.get(Uri.parse(Api.surat));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body)['data'];
      return jsonResponse.map((e) => MasterSurat.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load');
    }
  }

  Future<List<Pengajuan>> getPengajuan(String status) async {
    final response = await http
        .post(Uri.parse(Api.suratmasuk), body: {"rt": "1", "status": status});
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body)['data'];
      return jsonResponse.map((e) => Pengajuan.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load');
    }
  }
}
