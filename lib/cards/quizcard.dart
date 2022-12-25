import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';


import '../models/question.dart';
import '../quizpage.dart';

class QuizCard extends StatelessWidget {
  final Quiz? quiz;

  const QuizCard({Key? key, this.quiz}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => Getjson(quiz: quiz!)));
        },
        child: Container(
          padding: const EdgeInsets.all(8.0),
          height: 70,
          width: 200,
          decoration: BoxDecoration(
            color: Color(0xFF4354b3).withOpacity(0.9),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Spacer(),
              Icon(
                LineIcons.eyeAlt,
                color: Colors.white,
              ),
              Text(
                quiz!.topic!,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Quicksand',
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                '10 questions',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Quicksand',
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
