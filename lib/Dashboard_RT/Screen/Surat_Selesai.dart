import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kepuharjo_framework/Comm/MyTextField.dart';
import 'package:kepuharjo_framework/Model/pengajuan_model.dart';
import 'package:kepuharjo_framework/Dashboard_RT/custom_navigation_drawer.dart';
import 'package:kepuharjo_framework/Services/api_services.dart';

class SuratSelesai extends StatefulWidget {
  const SuratSelesai({super.key});

  @override
  State<SuratSelesai> createState() => _SuratSelesaiState();
}

class _SuratSelesaiState extends State<SuratSelesai> {
  List<Pengajuan> pengajuan = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getsuratSelesai();
  }

  Future<void> getsuratSelesai() async {
    final api = ApiServices();
    final surat = await api.getPengajuan("Disetujui RT");
    setState(() {
      pengajuan = surat;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.all(10),
            child: Card(
              elevation: 3, // tinggi bayangan
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Surat Disetujui",
                                style: MyFont.poppins(
                                    fontSize: 14,
                                    color: black,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Menampilkan data surat yang telah selesai disetujui",
                                style: MyFont.poppins(
                                    fontSize: 12,
                                    color: softgrey,
                                    fontWeight: FontWeight.normal),
                              ),
                            ],
                          ),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: DataTable(
                              columns: [
                                DataColumn(
                                  label: Text(
                                    "No.",
                                    style: MyFont.poppins(
                                        fontSize: 12, color: black),
                                  ),
                                ),
                                DataColumn(
                                  label: Text(
                                    "Nama",
                                    style: MyFont.poppins(
                                        fontSize: 12, color: black),
                                  ),
                                ),
                                DataColumn(
                                  label: Text(
                                    "Jenis",
                                    style: MyFont.poppins(
                                        fontSize: 12, color: black),
                                  ),
                                ),
                                DataColumn(
                                  label: Text(
                                    "Status",
                                    style: MyFont.poppins(
                                        fontSize: 12, color: black),
                                  ),
                                ),
                              ],
                              rows: pengajuan.map((e) {
                                return DataRow(cells: [
                                  DataCell(Text(
                                    ('${pengajuan.indexOf(e) + 1}').toString(),
                                    style: MyFont.poppins(
                                        fontSize: 11, color: black),
                                  )),
                                  DataCell(Text(
                                    e.namaLengkap.toString(),
                                    style: MyFont.poppins(
                                        fontSize: 11, color: black),
                                  )),
                                  DataCell(Text(
                                    e.surat!.namaSurat.toString(),
                                    style: MyFont.poppins(
                                        fontSize: 11, color: black),
                                  )),
                                  DataCell(Container(
                                    height: 20,
                                    width: 80,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.green),
                                    child: Center(
                                      child: Text(
                                        e.status.toString(),
                                        textAlign: TextAlign.center,
                                        style: MyFont.poppins(
                                            fontSize: 11, color: white),
                                      ),
                                    ),
                                  )),
                                ]);
                              }).toList()),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      )),
    );
  }
}
