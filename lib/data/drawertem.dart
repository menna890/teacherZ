import 'package:teacherz/models/draweritem.dart';
import 'package:flutter/material.dart';


List<DrawerItem> drawerItems = [
  DrawerItem(title: 'Home', icon: Icons.home, route: '/'),
  DrawerItem(title: 'My Courses', icon: Icons.book, route: '/'),
  DrawerItem(title: 'Exams', icon: Icons.assignment, route: '/'),
  DrawerItem(title: 'Resources', icon: Icons.folder, route: '/resources'),
  DrawerItem(title: 'Profile', icon: Icons.person, route: '/profile'),
  DrawerItem(title: 'Settings', icon: Icons.settings, route: '/settings'),
  DrawerItem(title: 'Help', icon: Icons.help, route: '/help'),
  DrawerItem(title: 'Log Out', icon: Icons.logout, route: '/login'),
];