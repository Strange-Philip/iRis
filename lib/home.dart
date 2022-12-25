import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'cards/coursecards.dart';
import 'flashcards.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

String greetingMessage() {
  var timeNow = DateTime.now().hour;

  if (timeNow <= 12) {
    return 'Good Morning';
  } else if ((timeNow > 12) && (timeNow <= 18)) {
    return 'Good Afternoon';
  } else if ((timeNow > 18) && (timeNow < 22)) {
    return 'Good Evening';
  } else {
    return 'Goodnight';
  }
}

class _HomeState extends State<Home> {
  String greetingMes = greetingMessage();
  String ?name;
  List<Topic> topics = [
    Topic(
      'The Eyeball',
      "30 mins",
      'images/pdf/Eyeball.html',
      const Icon(
        LineIcons.eye,
        color: Colors.white,
        size: 28,
      ),
    ),
    Topic(
      'The Bony Orbit',
      "1 hour",
      'images/pdf/Bony Orbit.html',
      const Icon(
        LineIcons.brain,
        color: Colors.white,
        size: 28,
      ),
    ),
    Topic(
      'Orbital Contents',
      "45 minutes",
      'images/pdf/Orbital Contents.html',
      const Icon(
        LineIcons.bone,
        color: Colors.white,
        size: 28,
      ),
    ),
    Topic(
      'Eyelid',
      "45 minutes",
      'images/pdf/Eyelid.html',
      const Icon(
        LineIcons.eye,
        color: Colors.white,
        size: 28,
      ),
    ),
    Topic(
      'Lacrimal System',
      "1 hour 30 mins",
      'images/pdf/Lacrimal System.html',
      const Icon(
        LineIcons.glasses,
        color: Colors.white,
        size: 28,
      ),
    ),
    Topic(
      'Cornea And Sclera',
      "1 hour",
      'images/pdf/Cornea & Sclera.html',
      const Icon(
        LineIcons.stethoscope,
        color: Colors.white,
        size: 28,
      ),
    ),
    Topic(
      'Aqueous Humour',
      "2 hours",
      'images/pdf/Aqueous.html',
      const Icon(
        LineIcons.water,
        color: Colors.white,
        size: 28,
      ),
    ),
    Topic(
      'Crystalline Lens',
      "1 hour 30 mins",
      'images/pdf/Crystalline Lens.html',
      const Icon(
        LineIcons.glasses,
        color: Colors.white,
        size: 28,
      ),
    ),
    Topic(
      'Extraocular Muscles',
      "45 minutes",
      'images/pdf/Extraocular Muscles.html',
      const Icon(
        LineIcons.brain,
        color: Colors.white,
        size: 28,
      ),
    ),
    Topic(
      'Vitreous Humour',
      "30 minutes",
      'images/pdf/Vitreous Humor.html',
      const Icon(
        LineIcons.water,
        color: Colors.white,
        size: 28,
      ),
    ),
    Topic(
      'Retina',
      "3 hours",
      'images/pdf/Retina.html',
      const Icon(
        LineIcons.lowVision,
        color: Colors.white,
        size: 28,
      ),
    ),
    Topic(
      'Cranial Nerves',
      "30 minutes",
      'images/pdf/Cranial Nerves.html',
      const Icon(
        LineIcons.brain,
        color: Colors.white,
        size: 28,
      ),
    ),
  ];
  Future<String> getname() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? prefname = prefs.getString('name');
    print(prefname);
    return prefname!;
  }

  @override
  void initState() {
    super.initState();
    getname().then((value) => setState(() {
          this.name = value;
        }));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        elevation: 0,
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (BuildContext context) => FlashCards()));
            },
            child: Image.asset(
              'images/sticky.png',
              color: const Color(0xFF4354b3),
              width: 35,
              height: 35,
            ),
          ),
          const SizedBox(
            width: 10,
          )
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
              child: Text(
                greetingMes + ' $name',
                textAlign: TextAlign.left,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 26,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Quicksand'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Container(
                height: 140 * topics.length / 1,
                child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: topics.length,
                    itemBuilder: (context, index) {
                      return CourseCard(
                        topic: topics[index],
                      );
                      // return ViewHTML();
                    }),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
