import 'package:flutter/material.dart';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:teacherz/constant/colors.dart';
import 'package:teacherz/data/drawertem.dart';

class BuildMenuItem extends StatelessWidget {
  final int index;
  final double fontSize;
  const BuildMenuItem({super.key, required this.index, required this.fontSize});

  @override
  Widget build(BuildContext context) {
    final currentRoute = ModalRoute.of(context)!.settings.name;

    return ListTile(
      leading: Icon(
        drawerItems[index - 1].icon,
        color:
            currentRoute == drawerItems[index - 1].route
                ? kPrimaryColor
                : Colors.grey,
      ),
      title: AutoSizeText(
        drawerItems[index - 1].title,
        minFontSize: 18,
        maxFontSize: 28,
        style: TextStyle(
          fontSize: fontSize,
          color:
              currentRoute == drawerItems[index - 1].route
                  ? kPrimaryColor
                  : Colors.grey,
        ),
      ),
      selected: currentRoute == drawerItems[index - 1].route,
      selectedTileColor: Colors.deepPurple.withOpacity(0.1),
      onTap: () {
        Navigator.pop(context);
        if (currentRoute != drawerItems[index - 1].route) {
          Navigator.pushNamed(context, drawerItems[index - 1].route);
        }
      },
    );
  }
}
