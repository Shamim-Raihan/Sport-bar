import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sports_bar/widgets/color.dart';
import 'package:sports_bar/widgets/splash_screen.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: primaryBlack,
          ),
          home: AnimatedSplashScreen(
            splash: Stack(
              children: [
                Center(
                  child: Image(
                    image: AssetImage('assets/images/splashmain.png'),
                    height: 250,
                    width: 250.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
            backgroundColor: Color(0xFF2E9E5E),
            nextScreen: const SplashScreen(),
            splashIconSize: 250,
            duration: 3000,
            splashTransition: SplashTransition.fadeTransition,
            pageTransitionType: PageTransitionType.leftToRightWithFade,
            animationDuration: const Duration(seconds: 1),
          ),
        );
      },
    );
  }
}
