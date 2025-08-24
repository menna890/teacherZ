import 'package:flutter/material.dart';
import 'package:teacherz/models/dev_course.dart';
import 'package:teacherz/presentation/widget/courseviewwidget.dart';
import 'package:teacherz/presentation/widget/drawerwidget/drawerwidget.dart';

class BuildTablet extends StatelessWidget {
  final ValueChanged<Course> onCourseChanged;
  const BuildTablet({super.key, required this.onCourseChanged});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(flex: 2, child: DrawerWidget()),
        Expanded(
          flex: 5,
          child: CourseViewWidget(onCourseChanged: onCourseChanged),
        ),
      ],
    );
  }
}
