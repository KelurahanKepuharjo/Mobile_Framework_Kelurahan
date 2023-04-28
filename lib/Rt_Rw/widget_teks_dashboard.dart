import 'package:flutter/material.dart';
import 'package:kepuharjo_framework/Shared/Mycolor.dart';
import 'package:kepuharjo_framework/Shared/Myfont.dart';

class WidgetTextDashboard extends StatelessWidget {
  const WidgetTextDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 0, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Dashboard",
                      style: MyFont.poppins(
                          fontSize: 13,
                          color: black,
                          fontWeight: FontWeight.w500)),
                ],
              ),
            )
          ]),
    );
  }
}
