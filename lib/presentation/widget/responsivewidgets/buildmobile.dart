import 'package:flutter/material.dart';
import 'package:teacherz/models/dev_course.dart';
import 'package:teacherz/presentation/widget/courseviewwidget.dart';

class BuildMobile extends StatelessWidget {
  final ValueChanged<Course> onCourseChanged;

  const BuildMobile({super.key, required this.onCourseChanged});

  @override
  Widget build(BuildContext context) =>
      CourseViewWidget(onCourseChanged: onCourseChanged);
}
