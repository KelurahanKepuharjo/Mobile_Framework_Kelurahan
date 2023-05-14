import 'package:flutter/material.dart';
import 'package:kepuharjo_framework/HomePage/Pengajuan/daftar_keluarga.dart';
import 'package:kepuharjo_framework/Model/surat_model.dart';
import 'package:kepuharjo_framework/Dashboard_RT/custom_navigation_drawer.dart';
import 'package:kepuharjo_framework/Services/api_connect.dart';
import 'package:kepuharjo_framework/Services/api_services.dart';

class Pengajuan extends StatefulWidget {
  const Pengajuan({super.key});

  @override
  State<Pengajuan> createState() => _PengajuanState();
}

class _PengajuanState extends State<Pengajuan> {
  ApiServices apiServices = ApiServices();
  late Future<List<MasterSurat>> listdata;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listdata = apiServices.getSurat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: lavender,
          shadowColor: Colors.transparent,
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: Text(
            "Jenis Surat",
            style: MyFont.poppins(
                fontSize: 16, color: white, fontWeight: FontWeight.bold),
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          child: Column(
            children: [
              RefreshIndicator(
                color: lavender,
                onRefresh: () async {
                  listdata = apiServices.getSurat();
                },
                child: FutureBuilder<List<MasterSurat>>(
                  future: listdata,
                  builder: (context, snapshot) {
                    if (snapshot.hasData &&
                        snapshot.connectionState == ConnectionState.done) {
                      List<MasterSurat>? data = snapshot.data;
                      return SizedBox(
                          child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: data!.length,
                        itemBuilder: (context, index) {
                          return SizedBox(
                            height: 80,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ListTile(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => DaftarKeluarga(
                                              selectedSurat: data[index]),
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
                                        Image.network(
                                          Api.connectimage +
                                              data[index].image.toString(),
                                          height: 25,
                                          width: 25,
                                        ),
                                      ],
                                    ),
                                  ),
                                  title: Text(
                                    "Surat Keterangan",
                                    style: MyFont.poppins(
                                        fontSize: 13,
                                        color: black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  subtitle: Text(
                                    data[index].namaSurat.toString(),
                                    style: MyFont.poppins(
                                        fontSize: 12, color: black),
                                  ),
                                  trailing: Icon(
                                    Icons.keyboard_arrow_right_rounded,
                                    color: blue,
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      ));
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
        ));
  }
}
