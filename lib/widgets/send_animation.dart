import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sports_bar/screens/continue_screen.dart';
import 'package:sports_bar/widgets/send_animation2.dart';

class SendAnimation extends StatefulWidget {
  const SendAnimation({Key? key}) : super(key: key);

  @override
  State<SendAnimation> createState() => _SendAnimationState();
}

class _SendAnimationState extends State<SendAnimation>
    with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.7,
              width: double.infinity,
              child: Lottie.asset(
                "assets/animations/message_sent.json",
                controller: _controller,
                onLoaded: (composition) {
                  _controller
                    ..duration = composition.duration
                    ..forward();

                  Future.delayed(
                    composition.duration,
                    () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SendAnimation2(),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
