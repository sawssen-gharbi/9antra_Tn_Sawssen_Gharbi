import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:beecoders_coding_test/component/text.dart';
import 'package:beecoders_coding_test/component/text_btn.dart';
import 'package:beecoders_coding_test/component/text_field.dart';
import 'package:beecoders_coding_test/screens/admin_dashboard.dart';

import 'package:beecoders_coding_test/utils/colors.dart';
import 'package:beecoders_coding_test/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class AddCourse extends StatefulWidget {
  const AddCourse({super.key});

  @override
  State<AddCourse> createState() => _AddCourseState();
}

class _AddCourseState extends State<AddCourse> {
  //var
  final GlobalKey<FormState> _keyForm = GlobalKey<FormState>();
  late String _title = title.text.toLowerCase();
  late String _price = price.text.toLowerCase();

//controller
  TextEditingController title = TextEditingController();
  TextEditingController price = TextEditingController();

  //upload image
  File? image;
  final _picker = ImagePicker();

  Future getImage() async {
    final pickedFile =
        await _picker.pickImage(source: ImageSource.gallery, imageQuality: 80);
    if (pickedFile != null) {
      image = File(pickedFile.path);
      debugPrint(image.toString());
    } else {
      debugPrint('no image selected');
    }
  }

  Future<void> addCourse() async {
    if (image == null) {
      debugPrint('No image selected');
      AwesomeDialog(
        context: context,
        dialogType: DialogType.warning,
        animType: AnimType.topSlide,
        showCloseIcon: true,
        title: "Alert",
        titleTextStyle: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w900,
        ),
        desc: "No image is selected!",
      ).show();
      return;
    }

    var stream = http.ByteStream(image!.openRead());
    stream.cast();

    var length = await image!.length();

    var uri = Uri.parse("$baseUrl/course/addCourse");

    var request = http.MultipartRequest('POST', uri);

    request.fields['title'] = _title;
    request.fields['price'] = _price;

    var multiPartFile = http.MultipartFile('image', stream, length,
        filename: image!.path.split('/').last);

    debugPrint(image!.path.split('/').last);

    request.files.add(multiPartFile);

    var response = await request.send();

    debugPrint(response.stream.toString());

    if (response.statusCode == 201 && context.mounted) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const AdminDashboard()));
    } else if (context.mounted) {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.error,
        animType: AnimType.topSlide,
        showCloseIcon: true,
        title: "Error",
        titleTextStyle: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w900,
        ),
        desc: "Course already exist!",
      ).show();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          title: getTextSpan(
              title: "Add course", fontSize: 20.sp, color: Colors.black),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Form(
              key: _keyForm,
              child: ListView(children: [
                Image.asset("Assets/add_course.png"),
                SizedBox(height: 30.h),
                getTextField(
                    keyboardtype: TextInputType.text,
                    label: "Title",
                    hint: "Enter your title",
                    controller: title,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Title cannot be empty!";
                      }
                      return null;
                    },
                    onSaved: (String? value) {
                      _title = value!;
                    },
                    preIcon: Icons.title,
                    preIconColor: Style.pink),
                SizedBox(height: 20.h),
                getTextField(
                    keyboardtype: TextInputType.number,
                    label: "Price",
                    hint: "Enter your price",
                    controller: price,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Price cannot be empty!";
                      } else {
                        if (val.length > 4) {
                          return "Price must be 4 characters";
                        }
                      }
                      return null;
                    },
                    onSaved: (String? value) {
                      _price = value!;
                    },
                    preIcon: Icons.money,
                    preIconColor: Style.pink),
                SizedBox(height: 20.h),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      getTextSpan(
                          title: "Upload your image",
                          fontSize: 15.sp,
                          color: Style.pink),
                      getTextButton(
                          width: 70.w,
                          height: 40.h,
                          bgColor: Style.pink,
                          fgColor: Colors.white,
                          title: "Browse",
                          fontsize: 13.sp,
                          circular: BorderRadius.circular(30.0),
                          onPressed: getImage,
                          context: context)
                    ]),
                SizedBox(height: 50.h),
                Center(
                  child: getTextButton(
                    circular: BorderRadius.circular(5.0),
                    width: 150.w,
                    height: 40.h,
                    bgColor: Style.pink,
                    fgColor: Colors.white,
                    title: "Save the course",
                    fontsize: 15.sp,
                    onPressed: () {
                      if (_keyForm.currentState!.validate()) {
                        addCourse();
                      }
                    },
                    context: context,
                  ),
                ),
              ])),
        ),
      ),
    );
  }
}
