import 'package:flutter/material.dart';


Widget getGridElement({required String image}) {
  return Container(
    decoration: BoxDecoration(
      image: DecorationImage(image: AssetImage(image)),
    
    ),
  );
}
