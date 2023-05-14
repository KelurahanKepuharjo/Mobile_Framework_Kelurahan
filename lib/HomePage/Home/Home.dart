import 'package:flutter/material.dart';
import 'package:kepuharjo_framework/Auth/Auth_services.dart';
import 'package:kepuharjo_framework/HomePage/Home/widget_berita.dart';
import 'package:kepuharjo_framework/HomePage/Home/widget_headers.dart';
import 'package:kepuharjo_framework/HomePage/Home/widget_pelayanan.dart';
import 'package:kepuharjo_framework/HomePage/Home/widget_text_berita.dart';
import 'package:kepuharjo_framework/HomePage/HomePage.dart';
import 'package:kepuharjo_framework/Shared/Mycolor.dart';
import 'package:kepuharjo_framework/Shared/Myfont.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final authServices = AuthServices();
  showSuccessDialog(BuildContext context) {
    AwesomeDialog(
      context: context,
      animType: AnimType.SCALE,
      dialogType: DialogType.WARNING,
      title: 'Warning!',
      titleTextStyle: MyFont.poppins(
          fontSize: 25, color: lavender, fontWeight: FontWeight.bold),
      desc: 'Apakah anda yakin, Jika data yang anda masukan telah benar',
      descTextStyle: MyFont.poppins(fontSize: 12, color: softgrey),
      btnOkOnPress: () {
        authServices.logout(context);
      },
      btnCancelOnPress: () {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const HomePage(),
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
        backgroundColor: white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          shadowColor: Colors.transparent,
          backgroundColor: white,
          title: Row(
            children: [
              Text(
                "S-Kepuharjo",
                style: MyFont.montserrat(
                    fontSize: 18, color: black, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                width: 5,
              ),
              Image.asset(
                "images/mylogo.png",
                width: 30,
                height: 30,
              ),
            ],
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 5.0),
              child: IconButton(
                onPressed: () {
                  showMenu(
                      context: context,
                      position: RelativeRect.fromLTRB(
                          MediaQuery.of(context).size.width - 50, // right
                          50,
                          0,
                          0),
                      items: [
                        PopupMenuItem<int>(
                            value: 0,
                            child: Row(
                              children: [
                                Icon(
                                  Icons.settings,
                                  color: blue,
                                  size: 20,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Pengaturan",
                                  style: MyFont.poppins(
                                      fontSize: 12, color: black),
                                ),
                              ],
                            )),
                        PopupMenuItem<int>(
                            value: 1,
                            child: Row(
                              children: [
                                Icon(
                                  Icons.logout_rounded,
                                  color: blue,
                                  size: 20,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Logout",
                                  style: MyFont.poppins(
                                      fontSize: 12, color: black),
                                ),
                              ],
                            )),
                      ]).then((value) {
                    if (value != null) {
                      if (value == 1) {
                        showSuccessDialog(context);
                      } else {}
                    }
                  });
                },
                icon: Icon(
                  Icons.more_vert,
                  color: black,
                ),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              WidgetHeaders(),
              WidgetPelayanan(),
              WidgetTextBerita(),
              WidgetBerita(),
              SizedBox(
                height: 50,
              )
            ],
          ),
        ));
  }
}
