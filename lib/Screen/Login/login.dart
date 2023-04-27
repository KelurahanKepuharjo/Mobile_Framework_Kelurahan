import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kepuharjo_framework/Comm/MySnackbar.dart';
import 'package:kepuharjo_framework/HomePage/HomePage.dart';
import 'package:kepuharjo_framework/Screen/Register/register.dart';
import 'package:kepuharjo_framework/Shared/Mycolor.dart';
import 'package:kepuharjo_framework/Shared/Myfont.dart';
import 'package:kepuharjo_framework/Comm/MyTextField.dart';
import 'package:page_transition/page_transition.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../Rt_Rw/dashboard.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var nik = TextEditingController();
  var pw = TextEditingController();

  Future<void> saveToken(String token, String data) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
    await prefs.setString('data', data);
  }

  Future login() async {
    const String baseUrl = "http://192.168.0.117:8000/api/auth/login";
    try {
      var res = await http.post(Uri.parse(baseUrl),
          body: {"nik": nik.text, "password": pw.text});
      if (res.statusCode == 200) {
        final data = jsonDecode(res.body);
        if (data['message'] == "Berhasil login") {
          // ignore: use_build_context_synchronously
          MySnackbar(type: SnackbarType.success, title: "Berhasil Login")
              .showSnackbar(context);
          final prefs = await SharedPreferences.getInstance();
          prefs.setString('token', data['token']);
          prefs.setString('role', data['role']);
          prefs.setString('user', json.encode(data['user']));
          final role = data['role'];
          print(prefs);
          if (role == "4") {
            // Jika role == 1, push ke HomePage
            // ignore: use_build_context_synchronously
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const HomePage(),
              ),
            );
          } else if (role == "2") {
            // Jika role == 2, push ke DashboardRt
            // ignore: use_build_context_synchronously
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const DashboarRtRw(),
              ),
            );
          } else if (role == "3") {
            // Jika role == 3, push ke DashboardRw
            // ignore: use_build_context_synchronously
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const DashboarRtRw(),
              ),
            );
          }
        }
      } else {
        final data = jsonDecode(res.body);
        if (data['message'] == "Nik Anda Belum Terdaftar") {
          // ignore: use_build_context_synchronously
          MySnackbar(
                  type: SnackbarType.error, title: "Nik anda belum terdaftar")
              .showSnackbar(context);
        } else if (data['message'] == "Password Anda Salah") {
          // ignore: use_build_context_synchronously
          MySnackbar(type: SnackbarType.error, title: "Password Anda Salah")
              .showSnackbar(context);
        } else {
          // ignore: use_build_context_synchronously
          MySnackbar(type: SnackbarType.error, title: "Gagal login")
              .showSnackbar(context);
        }
      }
    } catch (e) {
      MySnackbar(type: SnackbarType.error, title: e.toString())
          .showSnackbar(context);
      print(e.toString());
    }
  }

  final formKey = GlobalKey<FormState>();
  bool showpass = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Center(
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 200,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(" S-Kepuharjo",
                              style: MyFont.montserrat(
                                  fontSize: 24,
                                  color: black,
                                  fontWeight: FontWeight.bold)),
                          const SizedBox(
                            width: 5,
                          ),
                          Image.asset(
                            "images/mylogo.png",
                            height: 45,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Smart aplikasi layanan pengajuan\nsurat keterangan.",
                        textAlign: TextAlign.center,
                        style: MyFont.poppins(
                            fontSize: 12,
                            color: black,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, top: 8, bottom: 8),
                  child: Row(
                    children: [
                      Text(
                        "Login",
                        style: MyFont.montserrat(
                            fontSize: 30,
                            color: black,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  height: 20,
                ),
                GetTextFieldUser(
                  controller: nik,
                  label: "No. NIK",
                  keyboardType: TextInputType.number,
                  inputFormatters:
                      FilteringTextInputFormatter.singleLineFormatter,
                  length: 16,
                  icon: Icons.person_rounded,
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.lock_rounded,
                      size: 25,
                      color: grey,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: TextFormField(
                        textInputAction: TextInputAction.done,
                        obscureText: showpass,
                        controller: pw,
                        style: MyFont.poppins(fontSize: 13, color: black),
                        keyboardType: TextInputType.name,
                        onSaved: (val) => pw = val as TextEditingController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Masukan password anda';
                          }
                          return null;
                        },
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.singleLineFormatter,
                          LengthLimitingTextInputFormatter(100)
                        ],
                        decoration: InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: grey)),
                            labelText: "Password",
                            labelStyle:
                                MyFont.poppins(fontSize: 13, color: grey),
                            suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    showpass = !showpass;
                                  });
                                },
                                icon: showpass
                                    ? Icon(
                                        Icons.visibility_off,
                                        size: 20,
                                        color: grey,
                                      )
                                    : Icon(
                                        Icons.visibility,
                                        color: blue,
                                        size: 20,
                                      ))),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                SizedBox(
                    height: 48,
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: blue,
                          shadowColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          )),
                      onPressed: () async {
                        login();
                      },
                      child: Text('Masuk',
                          style: MyFont.poppins(fontSize: 14, color: white)),
                    )),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Belum memiliki akun ? ",
                      style: MyFont.poppins(fontSize: 11, color: grey),
                    ),
                    InkWell(
                      child: Text("Daftar Akun",
                          style: MyFont.poppins(fontSize: 12, color: blue)),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const RegisterPage()));
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
