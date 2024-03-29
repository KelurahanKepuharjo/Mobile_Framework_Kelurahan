import 'package:flutter/material.dart';
import 'package:kepuharjo_framework/Auth/Auth_services.dart';
import 'package:kepuharjo_framework/HomePage/Pengajuan/pengajuan_surat.dart';
import 'package:kepuharjo_framework/Model/keluarga.dart';
import 'package:kepuharjo_framework/Model/surat_model.dart';
import 'package:kepuharjo_framework/Dashboard_RT/custom_navigation_drawer.dart';

class DaftarKeluarga extends StatefulWidget {
  final MasterSurat selectedSurat;
  const DaftarKeluarga({required this.selectedSurat, Key? key})
      : super(key: key);

  @override
  State<DaftarKeluarga> createState() => _DaftarKeluargaState();
}

class _DaftarKeluargaState extends State<DaftarKeluarga> {
  AuthServices authServices = AuthServices();
  late Future<List<Keluarga>> listdata;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listdata = authServices.getMasyarakat();
  }

  @override
  Widget build(BuildContext context) {
    String idSurat = widget.selectedSurat.idSurat.toString();
    String namaSurat = widget.selectedSurat.namaSurat.toString();
    return Scaffold(
      appBar: AppBar(
          backgroundColor: lavender,
          shadowColor: Colors.transparent,
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: Text(
            "Daftar Keluarga",
            style: MyFont.poppins(
                fontSize: 16, color: white, fontWeight: FontWeight.bold),
          ),
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Icon(
                Icons.keyboard_arrow_left_rounded,
                color: white,
              ),
            ),
          )),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 500,
              child: FutureBuilder<List<Keluarga>>(
                future: listdata,
                builder: (context, snapshot) {
                  if (snapshot.hasData &&
                      snapshot.connectionState == ConnectionState.done) {
                    List<Keluarga>? data = snapshot.data;
                    return SizedBox(
                      child: ListView.builder(
                        itemCount: data!.length,
                        itemBuilder: (context, index) {
                          return SizedBox(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                ListTile(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => Pengajuansurat(
                                            idsurat: idSurat,
                                            namaSurat: namaSurat,
                                            keluarga: data[index],
                                            masyarakat:
                                                data[index].masyarakat![index],
                                          ),
                                        ));
                                  },
                                  leading: Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: blue.withOpacity(0.1)),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.people_alt_rounded,
                                          color: lavender,
                                        )
                                      ],
                                    ),
                                  ),
                                  title: Text(
                                    data[index]
                                        .masyarakat![index]
                                        .nik
                                        .toString(),
                                    style: MyFont.poppins(
                                        fontSize: 13,
                                        color: black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  subtitle: Text(
                                    data[index]
                                        .masyarakat![index]
                                        .namaLengkap
                                        .toString(),
                                    style: MyFont.poppins(
                                        fontSize: 12, color: black),
                                  ),
                                  trailing: Icon(
                                    Icons.keyboard_arrow_right_rounded,
                                    color: lavender,
                                  ),
                                ),
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
              ),
            )
          ],
        ),
      ),
    );
  }
}
