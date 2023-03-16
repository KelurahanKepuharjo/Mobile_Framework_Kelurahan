import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kepuharjo_framework/Shared/Mycolor.dart';
import 'package:kepuharjo_framework/Shared/Myfont.dart';
import 'package:kepuharjo_framework/Comm/MyTextField.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var nik = TextEditingController();
  var pw = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool showpass = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(25),
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 250,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
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
              SizedBox(
                height: 20,
              ),
              GetTextFieldUser(
                controller: nik,
                hintName: "No. Kartu Keluarga",
                keyboardType: TextInputType.name,
                inputFormatters:
                    FilteringTextInputFormatter.singleLineFormatter,
                length: 16,
                icon: Icons.person_rounded,
              ),
              SizedBox(
                height: 20,
              ),
              GetTextFieldUser(
                controller: nik,
                hintName: "No. NIK",
                keyboardType: TextInputType.name,
                inputFormatters:
                    FilteringTextInputFormatter.singleLineFormatter,
                length: 16,
                icon: Icons.person_rounded,
              ),
              SizedBox(
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
                    child: TextField(
                      textInputAction: TextInputAction.done,
                      obscureText: showpass,
                      controller: pw,
                      style: MyFont.poppins(fontSize: 13, color: black),
                      keyboardType: TextInputType.name,
                      // onSaved: (val) => pw = val as TextEditingController,
                      // validator: (value) {
                      //   if (value == null || value.isEmpty) {
                      //     return 'Please enter Your Password';
                      //   }
                      //   return null;
                      // },
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.singleLineFormatter,
                        LengthLimitingTextInputFormatter(20)
                      ],
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(
                            borderSide: BorderSide(color: grey)),
                        hintText: 'Masukan Kata Sandi',
                        isDense: true,
                        // suffixIcon: InkWell(
                        //   child: Icon(
                        //     showpass ? Icons.visibility_off : Icons.visibility,
                        //     size: 20,
                        //     color: blue,
                        //   ),
                        //   onTap: () {
                        //     setState(() {
                        //       showpass = !showpass;
                        //     });
                        //   },
                        // ),
                      ),
                    ),
                  ),
                  InkWell(
                    child: Icon(
                      showpass ? Icons.visibility_off : Icons.visibility,
                      size: 20,
                      color: blue,
                    ),
                    onTap: () {
                      setState(() {
                        showpass = !showpass;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(
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
                    onPressed: () {},
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
                    child: Text("Registrasi",
                        style: MyFont.poppins(fontSize: 12, color: blue)),
                    onTap: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) =>
                      //             const AppearanceRegister()));
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
