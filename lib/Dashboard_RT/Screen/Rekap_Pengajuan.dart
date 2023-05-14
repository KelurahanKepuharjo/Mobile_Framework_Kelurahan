import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kepuharjo_framework/Auth/Auth_services.dart';
import 'package:kepuharjo_framework/Comm/MyTextField.dart';
import 'package:kepuharjo_framework/Model/pengajuan_model.dart';
import 'package:kepuharjo_framework/Dashboard_RT/custom_navigation_drawer.dart';
import 'package:kepuharjo_framework/Services/api_services.dart';

class RekapPengajuan extends StatefulWidget {
  const RekapPengajuan({super.key});

  @override
  State<RekapPengajuan> createState() => _RekapPengajuanState();
}

class _RekapPengajuanState extends State<RekapPengajuan> {
  List<Pengajuan> pengajuan = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getRekapPengajuan();
  }

  Future<void> getRekapPengajuan() async {
    final api = ApiServices();
    final surat = await api.getRekap();
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
                                "Rekap Pengajuan",
                                style: MyFont.poppins(
                                    fontSize: 14,
                                    color: black,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Menampilkan hasil data semua surat",
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
                                    "Keterangan",
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
                                DataColumn(
                                  label: Text(
                                    "Proses",
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
                                    e.keterangan.toString(),
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
                                        color:
                                            (e.status.toString() == "Diajukan")
                                                ? Colors.amberAccent
                                                : (e.status.toString() ==
                                                        "Disetujui"
                                                    ? Colors.green
                                                    : (e.status.toString() ==
                                                            "Ditolak")
                                                        ? Colors.red
                                                        : Colors.grey)),
                                    child: Center(
                                      child: Text(
                                        e.status.toString(),
                                        textAlign: TextAlign.center,
                                        style: MyFont.poppins(
                                            fontSize: 11, color: white),
                                      ),
                                    ),
                                  )),
                                  DataCell(SizedBox(
                                    height: 35,
                                    width: 100,
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: blue,
                                            shadowColor: Colors.transparent,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            )),
                                        onPressed: () {
                                          int index = pengajuan.indexOf(e);
                                          showDialog(
                                            context: context,
                                            builder: (context) {
                                              return AlertDialog(
                                                content: SingleChildScrollView(
                                                  child: Expanded(
                                                    child: Column(
                                                      children: [
                                                        GetTextFieldUser(
                                                          controller:
                                                              TextEditingController(
                                                                  text: pengajuan[
                                                                          index]
                                                                      .nik
                                                                      .toString()),
                                                          label: "NIK",
                                                          isEnable: false,
                                                          keyboardType:
                                                              TextInputType
                                                                  .number,
                                                          inputFormatters:
                                                              FilteringTextInputFormatter
                                                                  .digitsOnly,
                                                          length: 16,
                                                          icon:
                                                              Icons.credit_card,
                                                        ),
                                                        GetTextFieldUser(
                                                          controller:
                                                              TextEditingController(
                                                                  text: pengajuan[
                                                                          index]
                                                                      .namaLengkap
                                                                      .toString()),
                                                          label: "Nama Lengkap",
                                                          isEnable: false,
                                                          keyboardType:
                                                              TextInputType
                                                                  .name,
                                                          inputFormatters:
                                                              FilteringTextInputFormatter
                                                                  .digitsOnly,
                                                          length: 16,
                                                          icon: Icons.person,
                                                        ),
                                                        GetTextFieldUser(
                                                          controller:
                                                              TextEditingController(
                                                                  text:
                                                                      "${pengajuan[index].tempatLahir}, ${pengajuan[index].tglLahir}"),
                                                          label:
                                                              "Tempat, Tanggal Lahir",
                                                          isEnable: false,
                                                          keyboardType:
                                                              TextInputType
                                                                  .name,
                                                          inputFormatters:
                                                              FilteringTextInputFormatter
                                                                  .digitsOnly,
                                                          length: 16,
                                                          icon: Icons.person,
                                                        ),
                                                        GetTextFieldUser(
                                                          controller: TextEditingController(
                                                              text: pengajuan[
                                                                      index]
                                                                  .jenisKelamin
                                                                  .toString()),
                                                          label:
                                                              "Jenis Kelamin",
                                                          isEnable: false,
                                                          keyboardType:
                                                              TextInputType
                                                                  .name,
                                                          inputFormatters:
                                                              FilteringTextInputFormatter
                                                                  .digitsOnly,
                                                          length: 16,
                                                          icon: Icons.person,
                                                        ),
                                                        GetTextFieldUser(
                                                          controller:
                                                              TextEditingController(
                                                                  text: pengajuan[
                                                                          index]
                                                                      .agama
                                                                      .toString()),
                                                          label: "Agama",
                                                          isEnable: false,
                                                          keyboardType:
                                                              TextInputType
                                                                  .name,
                                                          inputFormatters:
                                                              FilteringTextInputFormatter
                                                                  .digitsOnly,
                                                          length: 16,
                                                          icon: Icons.person,
                                                        ),
                                                        GetTextFieldUser(
                                                          controller:
                                                              TextEditingController(
                                                                  text: pengajuan[
                                                                          index]
                                                                      .pendidikan
                                                                      .toString()),
                                                          label: "Pendidikan",
                                                          isEnable: false,
                                                          keyboardType:
                                                              TextInputType
                                                                  .name,
                                                          inputFormatters:
                                                              FilteringTextInputFormatter
                                                                  .digitsOnly,
                                                          length: 16,
                                                          icon: Icons.person,
                                                        ),
                                                        GetTextFieldUser(
                                                          controller:
                                                              TextEditingController(
                                                                  text: pengajuan[
                                                                          index]
                                                                      .pekerjaan
                                                                      .toString()),
                                                          label: "Pekerjaan",
                                                          isEnable: false,
                                                          keyboardType:
                                                              TextInputType
                                                                  .name,
                                                          inputFormatters:
                                                              FilteringTextInputFormatter
                                                                  .digitsOnly,
                                                          length: 16,
                                                          icon: Icons.person,
                                                        ),
                                                        GetTextFieldUser(
                                                          controller: TextEditingController(
                                                              text: pengajuan[
                                                                      index]
                                                                  .golonganDarah
                                                                  .toString()),
                                                          label:
                                                              "Golongan Darah",
                                                          isEnable: false,
                                                          keyboardType:
                                                              TextInputType
                                                                  .name,
                                                          inputFormatters:
                                                              FilteringTextInputFormatter
                                                                  .digitsOnly,
                                                          length: 16,
                                                          icon: Icons.person,
                                                        ),
                                                        GetTextFieldUser(
                                                          controller: TextEditingController(
                                                              text: pengajuan[
                                                                      index]
                                                                  .statusPerkawinan
                                                                  .toString()),
                                                          label:
                                                              "Status Perkawinan",
                                                          isEnable: false,
                                                          keyboardType:
                                                              TextInputType
                                                                  .name,
                                                          inputFormatters:
                                                              FilteringTextInputFormatter
                                                                  .digitsOnly,
                                                          length: 16,
                                                          icon: Icons.person,
                                                        ),
                                                        const SizedBox(
                                                          height: 20,
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            SizedBox(
                                                              height: 40,
                                                              width: 80,
                                                              child: ElevatedButton(
                                                                  style: ElevatedButton.styleFrom(
                                                                      backgroundColor: Colors.green,
                                                                      shadowColor: Colors.transparent,
                                                                      shape: RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(10),
                                                                      )),
                                                                  onPressed: () {},
                                                                  child: Text(
                                                                    "Setujui",
                                                                    style: MyFont.poppins(
                                                                        fontSize:
                                                                            12,
                                                                        color:
                                                                            white),
                                                                  )),
                                                            ),
                                                            SizedBox(
                                                              height: 40,
                                                              width: 80,
                                                              child: ElevatedButton(
                                                                  style: ElevatedButton.styleFrom(
                                                                      backgroundColor: Colors.red,
                                                                      shadowColor: Colors.transparent,
                                                                      shape: RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(10),
                                                                      )),
                                                                  onPressed: () {},
                                                                  child: Text(
                                                                    "Tolak",
                                                                    style: MyFont.poppins(
                                                                        fontSize:
                                                                            12,
                                                                        color:
                                                                            white),
                                                                  )),
                                                            )
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        },
                                        child: Text(
                                          'Preview Data',
                                          style: MyFont.poppins(
                                              fontSize: 11, color: white),
                                        )),
                                  ))
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
