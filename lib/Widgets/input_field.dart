// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class InputTextFieldWidget extends StatelessWidget {
  final TextEditingController textEditingController;
  final String? hintText;

  InputTextFieldWidget(
      {super.key, required this.textEditingController, this.hintText});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46,
      child: TextField(
        controller: textEditingController,
        style: TextStyle(color: Colors.white, fontSize: 20),
        decoration: InputDecoration(
            alignLabelWithHint: true,
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white)),
            fillColor: Colors.white70,
            hintText: hintText,
            hintStyle: const TextStyle(color: Colors.grey),
            contentPadding: EdgeInsets.only(bottom: 15),
            focusColor: Colors.white),
      ),
    );
  }
}
