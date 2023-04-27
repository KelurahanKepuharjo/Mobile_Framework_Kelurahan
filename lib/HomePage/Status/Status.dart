import 'package:flutter/material.dart';
import 'package:kepuharjo_framework/Auth/Auth_services.dart';
import 'package:kepuharjo_framework/Rt_Rw/custom_navigation_drawer.dart';

class Status extends StatefulWidget {
  const Status({super.key});

  @override
  State<Status> createState() => _StatusState();
}

class _StatusState extends State<Status> {
  final authServices = AuthServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
            foregroundDecoration: BoxDecoration(
              color: black,
              backgroundBlendMode: BlendMode.saturation,
            ),
            child: ElevatedButton(
                onPressed: () {
                  authServices.logout(context);
                },
                child: Text("Logout"))),
      ),
    );
  }
}
