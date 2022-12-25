import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

import '../flashcards.dart';

class Flash extends StatelessWidget {
  final FlashCard flashCard;

  const Flash({Key ?key,required this.flashCard}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlipCard(
      direction: FlipDirection.HORIZONTAL,
      front: Container(
        padding: const EdgeInsets.all(10.0),
        height: 400,
        width: 300,
        decoration: BoxDecoration(
          color: Color(0xFF4354b3).withOpacity(0.9),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            flashCard.frontText,
            style: TextStyle(
              fontFamily: 'Quicksand',
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      back: Container(
        padding: const EdgeInsets.all(10.0),
        height: 400,
        width: 300,
        decoration: BoxDecoration(
          color: Color(0xFF4354b3).withOpacity(0.9),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            flashCard.backText,
            style: TextStyle(
              fontFamily: 'Quicksand',
              fontSize: 15,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
