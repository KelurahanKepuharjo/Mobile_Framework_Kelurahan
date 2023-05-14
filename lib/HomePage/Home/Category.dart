import 'package:flutter/material.dart';
import 'package:kepuharjo_framework/Dashboard_RT/custom_navigation_drawer.dart';
import 'package:kepuharjo_framework/HomePage/Home/widget_berita.dart';
import 'package:kepuharjo_framework/HomePage/Home/widget_headers.dart';
import 'package:kepuharjo_framework/HomePage/Home/widget_pelayanan.dart';
import 'package:kepuharjo_framework/HomePage/Home/widget_text_berita.dart';

class CategoriesWidget extends StatefulWidget {
  const CategoriesWidget({super.key});

  @override
  State<CategoriesWidget> createState() => _CategoriesWidgetState();
}

class _CategoriesWidgetState extends State<CategoriesWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 700,
      margin: EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
          color: white,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: Expanded(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            WidgetPelayanan(),
            WidgetTextBerita(),
            WidgetBerita(),
          ],
        ),
      )),
    );
  }
}
