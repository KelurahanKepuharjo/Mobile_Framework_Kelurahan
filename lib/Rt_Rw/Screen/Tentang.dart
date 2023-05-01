import 'package:flutter/material.dart';
import 'package:kepuharjo_framework/Rt_Rw/custom_navigation_drawer.dart';

class Tentang extends StatefulWidget {
  const Tentang({super.key});

  @override
  State<Tentang> createState() => _TentangState();
}

class _TentangState extends State<Tentang> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Tentang",
              style: MyFont.montserrat(
                  fontSize: 16, color: black, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),
            Text(
              "Sistem Informasi Pengajuan Surat",
              style: MyFont.montserrat(
                  fontSize: 14, color: blue, fontWeight: FontWeight.normal),
            ),
            const SizedBox(height: 30),
            Image.network(
                "https://suket-kel.wstif3a.id/images/icon-laman-tentang.png"),
            const SizedBox(height: 30),
            Text(
              "      S-kepuharjo merupakan aplikasi berbasis website dan mobile kepuharjo ini dapat digunakan oleh pihak masyarakat, RT, dan RW serta website khusus untuk pihak Admin Kelurahan yang digunakan untuk menampung surat sekaligus digunakan untuk data master dari masyarakat, dan diharapkan juga aplikasi pengajuan surat untuk masyarakat ini dapat dilakukan dimanapun dan kapanpun sehingga menjadi lebih efektif dan efisien.",
              style: MyFont.poppins(
                  fontSize: 12, color: black, fontWeight: FontWeight.normal),
            ),
            const SizedBox(height: 15),
            Text(
              "     S-Kepuharjo termasuk upaya meningkatkan transparansi, kontrol serta akuntabilitas kinerja kelurahan dalam proses penanganan surat pengajuan dari masyarakat. Memperbaiki kualitas pelayanan publik untuk pengajuan surat pada tahap RT/RW, terutama dalam hal efektivitas dan efisiensi yang bisa memakan waktu berhari hari karena situasi pandemi. Mempermudah masyarakat dalam melakukan pengajuan berbagai macam jenis surat kepada pihak kelurahan",
              style: MyFont.poppins(
                  fontSize: 12, color: black, fontWeight: FontWeight.normal),
            ),
            const SizedBox(height: 50),
            Center(
              child: Text(
                "Copyright © S-Kepuharjo 2023",
                style: MyFont.poppins(fontSize: 12, color: softgrey),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      )),
    );
  }
}
