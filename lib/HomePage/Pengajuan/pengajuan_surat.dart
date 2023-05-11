import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kepuharjo_framework/Auth/Auth_services.dart';
import 'package:kepuharjo_framework/Comm/MyTextField.dart';
import 'package:kepuharjo_framework/Model/keluarga.dart';
import 'package:kepuharjo_framework/Model/pengajuan_model.dart';
import 'package:kepuharjo_framework/Model/surat_model.dart';
import 'package:kepuharjo_framework/Rt_Rw/custom_navigation_drawer.dart';
import 'package:kepuharjo_framework/Services/api_services.dart';

class Pengajuansurat extends StatefulWidget {
  String idsurat;
  String namaSurat;
  Keluarga keluarga;
  Masyarakat masyarakat;
  Pengajuansurat(
      {Key? key,
      required this.idsurat,
      required this.namaSurat,
      required this.keluarga,
      required this.masyarakat})
      : super(key: key);

  @override
  State<Pengajuansurat> createState() => _PengajuansuratState();
}

class _PengajuansuratState extends State<Pengajuansurat> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nik.text = widget.masyarakat.nik.toString();
    nokk.text = widget.keluarga.noKk.toString();
    nama.text = widget.masyarakat.namaLengkap.toString();

  }

  final nik = TextEditingController();
  final nama = TextEditingController();
  final nokk = TextEditingController();
  final alamat = TextEditingController();
  final rt = TextEditingController();
  final rw = TextEditingController();
  final ttl = TextEditingController();
  final jk = TextEditingController();
  final pendidikan = TextEditingController();
  final agama = TextEditingController();
  final keperluan = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
          backgroundColor: blue,
          shadowColor: Colors.transparent,
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: Text(
            "Pengajuan Surat",
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
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 8, 8, 0),
              child: Text(
                "Pengajuan Surat Keterangan ${widget.namaSurat}",
                style: MyFont.poppins(
                    fontSize: 13, color: black, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, bottom: 20),
              child: Text(
                "Silahkan pastikan bahwa semua data anda sudah terisi semua",
                style: MyFont.poppins(
                    fontSize: 11, color: black, fontWeight: FontWeight.normal),
              ),
            ),
            GetTextFieldUser(
                controller: nokk,
                label: "No. Kartu Keluarga",
                isEnable: false,
                keyboardType: TextInputType.name,
                inputFormatters:
                    FilteringTextInputFormatter.singleLineFormatter,
                length: 20,
                icon: Icons.person),
            GetTextFieldUser(
                controller: nik,
                label: "NIK",
                isEnable: false,
                keyboardType: TextInputType.name,
                inputFormatters:
                    FilteringTextInputFormatter.singleLineFormatter,
                length: 16,
                icon: Icons.person),
            GetTextFieldUser(
                controller: nama,
                label: "Nama Lengkap",
                isEnable: false,
                keyboardType: TextInputType.name,
                inputFormatters:
                    FilteringTextInputFormatter.singleLineFormatter,
                length: 100,
                icon: Icons.person),
            GetTextFieldUser(
                controller: keperluan,
                label: "Keperluan",
                isEnable: false,
                keyboardType: TextInputType.name,
                inputFormatters:
                    FilteringTextInputFormatter.singleLineFormatter,
                length: 16,
                icon: Icons.person),
          
          ],
        ),
      ),
    );
  }
}
