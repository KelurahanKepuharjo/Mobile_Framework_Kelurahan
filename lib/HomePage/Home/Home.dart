import 'package:flutter/material.dart';
import 'package:kepuharjo_framework/HomePage/Home/widget_headers.dart';
import 'package:kepuharjo_framework/HomePage/Home/widget_pelayanan.dart';
import 'package:kepuharjo_framework/Shared/Mycolor.dart';
import 'package:kepuharjo_framework/Shared/Myfont.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
            ],
          ),
          actions: [
            Padding(
                padding: const EdgeInsets.only(right: 15),
                child: InkWell(
                  onTap: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (context) => const ProfileUser(),
                    //     ));
                  },
                  child: Row(
                    children: [
                      // Text(
                      //   "Achmad Fawaid",
                      //   style: MyFont.poppins(fontSize: 12, color: black),
                      // ),
                      // const SizedBox(
                      //   width: 5,
                      // ),
                      CircleAvatar(
                        radius: 22,
                        backgroundColor: blue,
                        child: const CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.black,
                          // backgroundImage: AssetImage("images/user.png"),
                        ),
                      ),
                    ],
                  ),
                ))
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              WidgetHeaders(),
              WidgetPelayanan(),
            ],
          ),
        ));
  }
}
