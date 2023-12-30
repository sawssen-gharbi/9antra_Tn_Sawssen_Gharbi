import 'package:flutter/material.dart';



Widget getTextSpan(
    {required title, required fontSize, required color, IconData? icon}) {
  return RichText(
    textAlign: TextAlign.center,
    text: TextSpan(
        text: title,
        style: TextStyle(
            fontSize: fontSize, fontWeight: FontWeight.w500, color: color)),
  );
}
