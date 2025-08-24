import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class BuildHeader extends StatelessWidget {
  final double fontSize;
  const BuildHeader({super.key, required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('assets/images/Cover BG 3D Class.png')
        ),
      ),
      child: Container(
        alignment: AlignmentDirectional.bottomStart,
        child: AutoSizeText(
          'TeacherZ',
          minFontSize: 22,
          maxFontSize: 30,
          style: TextStyle(fontSize: fontSize, color: Colors.white),
        ),
      ),
    );
  }
}
