import 'dart:convert';

import 'package:beecoders_coding_test/component/text.dart';
import 'package:beecoders_coding_test/models/course.dart';
import 'package:beecoders_coding_test/screens/add_course.dart';
import 'package:beecoders_coding_test/screens/update_course.dart';
import 'package:beecoders_coding_test/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import '../utils/constant.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({super.key});

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  //var
  List<Course> courses = [];

  //actions
  Future<void> deleteCourse(String courseId) async {
    final response =
        await http.delete(Uri.parse('$baseUrl/course/deleteCourse/$courseId'));
    if (response.statusCode == 200) {
      debugPrint('Course deleted successfully.');
    } else {
      debugPrint(
          'Failed to delete therapy. Status code: ${response.statusCode}');
    }
  }

  Future<List<Course>> getCourses() async {
    courses.clear();
    //url
    Uri verifyUri = Uri.parse("$baseUrl/course/getAllCourses");

    //request
    try {
      final response = await http.get(verifyUri);

      if (response.statusCode == 200) {
        var jsonObject = jsonDecode(response.body);

        jsonObject['courses'].forEach((course) => {
              courses.add(Course(course['_id'], course['title'],
                  course['price'], course['image'])),
            });
        return courses;
      } else {
        debugPrint('HTTP request failed with status: ${response.statusCode}');
        return [];
      }
    } catch (e) {
      debugPrint('HTTP request failed with error: $e');
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Style.pink,
          title: getTextSpan(
            title: "Admin Dashboard",
            fontSize: 20.sp,
            color: Colors.white,
          ),
          actions: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: IconButton(
                icon: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const AddCourse()));
                },
              ),
            ),
          ],
        ),
        backgroundColor: Style.lightBeige,
        body: FutureBuilder<List<Course>>(
          future: getCourses(),
          builder:
              (BuildContext context, AsyncSnapshot<List<Course>> snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.data!.isEmpty) {
              return Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "Assets/nodata.png",
                    width: 200.w,
                    height: 200.h,
                  ),
                  getTextSpan(
                      title: "No data available",
                      fontSize: 15.sp,
                      color: Style.pink)
                ],
              ));
            } else {
              List<Course> pdata = snapshot.data!;
              return ListView.builder(
                itemCount: pdata.length,
                itemBuilder: (context, index) {
                  return Dismissible(
                    background: Container(
                      color: Colors.red,
                      child: const Icon(
                        Icons.delete,
                        color: Colors.white,
                      ),
                    ),
                    key: ValueKey<String>(pdata[index].id!),
                    onDismissed: (direction) {
                      deleteCourse(pdata[index].id!);
                      setState(() {
                        courses.removeAt(index);
                      });
                    },
                    child: Card(
                      color: Style.lightYellow,
                      elevation: 1,
                      child: ListTile(
                        leading: Image.network(
                          pdata[index].image!,
                          width: 80,
                          height: 100,
                          fit: BoxFit.fill,
                        ),
                        title: Align(
                          alignment: Alignment.centerLeft,
                          child: getTextSpan(
                              title: "${pdata[index].title}",
                              fontSize: 18.sp,
                              color: Colors.black),
                        ),
                        subtitle: Align(
                          alignment: Alignment.centerLeft,
                          child: getTextSpan(
                              title: "${pdata[index].price} DT",
                              fontSize: 13.sp,
                              color: Style.pink),
                        ),
                        trailing: IconButton(
                            icon: const Icon(Icons.edit),
                            color: Colors.green,
                            onPressed: () {
                              Navigator.of(context)
                                  .pushReplacement(MaterialPageRoute(
                                      builder: (context) => UpdateCourse(
                                            id: pdata[index].id!,
                                            image: pdata[index].image!,
                                            price: pdata[index].price!,
                                            title: pdata[index].title!,
                                          )));
                            }),
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
