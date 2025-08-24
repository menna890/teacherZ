import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:teacherz/presentation/screens/homescreen.dart';
import 'package:teacherz/router.dart';
// import 'package:teacherz/view/onboarding/onboarding_screen.dart';

void main() {
  runApp( MyApp(appRouter: AppRouter()));
}

class MyApp extends StatefulWidget {
  final AppRouter appRouter;
  const MyApp({super.key,required this.appRouter});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
bool _showSplash = true;

@override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      setState(() => _showSplash = false);
    });
  }


  @override
  Widget build(BuildContext context) {
    const colorizeColors = [
      Colors.purple,
      Colors.blue,
      Colors.yellow,
      Colors.red,
    ];
    return ScreenUtilInit(
      designSize: const Size(360, 812),
      splitScreenMode: true,
      minTextAdapt: true,
      builder: (context, child) => MaterialApp(
        
  scrollBehavior: const ScrollBehavior().copyWith(scrollbars: false),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: widget.appRouter.generateRoute,
        initialRoute: '/',
        home:  _showSplash
              ? AnimatedSplashScreen(
        duration: 2300,
        splash: SizedBox(
          width: 250.0,
          child: DefaultTextStyle(
            style: const TextStyle(fontSize: 40.0),
            child: AnimatedTextKit(
              animatedTexts: [
                ColorizeAnimatedText(
                  'TeacherZ',
                  textStyle: TextStyle(
                    fontSize: 60.0,
                    fontWeight:FontWeight.bold,
                  ),
                  colors: colorizeColors,
                ),
              ],
              // totalRepeatCount: 1, // play once
            ),
          ),
        ),
        nextScreen: HomeScreen(),
        // splashTransition: SplashTransition.rotationTransition,
        pageTransitionType: PageTransitionType.rightToLeft,
        backgroundColor: Colors.white,
      ):const HomeScreen()
      ),
    );
  }
 }

// import 'package:flutter/material.dart';
// import 'package:animated_splash_screen/animated_splash_screen.dart';
// import 'package:animated_text_kit/animated_text_kit.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:page_transition/page_transition.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:teacherz/presentation/screens/homescreen.dart';
// import 'package:teacherz/router.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   runApp(MyApp(appRouter: AppRouter()));
// }

// class MyApp extends StatefulWidget {
//   final AppRouter appRouter;
//   const MyApp({super.key, required this.appRouter});

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   Widget? _homeScreen;
//   bool _isInitialized = false;

//   @override
//   void initState() {
//     super.initState();
//     _initializeApp();
//   }

//   Future<void> _initializeApp() async {
//     final prefs = await SharedPreferences.getInstance();
//     final isFirstLaunch = prefs.getBool('isFirstLaunch') ?? true;
    
//     if (isFirstLaunch) {
//       await prefs.setBool('isFirstLaunch', false);
//       // First launch - use splash screen
//       _homeScreen = _buildSplashScreen();
//     } else {
//       // Subsequent launch - go directly to home
//       _homeScreen = const HomeScreen();
//     }
    
//     if (mounted) {
//       setState(() => _isInitialized = true);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (!_isInitialized) {
//       return const MaterialApp(home: Scaffold(body: Center(child: CircularProgressIndicator())));
//     }

//     return ScreenUtilInit(
//       designSize: const Size(360, 812),
//       splitScreenMode: true,
//       minTextAdapt: true,
//       builder: (context, child) => MaterialApp(
//         debugShowCheckedModeBanner: false,
//         onGenerateRoute: widget.appRouter.generateRoute,
//         home: _homeScreen!,
//       ),
//     );
//   }

//   Widget _buildSplashScreen() {
//     const colorizeColors = [
//       Colors.purple,
//       Colors.blue,
//       Colors.yellow,
//       Colors.red,
//     ];

//     return AnimatedSplashScreen(
//       duration: 2300,
//       splash: SizedBox(
//         width: 250.0,
//         child: DefaultTextStyle(
//           style: const TextStyle(fontSize: 40.0),
//           child: AnimatedTextKit(
//             animatedTexts: [
//               ColorizeAnimatedText(
//                 'TeacherZ',
//                 textStyle: const TextStyle(
//                   fontSize: 60.0,
//                   fontWeight: FontWeight.bold,
//                 ),
//                 colors: colorizeColors,
//               ),
//             ],
//             isRepeatingAnimation: false,
//           ),
//         ),
//       ),
//       nextScreen: const HomeScreen(),
//       pageTransitionType: PageTransitionType.rightToLeft,
//       backgroundColor: Colors.white,
//       splashTransition: SplashTransition.fadeTransition,
//     );
//   }
// }