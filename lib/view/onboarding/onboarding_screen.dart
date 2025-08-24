import 'package:flutter/material.dart';
import 'package:teacherz/constant/colors.dart';
import 'package:teacherz/view/onboarding/constant/onboarding_content.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:animate_do/animate_do.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final _controller = PageController();
  int _currentPage = 0;

  bool lastPage = false;
  void setState(fn) {
    lastPage = _currentPage == 2;
    super.setState(fn);
  }

  AnimatedContainer _buildDots({int? index}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.only(right: 5),
      height: 10,
      width: _currentPage == index ? 20 : 10,
      decoration: BoxDecoration(
        color:
            _currentPage == index
                ? kPrimaryColor
                : kPrimaryLight.withOpacity(0.45),
        borderRadius: BorderRadius.circular(50),
      ),
      curve: Curves.easeIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              flex: 3,
              child: PageView.builder(
                controller: _controller,
                onPageChanged: (val) {
                  setState(() {
                    _currentPage = val;
                  });
                },
                itemCount: contents.length,
                itemBuilder: (context, i) {
                  return Container(
                    color: Colors.transparent,
                    child: Padding(
                      padding: const EdgeInsets.all(40.0),
                      child: Column(
                        children: [
                          SizedBox(height: ScreenUtil().setHeight(30)),
                          contents[i].animations,
                          SizedBox(
                            height:
                                (height >= 840)
                                    ? ScreenUtil().setHeight(60)
                                    : ScreenUtil().setHeight(80),
                          ),
                          Text(
                            contents[i].title,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: kTextColor,
                              fontSize: ScreenUtil().setHeight(25),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: ScreenUtil().setHeight(22)),
                          Text(
                            contents[i].subtitle,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: ScreenUtil().setHeight(18),
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        contents.length,
                        (int index) => _buildDots(index: index),
                      ),
                    ),
                  ),
                  _currentPage + 1 == contents.length
                      ? Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: FadeInRight(
                          duration: const Duration(milliseconds: 300),
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: kPrimaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24),
                              ),
                              padding:
                                  (width >= 550)
                                      ? const EdgeInsets.symmetric(
                                        horizontal: 100,
                                        vertical: 20,
                                      )
                                      : EdgeInsets.symmetric(
                                        vertical: 25,
                                        horizontal: width * 0.24,
                                      ),
                              textStyle: TextStyle(
                                fontSize: (width >= 550) ? 13 : 17,
                              ),
                            ),
                            child: Text(
                              'Get Started',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: ScreenUtil().setHeight(18),
                              ),
                            ),
                          ),
                        ),
                      )
                      : Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                              onPressed: () {
                                _controller.jumpToPage(2);
                              },
                              style: TextButton.styleFrom(
                                elevation: 0, ///////
                                textStyle: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: (width >= 550) ? 13 : 17,
                                ),
                              ),
                              child: Text(
                                'Skip',
                                style: TextStyle(
                                  color: kPrimaryColor,
                                  fontSize: ScreenUtil().setHeight(18),
                                ),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                _controller.nextPage(
                                  duration: Duration(milliseconds: 200),
                                  curve: Curves.easeIn, ///////
                                );
                              },
                                style: ElevatedButton.styleFrom(
                              backgroundColor: kPrimaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(70),
                              ),
                              elevation: 0,/////////
                              padding:
                                  (width >= 550)
                                      ? const EdgeInsets.symmetric(
                                        horizontal: 100,
                                        vertical: 20,
                                      )
                                      : EdgeInsets.symmetric(
                                        vertical: 25,
                                        horizontal: width * 0.24,
                                      ),
                              textStyle: TextStyle(
                                fontSize: (width >= 550) ? 13 : 17,
                              ),
                            ),
                              child: Icon(Icons.arrow_forward_ios_rounded,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
