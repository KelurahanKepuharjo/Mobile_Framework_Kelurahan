import 'package:flutter/material.dart';
import 'package:kepuharjo_framework/Rt_Rw/custom_navigation_drawer.dart';
import 'package:kepuharjo_framework/Services/api_services.dart';
import 'package:kepuharjo_framework/Shared/Myfont.dart';
import 'package:kepuharjo_framework/model/berita_model.dart';

class WidgetBerita extends StatefulWidget {
  const WidgetBerita({Key? key}) : super(key: key);

  @override
  State<WidgetBerita> createState() => _WidgetBeritaState();
}

class _WidgetBeritaState extends State<WidgetBerita> {
  ApiServices apiServices = ApiServices();
  late Future<List<Berita>> listdata;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listdata = apiServices.getBerita();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Berita>>(
      future: listdata,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Berita>? data = snapshot.data;
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: data!.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  padding: const EdgeInsets.all(5),
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                      color: white, borderRadius: BorderRadius.circular(15)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 120,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("images/kab.jpeg"),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              data[index].judul.toString(),
                              style: MyFont.poppins(
                                  fontSize: 14,
                                  color: black,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              data[index].subTitle.toString(),
                              style: MyFont.poppins(
                                  fontSize: 11,
                                  color: black,
                                  fontWeight: FontWeight.w300),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          );
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return Center(
          child: CircularProgressIndicator(
            color: blue,
          ),
        );
      },
    );
  }
}
