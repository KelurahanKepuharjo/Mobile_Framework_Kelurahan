import 'package:flutter/material.dart';
import 'package:kepuharjo_framework/Shared/Mycolor.dart';
import 'package:kepuharjo_framework/Shared/Myfont.dart';
import 'package:provider/provider.dart';

class WidgetPelayanan extends StatefulWidget {
  const WidgetPelayanan({super.key});

  @override
  State<WidgetPelayanan> createState() => _WidgetPelayananState();
}

class _WidgetPelayananState extends State<WidgetPelayanan> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 15, 0, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Layanan Pengajuan Surat Keterangan",
                    style: MyFont.poppins(
                        fontSize: 13,
                        color: black,
                        fontWeight: FontWeight.w500)),
                Text("Berbagai layanan pengajuan surat keterangan",
                    style: MyFont.poppins(
                        fontSize: 12,
                        color: softgrey,
                        fontWeight: FontWeight.w500)),
              ],
            ),
          ),
          SizedBox(
              height: 165,
              child: GridView.count(
                crossAxisCount: 4,
                crossAxisSpacing: 5,
                children: [
                  getMenu("Tidak Mampu", Icons.assignment, 0),
                  getMenu("Usaha", Icons.home_work, 1),
                  getMenu("Kematian", Icons.add_box_outlined, 2),
                  getMenu("Domisili", Icons.location_on, 3),
                  getMenu("Belum Nikah", Icons.diamond, 4),
                  getMenu("Kenal Lahir", Icons.child_friendly, 5),
                  getMenu("Berkelakuan Baik", Icons.people_alt, 6),
                  getMenu("Lainnya", Icons.grid_view_rounded, 7)
                ],
              )),
        ],
      ),
    );
  }

  GestureDetector getMenu(String text, IconData icon, int i) {
    return GestureDetector(
      onTap: () {
        if (i == 0) {
          // if (orderStatus.currentApplicationType == 'SKTM' &&
          //     orderStatus.isOrderInProgress == true) {
          //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          //       elevation: 0,
          //       backgroundColor: Colors.transparent,
          //       behavior: SnackBarBehavior.floating,
          //       content: AwesomeSnackbarContent(
          //           title: "Gagal",
          //           message:
          //               'Anda tidak dapat melakukan pengajuan surat,Jika pengajuan sebelumnya masih belum selesai',
          //           contentType: ContentType.failure)));
          // } else {
          //   Navigator.push(
          //       context,
          //       MaterialPageRoute(
          //           builder: (context) => const PengajuanSktm()));
          // }
        }
        if (i == 1) {
          // if (orderStatus.currentApplicationType == 'Usaha' &&
          //     orderStatus.isOrderInProgress == true) {
          //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          //       elevation: 0,
          //       backgroundColor: Colors.transparent,
          //       behavior: SnackBarBehavior.floating,
          //       content: AwesomeSnackbarContent(
          //           title: "Gagal",
          //           message:
          //               'Anda tidak dapat melakukan pengajuan surat,Jika pengajuan sebelumnya masih belum selesai',
          //           contentType: ContentType.failure)));
          // } else {
          //   Navigator.push(
          //       context,
          //       MaterialPageRoute(
          //           builder: (context) => const PengajuanUsaha()));
          // }
        }
        if (i == 2) {
          // if (orderStatus.currentApplicationType == 'Kematian' &&
          //     orderStatus.isOrderInProgress == true) {
          //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          //       elevation: 0,
          //       backgroundColor: Colors.transparent,
          //       behavior: SnackBarBehavior.floating,
          //       content: AwesomeSnackbarContent(
          //           title: "Gagal",
          //           message:
          //               'Anda tidak dapat melakukan pengajuan surat,Jika pengajuan sebelumnya masih belum selesai',
          //           contentType: ContentType.failure)));
          // } else {
          //   Navigator.push(context,
          //       MaterialPageRoute(builder: (context) => const Kematian()));
          // }
        }
        if (i == 3) {
          // if (orderStatus.currentApplicationType == 'Domisili' &&
          //     orderStatus.isOrderInProgress == true) {
          //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          //       elevation: 0,
          //       backgroundColor: Colors.transparent,
          //       behavior: SnackBarBehavior.floating,
          //       content: AwesomeSnackbarContent(
          //           title: "Gagal",
          //           message:
          //               'Anda tidak dapat melakukan pengajuan surat,Jika pengajuan sebelumnya masih belum selesai',
          //           contentType: ContentType.failure)));
          // } else {
          //   Navigator.push(
          //       context,
          //       MaterialPageRoute(
          //           builder: (context) => const PengajuanDomisili()));
          // }
        }
        if (i == 4) {
          // if (orderStatus.currentApplicationType == 'BelumNikah' &&
          //     orderStatus.isOrderInProgress == true) {
          //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          //       elevation: 0,
          //       backgroundColor: Colors.transparent,
          //       behavior: SnackBarBehavior.floating,
          //       content: AwesomeSnackbarContent(
          //           title: "Gagal",
          //           message:
          //               'Anda tidak dapat melakukan pengajuan surat,Jika pengajuan sebelumnya masih belum selesai',
          //           contentType: ContentType.failure)));
          // } else {
          //   Navigator.push(
          //       context,
          //       MaterialPageRoute(
          //           builder: (context) => const PengajuanBelumNikah()));
          // }
        }
        if (i == 5) {
          // if (orderStatus.currentApplicationType == 'Akta' &&
          //     orderStatus.isOrderInProgress == true) {
          //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          //       elevation: 0,
          //       backgroundColor: Colors.transparent,
          //       behavior: SnackBarBehavior.floating,
          //       content: AwesomeSnackbarContent(
          //           title: "Gagal",
          //           message:
          //               'Anda tidak dapat melakukan pengajuan surat,Jika pengajuan sebelumnya masih belum selesai',
          //           contentType: ContentType.failure)));
          // } else {
          //   Navigator.push(
          //       context,
          //       MaterialPageRoute(
          //           builder: (context) => const PengajuanAkta()));
          // }
        }
        if (i == 6) {
          // if (orderStatus.currentApplicationType == 'Baik' &&
          //     orderStatus.isOrderInProgress == true) {
          //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          //       elevation: 0,
          //       backgroundColor: Colors.transparent,
          //       behavior: SnackBarBehavior.floating,
          //       content: AwesomeSnackbarContent(
          //           title: "Gagal",
          //           message:
          //               'Anda tidak dapat melakukan pengajuan surat,Jika pengajuan sebelumnya masih belum selesai',
          //           contentType: ContentType.failure)));
          // } else {
          //   // Navigator.push(
          //   //     context,
          //   //     MaterialPageRoute(
          //   //         builder: (context) =>
          //   //             const PengajuanBerkelakuanBaik()));
          // }
        }
        if (i == 7) {
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //         builder: (context) => const AppearancePengajuan()));
        }
      },
      child: Column(
        children: [
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.white),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    icon,
                    color: blue,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Align(
            alignment: Alignment.center,
            child: Text(text,
                textAlign: TextAlign.center,
                style: MyFont.poppins(fontSize: 11, color: black)),
          )
        ],
      ),
    );
  }
}
