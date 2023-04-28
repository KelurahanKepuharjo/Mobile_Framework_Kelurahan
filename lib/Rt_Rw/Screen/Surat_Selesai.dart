import 'package:flutter/material.dart';

class SuratSelesai extends StatefulWidget {
  const SuratSelesai({super.key});

  @override
  State<SuratSelesai> createState() => _SuratSelesaiState();
}

class _SuratSelesaiState extends State<SuratSelesai> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Text("Surat Selesai"),
        ),
      ),
    );
  }
}
