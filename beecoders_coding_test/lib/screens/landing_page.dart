import 'package:beecoders_coding_test/component/text.dart';
import 'package:beecoders_coding_test/component/text_btn.dart';
import 'package:beecoders_coding_test/component/text_field.dart';
import 'package:beecoders_coding_test/screens/admin_dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/colors.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  //var

  final List<Map<String, dynamic>> courses = [
    {
      "title": "Spring Boot / Angular",
      "price": "350 DT/ Month",
      "image": "Assets/sbang.jpg",
    },
    {
      "title": "Node JS / React",
      "price": "350 DT/ Month",
      "image": "Assets/react.jpg",
    },
    {
      "title": "Flutter / Firebase",
      "price": "350 DT/ Month",
      "image": "Assets/flutter.png",
    },
    {
      "title": "Buisness Intelligence",
      "price": "350 DT/ Month",
      "image": "Assets/bi.jpg",
    },
    {
      "title": "Artifical Intelligence",
      "price": "350 DT/ Month",
      "image": "Assets/ai.png",
    },
    {
      "title": "Devops",
      "price": "350 DT/ Month",
      "image": "Assets/devops.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Image.asset(
              "Assets/logo.png",
              width: 40,
              height: 40,
              alignment: Alignment.topLeft,
            ),
            SizedBox(height: 20.h),
            Container(
              height: 300.h,
              width: 300.w,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("Assets/background.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: Container(
                  height: 150.h,
                  width: 300.w,
                  color: const Color(0xFFFFFFFF).withOpacity(0.7),
                  child: Column(
                    children: [
                      SizedBox(height: 20.h),
                      getTextSpan(
                          title:
                              "Improve your skills on your own \n To prepare for a better future",
                          fontSize: 18.sp,
                          color: Colors.black),
                      SizedBox(height: 10.h),
                      getTextButton(
                        circular: BorderRadius.circular(20.0),
                        width: 150.w,
                        height: 40.h,
                        bgColor: Style.pink,
                        fgColor: Colors.white,
                        title: "REGISTER NOW",
                        fontsize: 13.sp,
                        onPressed: () {},
                        context: context,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  getTextSpan(
                      title: "Discover Our Courses",
                      fontSize: 18.sp,
                      color: Colors.black),
                  getTextButton(
                    circular: BorderRadius.circular(20.0),
                    width: 100.w,
                    height: 40.h,
                    bgColor: Style.pink,
                    fgColor: Colors.white,
                    title: "View More",
                    fontsize: 13.sp,
                    onPressed: () {},
                    context: context,
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: GridView.builder(
                physics:
                    const NeverScrollableScrollPhysics(), // to disable GridView's scrolling
                shrinkWrap: true,
                primary: false,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    mainAxisExtent: 200),
                itemCount: courses.length,
                itemBuilder: (context, index) {
                  return Material(
                    elevation: 10,
                    borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10.0),
                              topRight: Radius.circular(10.0)),
                          child: Image.asset(
                            "${courses.elementAt(index)['image']}",
                            height: 120,
                            width: double.infinity,
                            fit: BoxFit.fill,
                          ),
                        ),
                        SizedBox(height: 10.h),
                        getTextSpan(
                            title: "${courses.elementAt(index)['title']}",
                            fontSize: 15.sp,
                            color: Colors.black),
                        SizedBox(height: 15.h),
                        getTextSpan(
                            title: "${courses.elementAt(index)['price']}",
                            fontSize: 15.sp,
                            color: Style.pink),
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 30.h),
            Center(
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  color: Style.yellow,
                ),
                height: 350,
                width: 350,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(children: [
                    getTextSpan(
                        title: "Contact Us",
                        fontSize: 18.sp,
                        color: Colors.black),
                    SizedBox(height: 20.h),
                    getTextField(
                      cp: const EdgeInsets.fromLTRB(0, 5.0, 0, 5.0),
                      keyboardtype: TextInputType.name,
                      hint: "Sawssen Gharbi",
                      label: "Name",
                    ),
                    SizedBox(height: 10.h),
                    getTextField(
                      cp: const EdgeInsets.fromLTRB(0, 5.0, 0, 5.0),
                      keyboardtype: TextInputType.emailAddress,
                      hint: "sawssengharbi97@gmail.com",
                      label: "Email",
                    ),
                    SizedBox(height: 10.h),
                    getTextField(
                      cp: const EdgeInsets.fromLTRB(0, 40.0, 0, 40.0),
                      keyboardtype: TextInputType.multiline,
                      hint: "Write yout message here",
                      label: "Message",
                    ),
                    SizedBox(height: 15.h),
                    getTextButton(
                      circular: BorderRadius.circular(5.0),
                      width: 150.w,
                      height: 40.h,
                      bgColor: Style.pink,
                      fgColor: Colors.white,
                      title: "Send the message",
                      fontsize: 13.sp,
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => const AdminDashboard()));
                      },
                      context: context,
                    ),
                  ]),
                ),
              ),
            ),
            SizedBox(height: 50.h),
          ],
        ),
      ),
    );
  }
}
