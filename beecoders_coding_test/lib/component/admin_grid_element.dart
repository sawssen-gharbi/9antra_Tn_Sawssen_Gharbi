import 'package:beecoders_coding_test/utils/colors.dart';
import 'package:flutter/material.dart';

Widget getAdminGridElement(
    {required String title,
    Color? background,
    IconData? icon,
    required onTap}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: Style.pink.withOpacity(.2),
                spreadRadius: 2,
                blurRadius: 2)
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: background,
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: Colors.white)),
          const SizedBox(height: 8),
          Text(title)
        ],
      ),
    ),
  );
}
