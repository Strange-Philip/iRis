import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'tools/verify.dart';
import 'package:nice_intro/nice_intro.dart';

class IntroductionScreen extends StatefulWidget {
  const IntroductionScreen({Key? key}) : super(key: key);

  @override
  State<IntroductionScreen> createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {
  @override
  Widget build(BuildContext context) {
    var screens = IntroScreens(
      onDone: () => Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => VerifyUser())),
      onSkip: () => print('Skipping the intro slides'),
      footerBgColor: const Color(0xFF4354b3),
      activeDotColor: Colors.white,
      skipText: "skip",
      footerRadius: 20.0,
      doneWidget: const Icon(
        Icons.check,
        color: Colors.white,
        size: 30,
      ),
      nextWidget: const Icon(
        Icons.arrow_forward_ios,
        color: Colors.white,
        size: 30,
      ),
      indicatorType: IndicatorType.LINE,
      slides: [
        IntroScreen(
          title: 'Quick and Easy Learning',
          imageAsset: 'images/intro.png',
          description:
              'Get all resources and the notes for Ocular Physiology with simple diagrams at one place.',
          headerBgColor: Colors.white,
          textStyle: const TextStyle(
            color: Color(0xFF4354b3),
            fontSize: 20.0,
            fontWeight: FontWeight.w600,
            fontFamily: 'Quicksand',
          ),
        ),
        IntroScreen(
          title: 'My simple notes',
          headerBgColor: Colors.white,
          imageAsset: 'images/notes.png',
          description:
              "Get simple notes and definitions placed on cards for easy studies.",
          textStyle: const TextStyle(
            color: Color(0xFF4354b3),
            fontSize: 20.0,
            fontWeight: FontWeight.w600,
            fontFamily: 'Quicksand',
          ),
        ),
        IntroScreen(
          title: 'Try Flashcards',
          headerBgColor: Colors.white,
          imageAsset: 'images/flashcards.png',
          description:
              "Get simple notes and definitions placed on cards for easy studies.",
          textStyle: const TextStyle(
            color: Color(0xFF4354b3),
            fontSize: 20.0,
            fontWeight: FontWeight.w600,
            fontFamily: 'Quicksand',
          ),
        ),
        IntroScreen(
          title: 'Test yourself with quizes',
          headerBgColor: Colors.white,
          imageAsset: 'images/quizes.png',
          description:
              "There are quizes based on each topic you can try out.Our quizes are multiple choice question. ",
          textStyle: const TextStyle(
            color: Color(0xFF4354b3),
            fontSize: 20.0,
            fontWeight: FontWeight.w600,
            fontFamily: 'Quicksand',
          ),
        ),
      ],
    );

    return Scaffold(
      extendBodyBehindAppBar: true,
      body: screens,
    );
  }
}
