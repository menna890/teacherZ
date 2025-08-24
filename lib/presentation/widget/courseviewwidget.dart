import 'package:flutter/material.dart';
import 'package:teacherz/constant/colors.dart';
import 'package:teacherz/models/dev_course.dart';
import 'package:teacherz/presentation/widget/gridItemwidget.dart';

class CourseViewWidget extends StatelessWidget {
  final ValueChanged<Course> onCourseChanged;
  final bool isHorizontal;

  const CourseViewWidget({
    super.key,
    required this.onCourseChanged,
    this.isHorizontal = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kPrimaryLight,
      child: GridView.count(
        crossAxisCount: 2,
        scrollDirection: Axis.vertical,
        // crossAxisCount: isHorizontal ? 1 : 2,
        // scrollDirection: isHorizontal ? Axis.horizontal : Axis.vertical,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        padding: const EdgeInsets.all(8),
        childAspectRatio: 1 / 1,

        children:
            courses
                .map<Widget>(
                  (course) => GridItemWidget(
                    course: course,
                    onCourseChanged: onCourseChanged,
                  ),
                )
                .toList(),
      ),
    );
  }
}
