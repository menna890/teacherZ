import 'package:flutter/material.dart';
import 'package:teacherz/presentation/screens/homescreen.dart';
import 'package:teacherz/presentation/screens/resources_screen.dart';
import 'package:teacherz/presentation/screens/profile_screen.dart';
import 'package:teacherz/presentation/screens/settings_screen.dart';
import 'package:teacherz/presentation/screens/help_screen.dart';
import 'package:teacherz/presentation/screens/login_screen.dart';

class AppRouter {
  Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case '/resources':
        return MaterialPageRoute(builder: (_) => const ResourcesScreen());
      case '/profile':
        return MaterialPageRoute(builder: (_) => const ProfileScreen());
      case '/settings':
        return MaterialPageRoute(builder: (_) => const SettingsScreen());
      case '/help':
        return MaterialPageRoute(builder: (_) => const HelpScreen());
      case '/login':
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text("Page Not Found")),
          ),
        );
    }
  }
}
