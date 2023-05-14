import 'package:flutter/material.dart';
import 'package:kepuharjo_framework/Shared/Mycolor.dart';
import 'package:kepuharjo_framework/Shared/Myfont.dart';

class WidgetDashboard extends StatefulWidget {
  const WidgetDashboard({super.key});

  @override
  State<WidgetDashboard> createState() => _WidgetDashboardState();
}

class _WidgetDashboardState extends State<WidgetDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            getCard("title1", Icons.message_outlined),
            getCard("title2", Icons.message_outlined),
            getCard("title3", Icons.message_outlined),
            getCard("title4", Icons.message_outlined),
          ],
        ),
      ),
    );
  }

  Container getCard(String title, IconData icon) {
    return Container(
      height: 160,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: white,
      ),
      child: Column(
        children: [
          Text(
            title,
            style: MyFont.poppins(fontSize: 14, color: black),
          ),
          Row(
            children: [
              Spacer(),
              Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100), color: softgrey),
                child: Icon(
                  icon,
                  size: 20,
                  color: blue,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
