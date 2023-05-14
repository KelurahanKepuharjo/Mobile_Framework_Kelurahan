import 'package:flutter/material.dart';
import 'package:kepuharjo_framework/Dashboard_RT/custom_navigation_drawer.dart';
import 'package:kepuharjo_framework/Services/api_connect.dart';
import 'package:kepuharjo_framework/Services/api_services.dart';

import '../../../Model/status_surat.dart';

class SuratDitolakUser extends StatefulWidget {
  const SuratDitolakUser({super.key});

  @override
  State<SuratDitolakUser> createState() => _SuratDitolakUserState();
}

class _SuratDitolakUserState extends State<SuratDitolakUser> {
  ApiServices apiServices = ApiServices();
  late Future<List<Status>> listdata;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listdata = apiServices.getStatusDitolak();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Status>>(
      future: listdata,
      builder: (context, snapshot) {
        if (snapshot.hasData &&
            snapshot.connectionState == ConnectionState.done) {
          List<Status>? data = snapshot.data;
          return Expanded(
            child: RefreshIndicator(
              color: lavender,
              onRefresh: () async {
                listdata = apiServices.getStatusDitolak();
              },
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: data!.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: 115,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: white,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "S-Kepuharjo",
                                    style: MyFont.poppins(
                                        fontSize: 10,
                                        color: black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    data[index].createdAt.toString(),
                                    style: MyFont.poppins(
                                        fontSize: 10, color: softgrey),
                                  ),
                                ],
                              ),
                              Container(
                                height: 30,
                                width: 100,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.red),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      data[index].status.toString(),
                                      style: MyFont.poppins(
                                          fontSize: 10,
                                          color: black,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Divider(),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(left: 8),
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: blue.withOpacity(0.1)),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.network(
                                          Api.connectimage +
                                              data[index].image.toString(),
                                          height: 25,
                                          width: 25,
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: SizedBox(
                                      height: 40,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            data[index].nik.toString(),
                                            style: MyFont.poppins(
                                                fontSize: 12,
                                                color: black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            data[index].namaLengkap.toString(),
                                            style: MyFont.poppins(
                                              fontSize: 12,
                                              color: black,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
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
