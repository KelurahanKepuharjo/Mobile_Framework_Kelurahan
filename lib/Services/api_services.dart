import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:kepuharjo_framework/Auth/Auth_services.dart';
import 'package:kepuharjo_framework/Model/pengajuan_model.dart';
import 'package:kepuharjo_framework/Model/surat_model.dart';
import 'package:kepuharjo_framework/Model/user_model.dart';
import 'package:kepuharjo_framework/Services/api_connect.dart';
import 'package:kepuharjo_framework/model/berita_model.dart';
import 'package:kepuharjo_framework/Services/notifikasi_services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  Future<String> _getToken() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = localStorage.getString('token');
    return token.toString();
  }

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
    final auth = AuthServices();
    User? user = await auth.me();
    final rt = user?.masyarakat?.kks?.rt?.toString() ?? '';
    print("ini rt" + rt);
    final response = await http
        .post(Uri.parse(Api.suratmasuk), body: {"rt": rt, "status": status});
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body)['data'];
      return jsonResponse.map((e) => Pengajuan.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load');
    }
  }

  Future<List<Pengajuan>> getRekap() async {
    final auth = AuthServices();
    User? user = await auth.me();
    final rt = user?.masyarakat?.kks?.rt?.toString() ?? '';
    print("ini rt" + rt);
    final response = await http.post(Uri.parse(Api.rekap), body: {"rt": rt});
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body)['data'];
      return jsonResponse.map((e) => Pengajuan.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load');
    }
  }

  Future<List<dynamic>> keluarga(String nokk) async {
    final response =
        await http.post(Uri.parse(Api.keluarga), body: {"no_kk": nokk});
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body)['data'];
      return jsonData;
    } else {
      throw Exception('Failed to load');
    }
  }

  Future<List<dynamic>> getAllData(String rt) async {
    List<dynamic> allData = [];
    allData.add(await getBerita());
    allData.add(await getSurat());
    allData.add(await getRekap());
    allData.add(await getPengajuan("Diajukan"));
    allData.add(await getPengajuan("Disetujui"));
    allData.add(await getPengajuan("Ditolak"));
    return allData;
  }
}
