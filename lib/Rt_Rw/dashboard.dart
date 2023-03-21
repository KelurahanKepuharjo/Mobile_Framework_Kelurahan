import 'package:flutter/material.dart';
import 'package:kepuharjo_framework/Shared/Mycolor.dart';

class DashboarRtRw extends StatefulWidget {
  const DashboarRtRw({super.key});

  @override
  State<DashboarRtRw> createState() => _DashboarRtRwState();
}

class _DashboarRtRwState extends State<DashboarRtRw> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: InkWell(
          onTap: () {},
          child: Icon(
            Icons.menu_rounded,
            color: black,
          ),
        ),
        actions: [
          GestureDetector(
            child: Row(
              children: [
                Spacer(),
                CircleAvatar(
                  radius: 22,
                  backgroundColor: blue,
                  child: CircleAvatar(
                    backgroundColor: white,
                    radius: 20,
                  ),
                )
              ],
            ),
          )
        ],
      ),
      drawer: Drawer(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [],
        ),
      ),
    );
  }
}
