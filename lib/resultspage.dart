import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:line_icons/line_icons.dart';

class ResultPage extends StatefulWidget {
  final int marks;
  ResultPage({Key ?key, required this.marks}) : super(key: key);
  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  List<String> images = [
    "images/happy.svg",
    "images/sad.svg",
    "images/neutral.svg",
  ];

  String ?message;
  String ?image;

  @override
  void initState() {
    if (widget.marks < 5) {
      image = images[1];
      message = "You Should Try Hard.\n" + "You Scored ${widget.marks}/10";
    } else if (widget.marks < 7) {
      image = images[2];
      message = "You Can Do Better.\n" + "You Scored ${widget.marks}/10";
    } else {
      image = images[0];
      message = "You Did Very Well.\n" + "You Scored ${widget.marks}/10";
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFF4354b3),
        title: Text(
          'Result',
          style: TextStyle(
            fontFamily: 'Quicksand',
          ),
        ),
        automaticallyImplyLeading: false,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          children: [
            Spacer(),
            SvgPicture.asset(
              image!,
              width: 200,
              height: 150,
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Center(
                child: Text(
                  message!,
                  maxLines: 3,
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      // color: Colors.black,
                      fontFamily: 'Quicksand'),
                ),
              ),
            ),
            Spacer(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Row(
          children: [
            Text(
              "Continue",
              style: TextStyle(fontSize: 18.0, fontFamily: 'Quicksand'),
            ),
            Icon(
              LineIcons.angleRight,
              size: 25,
            ),
          ],
        ),
        elevation: 0,
        onPressed: () {
          Navigator.pop(context);
        },
        backgroundColor: Color(0xFF4354b3),
      ),
    );
  }
}
