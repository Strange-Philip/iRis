import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.white,
        child: Center(
          child: Container(
            height:100,
            width: 150,
            decoration: BoxDecoration(color: Colors.white),
            child: Image.asset('images/loading.gif'),
          ),
        ),
      ),
    );
  }
}
