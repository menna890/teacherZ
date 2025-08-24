import 'package:flutter/material.dart';
import 'package:teacherz/data/drawertem.dart';
import 'package:teacherz/presentation/widget/drawerwidget/%E2%80%8Ebuildheader.dart';
import 'package:teacherz/presentation/widget/drawerwidget/buildmenuItem.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final fontSize = MediaQuery.of(context).size.width * 0.02;

    return ListView.builder(
      itemCount: drawerItems.length + 1,
      itemBuilder: (context, index) {
        return index == 0
            ? BuildHeader(fontSize: fontSize)
            : BuildMenuItem(index: index, fontSize: fontSize);
      },
    );
  }
}
