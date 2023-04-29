import 'package:flutter/material.dart';
import 'package:kepuharjo_framework/Model/surat_model.dart';
import 'package:kepuharjo_framework/Rt_Rw/custom_navigation_drawer.dart';
import 'package:kepuharjo_framework/Services/api_services.dart';

class WidgetCard extends StatefulWidget {
  const WidgetCard({super.key});

  @override
  State<WidgetCard> createState() => _WidgetCardState();
}

class _WidgetCardState extends State<WidgetCard> {
  List<MasterSurat> _surat = [];
  @override
  void initState() {
    super.initState();
    _getSurat();
  }

  Future<void> _getSurat() async {
    final api = ApiServices();
    final surat = await api.getSurat();
    setState(() {
      _surat = surat;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          SizedBox(
            height: 100,
            child: Card(
              elevation: 1, // tinggi bayangan
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(5),
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
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            width: MediaQuery.of(context).size.width,
            height: 211,
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Colors.blue.shade900,
                  Colors.blue.shade800,
                  Colors.blue.shade600,
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                borderRadius: BorderRadius.circular(15)),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Container(
                  //   padding: const EdgeInsets.all(5),
                  //   height: 100,
                  //   decoration: BoxDecoration(
                  //       color: white.withOpacity(0.8),
                  //       borderRadius: BorderRadius.circular(10)),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //     children: [
                  //       SizedBox(
                  //         height: 80,
                  //         child: Column(
                  //           mainAxisAlignment: MainAxisAlignment.center,
                  //           crossAxisAlignment: CrossAxisAlignment.center,
                  //           children: [
                  //             Text(
                  //               "25",
                  //               style: MyFont.poppins(
                  //                   fontSize: 20,
                  //                   color: black,
                  //                   fontWeight: FontWeight.bold),
                  //             ),
                  //             Text(
                  //               "Surat Masuk",
                  //               style: MyFont.poppins(
                  //                   fontSize: 12,
                  //                   color: black,
                  //                   fontWeight: FontWeight.normal),
                  //             )
                  //           ],
                  //         ),
                  //       ),
                  //       Container(
                  //         margin: EdgeInsets.symmetric(vertical: 10),
                  //         width: 1,
                  //         height: MediaQuery.of(context).size.height,
                  //         color: black.withOpacity(0.2),
                  //       ),
                  //       SizedBox(
                  //         height: 80,
                  //         child: Column(
                  //           mainAxisAlignment: MainAxisAlignment.center,
                  //           crossAxisAlignment: CrossAxisAlignment.center,
                  //           children: [
                  //             Text(
                  //               "15",
                  //               style: MyFont.poppins(
                  //                   fontSize: 20,
                  //                   color: black,
                  //                   fontWeight: FontWeight.bold),
                  //             ),
                  //             Text(
                  //               "Surat Selesai",
                  //               style: MyFont.poppins(
                  //                   fontSize: 12,
                  //                   color: black,
                  //                   fontWeight: FontWeight.normal),
                  //             )
                  //           ],
                  //         ),
                  //       ),
                  //       Container(
                  //         margin: EdgeInsets.symmetric(vertical: 10),
                  //         width: 1,
                  //         height: MediaQuery.of(context).size.height,
                  //         color: black.withOpacity(0.2),
                  //       ),
                  //       SizedBox(
                  //         height: 80,
                  //         child: Column(
                  //           mainAxisAlignment: MainAxisAlignment.center,
                  //           crossAxisAlignment: CrossAxisAlignment.center,
                  //           children: [
                  //             Text(
                  //               "20",
                  //               style: MyFont.poppins(
                  //                   fontSize: 20,
                  //                   color: black,
                  //                   fontWeight: FontWeight.bold),
                  //             ),
                  //             Text(
                  //               "Surat Ditolak",
                  //               style: MyFont.poppins(
                  //                   fontSize: 12,
                  //                   color: black,
                  //                   fontWeight: FontWeight.normal),
                  //             )
                  //           ],
                  //         ),
                  //       )
                  //     ],
                  //   ),
                  // ),
                  Container(
                    margin: EdgeInsets.only(top: 0),
                    padding: EdgeInsets.all(15),
                    height: 195,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: white.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(10)),
                    child: SingleChildScrollView(
                      child: Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Jenis Pengajuan Surat",
                              style: MyFont.poppins(
                                  fontSize: 14,
                                  color: black,
                                  fontWeight: FontWeight.normal),
                            ),
                            DataTable(
                                columns: [
                                  DataColumn(
                                      label: Text(
                                    "No.",
                                    style: MyFont.poppins(
                                        fontSize: 12, color: black),
                                  )),
                                  DataColumn(
                                      label: Text(
                                    "Nama Surat",
                                    style: MyFont.poppins(
                                        fontSize: 12, color: black),
                                  ))
                                ],
                                rows: _surat.map((e) {
                                  return DataRow(cells: [
                                    DataCell(Text(
                                      e.idSurat.toString(),
                                      style: MyFont.poppins(
                                          fontSize: 11, color: black),
                                    )),
                                    DataCell(Text(
                                      e.namaSurat ?? '',
                                      style: MyFont.poppins(
                                          fontSize: 11, color: black),
                                    )),
                                  ]);
                                }).toList())
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
