import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kepuharjo_framework/Shared/Mycolor.dart';
import 'package:kepuharjo_framework/Shared/Myfont.dart';

class GetTextFieldUser extends StatefulWidget {
  TextEditingController controller;
  String hintName;
  TextInputType keyboardType;
  TextInputFormatter inputFormatters;
  int length;
  IconData icon;
  TextInputAction textInputAction;
  GetTextFieldUser(
      {Key? key,
      required this.controller,
      required this.hintName,
      required this.keyboardType,
      required this.inputFormatters,
      required this.length,
      required this.icon,
      this.textInputAction = TextInputAction.done})
      : super(key: key);

  @override
  State<GetTextFieldUser> createState() => _GetTextFieldUserState();
}

class _GetTextFieldUserState extends State<GetTextFieldUser> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          widget.icon,
          size: 25,
          color: grey,
        ),
        const SizedBox(
          width: 8,
        ),
        Expanded(
          child: TextField(
            textInputAction: widget.textInputAction,
            controller: widget.controller,
            style: MyFont.poppins(fontSize: 13, color: black),
            keyboardType: widget.keyboardType,
            inputFormatters: [
              widget.inputFormatters,
              LengthLimitingTextInputFormatter(widget.length)
            ],
            decoration: InputDecoration(
              hintText: widget.hintName,
              isDense: true,
              border: UnderlineInputBorder(borderSide: BorderSide(color: grey)),
            ),
          ),
        ),
      ],
    );
  }
}
