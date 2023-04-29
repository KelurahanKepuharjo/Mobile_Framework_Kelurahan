import 'package:flutter/material.dart';

class SuratDitolak extends StatefulWidget {
  const SuratDitolak({super.key});

  @override
  State<SuratDitolak> createState() => _SuratDitolakState();
}

class _SuratDitolakState extends State<SuratDitolak> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Text("Surat Ditolak"),
        ),
      ),
    );
  }
}
