import 'package:flutter/material.dart';
import 'package:teacherz/models/dev_course.dart';
import 'package:teacherz/presentation/widget/courseviewwidget.dart';
import 'package:teacherz/presentation/widget/drawerwidget/drawerwidget.dart';

class buildDesktop extends StatelessWidget {

  
  final ValueChanged<Course> onCourseChanged;
  const buildDesktop({super.key, required this.onCourseChanged});

  @override
  Widget build(BuildContext context) {
    return Row(
        children: [
          const Expanded(child: DrawerWidget()),
          Expanded(flex: 3, child: buildBody()),
        ],
      );
  }
  Widget buildBody() => Container(
        color: Colors.grey[200],
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: CourseViewWidget(
                 onCourseChanged: onCourseChanged,
                isHorizontal: true,
              ),
            ),
            // Expanded(
            //   flex: 2,
            //   child: PlaceDetailsWidget(place: selectedPlace),
            // )
          ],
        ),
      );
  }
