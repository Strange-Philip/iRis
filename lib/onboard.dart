import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'tools/verify.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    var screens = IntroductionScreen(
      onDone: () =>
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => VerifyUser())),
      onSkip: () => print('Skipping the intro slides'),
      // footerBgColor: const Color(0xFF4354b3),
      // activeDotColor: Colors.white,
      skip: Text("skip"),
      done: const Icon(
        Icons.check,
        color: Colors.white,
        size: 30,
      ),
      next: const Icon(
        Icons.arrow_forward_ios,
        color: Colors.white,
        size: 30,
      ),
      pages: [
        PageViewModel(
          title: 'Quick and Easy Learning',
          image: Image.asset('images/intro.png'),
          body:
              'Get all resources and the notes for Ocular Physiology with simple diagrams at one place.',
          // headerBgColor: Colors.white,
          // textStyle: const TextStyle(
          //   color: Color(0xFF4354b3),
          //   fontSize: 20.0,
          //   fontWeight: FontWeight.w600,
          //   fontFamily: 'Quicksand',
          // ),
        ),
        PageViewModel(
          title: 'My simple notes',
          // headerBgColor: Colors.white,
          image: Image.asset('images/notes.png'),
          body: "Get simple notes and definitions placed on cards for easy studies.",
          // textStyle: const TextStyle(
          //   color: Color(0xFF4354b3),
          //   fontSize: 20.0,
          //   fontWeight: FontWeight.w600,
          //   fontFamily: 'Quicksand',
          // ),
        ),
        PageViewModel(
          title: 'Try Flashcards',
          // headerBgColor: Colors.white,
          image: Image.asset('images/flashcards.png'),
          body: "Get simple notes and definitions placed on cards for easy studies.",
          // textStyle: const TextStyle(
          //   color: Color(0xFF4354b3),
          //   fontSize: 20.0,
          //   fontWeight: FontWeight.w600,
          //   fontFamily: 'Quicksand',
          // ),
        ),
        PageViewModel(
          title: 'Test yourself with quizes',
          // headerBgColor: Colors.white,
          image: Image.asset('images/quizes.png'),
          body:
              "There are quizes based on each topic you can try out.Our quizes are multiple choice question. ",
          // textStyle: const TextStyle(
          //   color: Color(0xFF4354b3),
          //   fontSize: 20.0,
          //   fontWeight: FontWeight.w600,
          //   fontFamily: 'Quicksand',
          // ),
        ),
      ],
    );

    return Scaffold(
      extendBodyBehindAppBar: true,
      body: screens,
    );
  }
}
