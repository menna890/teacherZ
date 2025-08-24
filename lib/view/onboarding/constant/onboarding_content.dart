import 'package:flutter/widgets.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
int height = 300;

class OnboardingContent {
  final String subtitle;
  final String title;
  final Widget animations; 

  OnboardingContent({
    required this.subtitle,
    required this.title,
    required this.animations,
  });
}

List<OnboardingContent> contents = [
  OnboardingContent(
    title: "Study with Flexible Schedule",
    subtitle: "Live and interactive classes with class recordings saved for revisions along with 24/7 doubt solving mentors",

    animations: Image.asset(
      "assets/images/on1.png",
      height: ScreenUtil().setHeight(height),),),
  OnboardingContent(
    title: "Be a Profi !",
    subtitle: 
    "Study Smart with the greatest teachers",

    animations: Image.asset(
      "assets/images/Nerd-amico.png",
      height: ScreenUtil().setHeight(height),),),

  OnboardingContent(
    title: "Find a Dream Job",
    subtitle: "Study with us and find a dream job",
    animations: Image.asset(
      "assets/images/Business deal-amico.png",
      height: ScreenUtil().setHeight(height),),),
];
