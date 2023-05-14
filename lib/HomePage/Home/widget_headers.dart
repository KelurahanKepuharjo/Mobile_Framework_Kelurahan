import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kepuharjo_framework/Dashboard_RT/custom_navigation_drawer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:kepuharjo_framework/Shared/Mycolor.dart';

class WidgetHeaders extends StatefulWidget {
  const WidgetHeaders({super.key});

  @override
  State<WidgetHeaders> createState() => _WidgetHeadersState();
}

class _WidgetHeadersState extends State<WidgetHeaders> {
  final pageCtrl =
      PageController(initialPage: 0, viewportFraction: 0.8, keepPage: true);
  Timer? _timer;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageCtrl;
    _timer = Timer.periodic(Duration(seconds: 3), (timer) {
      setState(() {
        select = !select;
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    pageCtrl.dispose();
    _timer?.cancel();
  }

  PageController controller = PageController();

  bool select = true;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(
            height: 160,
            width: size.width,
            child: PageView(
              controller: controller,
              children: [
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: 150,
                    width: size.width,
                    decoration: BoxDecoration(
                      color: blue,
                      image: DecorationImage(
                          image: AssetImage("images/kab.jpeg"),
                          fit: BoxFit.cover),
                    ),
                    child: AnimatedContainer(
                      duration: Duration(seconds: 1),
                      color: select
                          ? Colors.transparent
                          : Colors.black.withOpacity(0.4),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            select
                                ? AnimatedDefaultTextStyle(
                                    style: MyFont.inter(
                                        fontSize: 18, color: white),
                                    duration: Duration(seconds: 2),
                                    child: Text(""))
                                : Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: AnimatedDefaultTextStyle(
                                        curve: Curves.slowMiddle,
                                        style: MyFont.poppins(
                                            fontSize: 18,
                                            color: white,
                                            fontWeight: FontWeight.bold),
                                        duration: Duration(seconds: 2),
                                        child: Text(
                                          "Profil Kelurahan",
                                          style: MyFont.poppins(
                                              fontSize: 18,
                                              color: white,
                                              fontWeight: FontWeight.bold),
                                        )),
                                  )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 150,
                  width: size.width,
                  color: Colors.deepPurple,
                ),
              ],
            )),
        // Padding(
        //   padding: const EdgeInsets.only(top: 8.0, right: 8.0),
        //   child: Row(
        //     children: [
        //       Spacer(),
        //       SmoothPageIndicator(
        //         controller: controller,
        //         count: 2,
        //         effect: SlideEffect(
        //             dotWidth: 7, dotHeight: 7, activeDotColor: blue),
        //       )
        //     ],
        //   ),
        // )
      ],
    );
  }
}
