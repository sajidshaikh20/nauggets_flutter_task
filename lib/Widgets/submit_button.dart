import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class SubmitButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  const SubmitButton({super.key, required this.onPressed, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: 50,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.white,
          blurRadius: 0,
          spreadRadius: 0,
        )
      ]),
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.white),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(2),
                    side: BorderSide.none))),
        onPressed: onPressed,
        child: Text(
          title,
          style: TextStyle(fontSize: 24, color: Colors.blue),
        ),
      ),
    );
  }
}
