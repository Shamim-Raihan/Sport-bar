import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import '../auth/login.dart';
import '../firebase_services/splash_services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashServices splashScreen = SplashServices();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashScreen.isLogin(context);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
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
          Center(
            child: SizedBox(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
              height: 200.0,
              width: 200.0,
            ),
          ),
        ],
      ),
      backgroundColor: Color(0xFF2E9E5E),
      nextScreen: const LoginScreen(),
      splashIconSize: 250,
      duration: 3000,
      splashTransition: SplashTransition.fadeTransition,
      pageTransitionType: PageTransitionType.leftToRightWithFade,
      animationDuration: const Duration(seconds: 1),
    );
  }
}
