import 'package:flutter/material.dart';
import 'package:teacherz/models/dev_course.dart';
import 'package:teacherz/presentation/widget/drawerwidget/drawerwidget.dart';
import 'package:teacherz/presentation/widget/responsivewidgets/%E2%80%8Ebuildtablet.dart';
import 'package:teacherz/presentation/widget/responsivewidgets/builddesktop.dart';
import 'package:teacherz/presentation/widget/responsivewidgets/buildmobile.dart';
import 'package:teacherz/presentation/widget/responsivewidgets/responsivewidget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Course selectedCourse = courses[0];
  void changeCourse(Course course) {
    setState(() {
      selectedCourse = course;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveWidget.isMobile(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Tour App - Responsive')),
      drawer: isMobile ? Drawer(child: DrawerWidget()) : null,
      body: ResponsiveWidget(
        mobile: BuildMobile(onCourseChanged: changeCourse),
        tablet: BuildTablet(onCourseChanged: changeCourse),
        desktop: buildDesktop(onCourseChanged: changeCourse),
      ),
    );
  }
}
