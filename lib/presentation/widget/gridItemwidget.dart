import 'package:flutter/material.dart';
import 'package:teacherz/models/dev_course.dart';
import 'package:teacherz/presentation/screens/detailspage.dart';
import 'package:teacherz/presentation/widget/responsivewidgets/responsivewidget.dart';
import 'package:auto_size_text/auto_size_text.dart';

class GridItemWidget extends StatelessWidget {
  const GridItemWidget({
    required this.course,
    required this.onCourseChanged,
    super.key,
  });

  final Course course;
  final ValueChanged<Course> onCourseChanged;

  @override
  Widget build(BuildContext context) {
    final fontSize = MediaQuery.of(context).size.width * 0.02;
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: InkWell(
        onTap: () {
          final isMobile = ResponsiveWidget.isMobile(context);
          final isTablet = ResponsiveWidget.isTablet(context);

          if (isMobile || isTablet) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => DetailsPage(course: course),
              ),
            );
          } else {
            onCourseChanged(course);
          }
        },
        child: GridTile(
          header: GridTileBar(
            title: AutoSizeText(
              course.name,
              minFontSize: 18,
              maxFontSize: 28,
              style: TextStyle(fontSize: fontSize),
            ),
            subtitle: AutoSizeText(
              course.author,
              minFontSize: 14,
              maxFontSize: 20,
              style: TextStyle(fontSize: fontSize),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Ink.image(
              image: AssetImage(course.thumbnail),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
