import 'package:flutter/material.dart';
import 'package:teacherz/models/dev_course.dart';
import 'package:teacherz/presentation/screens/selectlevelscreen/responsiveui/%E2%80%8Ebuildtablet.dart';
import 'package:teacherz/presentation/screens/selectlevelscreen/responsiveui/builddesktop.dart';
import 'package:teacherz/presentation/screens/selectlevelscreen/responsiveui/buildmobile.dart';
import 'package:teacherz/presentation/widget/drawerwidget/drawerwidget.dart';
import 'package:teacherz/presentation/widget/responsivewidgets/responsivewidget.dart';

class SelectLevelScreen extends StatefulWidget {
  const SelectLevelScreen({super.key});

  @override
  State<SelectLevelScreen> createState() => _SelectLevelScreenState();
}

class _SelectLevelScreenState extends State<SelectLevelScreen> {
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
      appBar:
          isMobile ? AppBar(title: const Text('Tour App - Responsive')) : null,
      drawer: isMobile ? Drawer(child: DrawerWidget()) : null,
      body: ResponsiveWidget(
         mobile: BuildMobile(onCourseChanged: changeCourse),
        tablet: BuildTablet(onCourseChanged: changeCourse),
        desktop: buildDesktop(onCourseChanged: changeCourse),
      )
    );
  }
}