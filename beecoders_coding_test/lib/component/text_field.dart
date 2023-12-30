import 'package:beecoders_coding_test/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget getTextField(
    {String? hint,
    EdgeInsetsGeometry? cp,
    double? left,
    double? top,
    double? right,
    double? bottom,
    required String label,
    keyboardtype,
    String? Function(String?)? validator,
    TextEditingController? controller,
    IconData? preIcon,
    Color? preIconColor,
    IconButton? suffIconButton,
    IconData? suffIcon,
    Color? suffIconColor,
    Function(String)? onSaved,
    Function()? onPress,
    bool? en}) {
  return TextFormField(
    onSaved: (value) {
      onSaved;
    },
    keyboardType: keyboardtype,
    enabled: en,
    validator: validator,
    controller: controller,
    decoration: InputDecoration(
        contentPadding: cp,
        hintText: hint,
        labelText: label,
        hintStyle: TextStyle(
            fontSize: 15.sp,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
            color: Style.darkGrey),
        prefixIcon: Icon(preIcon, color: preIconColor),
        suffixIcon: IconButton(
          icon: Icon(suffIcon),
          onPressed: onPress,
          color: suffIconColor,
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: Colors.transparent)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: Colors.transparent)),
        filled: true,
        fillColor: Style.lightYellow),
  );
}
