import 'package:flutter/material.dart';
import 'package:teacherz/models/dev_course.dart';
import 'package:teacherz/presentation/screens/user_information_screen.dart';
import 'package:teacherz/presentation/widget/drawerwidget/drawerwidget.dart';

class buildDesktop extends StatelessWidget {
  final ValueChanged<Course> onCourseChanged;
  const buildDesktop({super.key, required this.onCourseChanged});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(flex: 1, child: DrawerWidget()),
        Expanded(flex: 6, child: InformationScreen()),
      ],
    );
  }

  Widget buildBody() => Container(color: Colors.grey[200]);
}
