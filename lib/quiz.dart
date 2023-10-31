import 'package:flutter/material.dart';
import 'cards/quizcard.dart';
import 'models/question.dart';

class QuizOverview extends StatefulWidget {
  @override
  _QuizOverviewState createState() => _QuizOverviewState();
}

class _QuizOverviewState extends State<QuizOverview> {
  List<Quiz> quizes = [
    Quiz(topic: 'Quiz 1', quizdir: 'images/json/quiz1.json'),
    Quiz(topic: 'Quiz 2', quizdir: 'images/json/quiz2.json'),
    Quiz(topic: 'Quiz 3', quizdir: 'images/json/quiz3.json'),
    Quiz(topic: 'Quiz 4', quizdir: 'images/json/quiz4.json'),
    Quiz(topic: 'Quiz 5', quizdir: 'images/json/quiz5.json'),
    Quiz(topic: 'Quiz 6', quizdir: 'images/json/quiz6.json'),
    Quiz(topic: 'Quiz 7', quizdir: 'images/json/quiz7.json'),
    Quiz(topic: 'Quiz 8', quizdir: 'images/json/quiz8.json'),
    Quiz(topic: 'Quiz 9', quizdir: 'images/json/quiz9.json'),
    Quiz(topic: 'Quiz 10', quizdir: 'images/json/quiz10.json'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color(0xFF4354b3),
          title: Text(
            'Quiz',
            style: TextStyle(
              fontFamily: 'Quicksand',
            ),
          ),
          automaticallyImplyLeading: false,
          elevation: 0,
        ),
        body: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.2,
              crossAxisSpacing: 0,
              mainAxisSpacing: 0,
            ),
            physics: BouncingScrollPhysics(),
            itemCount: quizes.length,
            itemBuilder: (context, index) => QuizCard(
                  quiz: quizes[index],
                )));
  }
}
