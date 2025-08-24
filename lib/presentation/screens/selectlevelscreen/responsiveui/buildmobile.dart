import 'package:flutter/material.dart';
import 'package:teacherz/models/dev_course.dart';
import 'package:teacherz/presentation/screens/user_information_screen.dart';

class BuildMobile extends StatelessWidget {
  final ValueChanged<Course> onCourseChanged;

  const BuildMobile({super.key, required this.onCourseChanged});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      scrollBehavior: const ScrollBehavior().copyWith(scrollbars: false),
      home: InformationScreen(),
    );
  }
}
