import 'package:flutter/material.dart';
import 'package:kepuharjo_framework/Dashboard_RT/custom_navigation_drawer.dart';
import 'package:kepuharjo_framework/Services/api_connect.dart';
import 'package:kepuharjo_framework/Services/api_services.dart';

import '../../../Model/status_surat.dart';

class SuratSelesaiUser extends StatefulWidget {
  const SuratSelesaiUser({super.key});

  @override
  State<SuratSelesaiUser> createState() => _SuratSelesaiUserState();
}

class _SuratSelesaiUserState extends State<SuratSelesaiUser>
    with SingleTickerProviderStateMixin {
  ApiServices apiServices = ApiServices();
  late Future<List<Status>> listdata;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listdata = apiServices.getStatus("Selesai");
  }

  List<bool> _isVisible = [];
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Status>>(
      future: listdata,
      builder: (context, snapshot) {
        if (snapshot.hasData &&
            snapshot.connectionState == ConnectionState.done) {
          List<Status>? data = snapshot.data;
          if (_isVisible.length == 0) {
            for (int i = 0; i < data!.length; i++) {
              _isVisible.add(false);
            }
          }
          return Expanded(
            child: RefreshIndicator(
              color: lavender,
              onRefresh: () async {
                listdata = apiServices.getStatus("Selesai");
              },
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: data!.length,
                itemBuilder: (context, index) {
                  return AnimatedContainer(
                    duration: Duration(milliseconds: 1000),
                    curve: Curves.fastOutSlowIn,
                    height: _isVisible[index] ? 172 : 115,
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
                                width: 90,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.green),
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
                              SizedBox(
                                  height: 40,
                                  width: 40,
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        _isVisible[index] = !_isVisible[index];
                                      });
                                    },
                                    child: Icon(
                                      _isVisible[index]
                                          ? Icons.keyboard_arrow_down_rounded
                                          : Icons.keyboard_arrow_right_rounded,
                                      color: lavender,
                                    ),
                                  )),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        AnimatedSize(
                          duration: const Duration(milliseconds: 1000),
                          curve: Curves.fastOutSlowIn,
                          vsync: this,
                          child: Visibility(
                            visible: _isVisible[index],
                            child: Container(
                              margin: EdgeInsets.all(8),
                              height: _isVisible[index] ? 40 : 0,
                              width: MediaQuery.of(context).size.width,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.red,
                                      shadowColor: Colors.transparent,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                      )),
                                  onPressed: () {
                                    // verifyLogin();
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.picture_as_pdf_rounded,
                                            color: white,
                                          ),
                                          const SizedBox(
                                            width: 7,
                                          ),
                                          Text('Unduh Surat',
                                              style: MyFont.poppins(
                                                  fontSize: 12, color: white)),
                                        ],
                                      ),
                                    ],
                                  )),
                            ),
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
