import 'package:flutter/material.dart';

class RekapPengajuan extends StatefulWidget {
  const RekapPengajuan({super.key});

  @override
  State<RekapPengajuan> createState() => _RekapPengajuanState();
}

class _RekapPengajuanState extends State<RekapPengajuan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Text("Surat Rekap"),
        ),
      ),
    );
  }
}
