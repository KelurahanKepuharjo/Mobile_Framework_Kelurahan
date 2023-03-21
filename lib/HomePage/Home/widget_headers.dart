import 'package:flutter/material.dart';
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
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageCtrl;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    pageCtrl.dispose();
  }

  PageController controller = PageController();

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
                Container(
                  height: 150,
                  width: size.width,
                  color: Colors.red,
                ),
                Container(
                  height: 150,
                  width: size.width,
                  color: Colors.deepPurple,
                ),
              ],
            )),
        Padding(
          padding: const EdgeInsets.only(top: 8.0, right: 8.0),
          child: Row(
            children: [
              Spacer(),
              SmoothPageIndicator(
                controller: controller,
                count: 2,
                effect: SlideEffect(
                    dotWidth: 7, dotHeight: 7, activeDotColor: blue),
              )
            ],
          ),
        )
      ],
    );
  }
}
