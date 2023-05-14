import 'package:flutter/material.dart';
import 'package:kepuharjo_framework/Dashboard_RT/custom_navigation_drawer.dart';
import 'package:kepuharjo_framework/HomePage/Pengaturan/Screen/ubah_nohp.dart';

import '../../Shared/Mycolor.dart';

class Pengaturan extends StatefulWidget {
  const Pengaturan({super.key});

  @override
  State<Pengaturan> createState() => _PengaturanState();
}

class _PengaturanState extends State<Pengaturan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
          backgroundColor: white,
          shadowColor: Colors.transparent,
          automaticallyImplyLeading: false,
          title: Text(
            "Pengaturan",
            style: MyFont.poppins(
                fontSize: 14, color: black, fontWeight: FontWeight.bold),
          ),
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Icon(
                Icons.keyboard_arrow_left_rounded,
                color: black,
              ),
            ),
          )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              leading: Icon(
                Icons.person_outline_rounded,
                size: 25,
                color: black,
              ),
              title: Text(
                "Informasi Akun",
                style: MyFont.poppins(fontSize: 13, color: black),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UbahNomerHandphone(),
                    ));
              },
              leading: Icon(
                Icons.phonelink_setup_rounded,
                size: 25,
                color: black,
              ),
              title: Text(
                "Ubah Nomer Telepon",
                style: MyFont.poppins(fontSize: 13, color: black),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.people_outline_rounded,
                size: 25,
                color: black,
              ),
              title: Text(
                "Daftar Keluarga",
                style: MyFont.poppins(fontSize: 13, color: black),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.location_on_outlined,
                size: 25,
                color: black,
              ),
              title: Text(
                "Lokasi Kelurahan",
                style: MyFont.poppins(fontSize: 13, color: black),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.info_outline_rounded,
                size: 25,
                color: black,
              ),
              title: Text(
                "Info Aplikasi",
                style: MyFont.poppins(fontSize: 13, color: black),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.help_outline_rounded,
                size: 25,
                color: black,
              ),
              title: Text(
                "Tentang",
                style: MyFont.poppins(fontSize: 13, color: black),
              ),
            )
          ],
        ),
      ),
    );
  }
}
