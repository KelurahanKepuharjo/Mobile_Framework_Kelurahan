import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:kepuharjo_framework/Services/api_connect.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../Auth/Auth_services.dart';
import '../../../Model/user_model.dart';
import '../../../Shared/Mycolor.dart';
import '../../../Shared/Myfont.dart';

class UbahNomerHandphone extends StatefulWidget {
  const UbahNomerHandphone({super.key});

  @override
  State<UbahNomerHandphone> createState() => _UbahNomerHandphoneState();
}

class _UbahNomerHandphoneState extends State<UbahNomerHandphone> {
  String notlp = "";
  Future getnohp() async {
    final auth = AuthServices();
    User? user = await auth.me();
    final notelpuser = user?.noHp.toString();
    setState(() {
      notlp = notelpuser!;
    });
    print(notelpuser);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getnohp().then((_) {
      setState(() {
        nohp.text = notlp;
      });
    });
  }

  final nohp = TextEditingController();
  void _showModalSheet(BuildContext context) {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (builder) {
          return Padding(
            padding: EdgeInsets.only(
                top: 20,
                left: 15,
                right: 15,
                bottom: MediaQuery.of(context).viewInsets.bottom + 20),
            child: Wrap(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Masukan nomer telepon baru anda :",
                  style: MyFont.poppins(
                      fontSize: 12,
                      color: black,
                      fontWeight: FontWeight.normal),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  textInputAction: TextInputAction.done,
                  controller: nohp,
                  style: MyFont.poppins(
                    fontSize: 14,
                    color: black,
                  ),
                  keyboardType: TextInputType.number,
                  readOnly: false,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(13)
                  ],
                  decoration: InputDecoration(
                    hintText: "No.Telepon",
                    isDense: false,
                    prefixIcon: Icon(
                      Icons.phone,
                      size: 20,
                      color: softgrey,
                    ),
                    border: UnderlineInputBorder(
                        borderSide: BorderSide(color: lavender)),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Spacer(),
                    Row(
                      children: [
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              "Batal",
                              style: MyFont.poppins(
                                  fontSize: 12,
                                  color: lavender,
                                  fontWeight: FontWeight.bold),
                            )),
                        TextButton(
                            onPressed: () async {
                              try {
                                final prefs =
                                    await SharedPreferences.getInstance();
                                final token = prefs.getString('token');
                                var res = await http
                                    .post(Uri.parse(Api.editnohp), body: {
                                  'no_hp': nohp.text
                                }, headers: {
                                  "Authorization": "Bearer $token"
                                });
                                final data = jsonDecode(res.body);
                                if (res.statusCode == 200) {
                                  if (data['message'] ==
                                      "Nomor HP berhasil diperbarui") {
                                    // ignore: use_build_context_synchronously
                                    Navigator.pop(context);
                                  }
                                } else {
                                  Fluttertoast.showToast(
                                      msg: data['message'],
                                      backgroundColor: Colors.red,
                                      toastLength: Toast.LENGTH_LONG);
                                }
                              } catch (e) {
                                print(e.toString());
                              }
                            },
                            child: Text(
                              "Simpan",
                              style: MyFont.poppins(
                                  fontSize: 12,
                                  color: lavender,
                                  fontWeight: FontWeight.bold),
                            ))
                      ],
                    )
                  ],
                ),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
          backgroundColor: white,
          shadowColor: Colors.transparent,
          automaticallyImplyLeading: false,
          title: Text(
            "Ubah Nomer Telepon",
            style: MyFont.poppins(
                fontSize: 14, color: black, fontWeight: FontWeight.bold),
          ),
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Icon(
                Icons.keyboard_arrow_left_rounded,
                color: black,
              ),
            ),
          )),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 5, right: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "No.Telepon",
                    style: MyFont.poppins(fontSize: 12, color: black),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            TextField(
              textInputAction: TextInputAction.done,
              controller: nohp,
              style: MyFont.poppins(fontSize: 14, color: black),
              keyboardType: TextInputType.number,
              readOnly: true,
              onTap: () {
                _showModalSheet(context);
              },
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(13)
              ],
              decoration: InputDecoration(
                hintText: "No.Telepon",
                isDense: false,
                prefixIcon: Icon(
                  Icons.phone,
                  size: 20,
                  color: softgrey,
                ),
                suffixIcon: InkWell(
                  onTap: () {
                    _showModalSheet(context);
                  },
                  child: Icon(
                    Icons.mode_edit,
                    size: 20,
                    color: softgrey,
                  ),
                ),
                border: UnderlineInputBorder(
                    borderSide: BorderSide(color: lavender)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
