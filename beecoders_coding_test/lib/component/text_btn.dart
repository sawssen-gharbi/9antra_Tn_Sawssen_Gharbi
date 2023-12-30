import 'package:flutter/material.dart';

Widget getTextButton(
    {required width,
    required height,
    required bgColor,
    required fgColor,
    required title,
    required fontsize,
    required BorderRadiusGeometry circular,
    Widget? page,
    required onPressed,
    required BuildContext context}) {
  return SizedBox(
    width: width,
    height: height,
    child: TextButton(
      onPressed: () {
        onPressed();
      },
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(bgColor),
          foregroundColor: MaterialStateProperty.all(fgColor),
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: circular))),
      child: Text(
        title,
        style: TextStyle(
          fontSize: fontsize,
          fontWeight: FontWeight.w900,
        ),
      ),
    ),
  );
}
