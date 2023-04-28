import 'package:flutter/material.dart';
import 'package:kepuharjo_framework/Rt_Rw/custom_navigation_drawer.dart';

class WidgetCard extends StatefulWidget {
  const WidgetCard({super.key});

  @override
  State<WidgetCard> createState() => _WidgetCardState();
}

class _WidgetCardState extends State<WidgetCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 250,
        decoration:
            BoxDecoration(color: blue, borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Spacer(),
              Container(
                padding: EdgeInsets.all(5),
                height: 100,
                decoration: BoxDecoration(
                    color: white, borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: 80,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "25",
                            style: MyFont.poppins(
                                fontSize: 20,
                                color: black,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Surat Masuk",
                            style: MyFont.poppins(
                                fontSize: 12,
                                color: black,
                                fontWeight: FontWeight.normal),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      width: 1,
                      height: MediaQuery.of(context).size.height,
                      color: black.withOpacity(0.2),
                    ),
                    SizedBox(
                      height: 80,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "15",
                            style: MyFont.poppins(
                                fontSize: 20,
                                color: black,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Surat Selesai",
                            style: MyFont.poppins(
                                fontSize: 12,
                                color: black,
                                fontWeight: FontWeight.normal),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      width: 1,
                      height: MediaQuery.of(context).size.height,
                      color: black.withOpacity(0.2),
                    ),
                    SizedBox(
                      height: 80,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "20",
                            style: MyFont.poppins(
                                fontSize: 20,
                                color: black,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Surat Ditolak",
                            style: MyFont.poppins(
                                fontSize: 12,
                                color: black,
                                fontWeight: FontWeight.normal),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
