// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class SignButton extends StatelessWidget {
  SignButton(
      {Key? key,
      required this.navigate,
      required this.text,
      required this.color})
      : super(key: key);
  String navigate;
  Color color;
  String text;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, navigate);
      },
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: color,
        ),
        height: 67,
        width: 353,
        child: Text(
          text,
          style:const TextStyle(
              color: Colors.white, fontWeight: FontWeight.w600, fontSize: 18),
        ),
      ),
    );
  }
}
