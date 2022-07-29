import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:screen_flow/screens/home.dart';

class OnboardScreen extends StatelessWidget {
  const OnboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyAlignment: Alignment.center,
      bodyTextStyle: TextStyle(fontSize: 19.0),
      //bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imageFlex: 2,
      imageAlignment: Alignment.bottomCenter,
      imagePadding: EdgeInsets.only(top: 30),
    );
    return Scaffold(
      //appBar: AppBar(),
      body: Center(
        child: IntroductionScreen(
          scrollPhysics:
              const BouncingScrollPhysics(), //Default is BouncingScrollPhysics
          pages: [
            //List of PageViewModel
            PageViewModel(
              title: "Welcome to GymTrainer!",
              body: "It is time for you to stay fit. Let's workout.",
              image: Image.asset('images/img1.jpg'),
              decoration: pageDecoration,
            ),
            // 2nd page
            PageViewModel(
              title: "Learn techniques",
              body: "Our workout programs are made by professionals.",
              image: Image.asset('images/img2.jpg'),
              decoration: pageDecoration,
            ),
            // 3rd page
            PageViewModel(
              title: "Stay strong & Healthy",
              body: "Enjoy the program and Stay strong & positive.",
              image: Image.asset('images/img3.jpg'),
              decoration: pageDecoration,
            ),
          ],

          //If you provide both rawPages and pages parameter, pages will be used.
          onChange: (e) {
            // When something changes
          },
          onDone: () {
            // When done button is press
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (BuildContext context) {
                  return const HomePage();
                },
              ),
            );
          },
          onSkip: () {
            // You can also override onSkip callback
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (BuildContext context) {
                  return const HomePage();
                },
              ),
            );
          },
          showSkipButton: true, //Is the skip button should be display
          skip:
              const Text('Skip', style: TextStyle(fontWeight: FontWeight.w600)),
          next: const Icon(Icons.arrow_forward),
          done:
              const Text("Done", style: TextStyle(fontWeight: FontWeight.w600)),

          dotsDecorator: DotsDecorator(
              size: const Size.square(10.0),
              activeSize: const Size(20.0, 10.0),
              //activeColor: Theme.of(context).progressIndicatorTheme.color!,
              activeColor: Colors.blue,
              color: Colors.black26,
              spacing: const EdgeInsets.symmetric(horizontal: 3.0),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0))),
        ),
      ),
    );
  }
}
