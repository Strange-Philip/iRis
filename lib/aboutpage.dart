import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFF4354b3),
        title: Text(
          'About iRis',
          style: TextStyle(
            fontFamily: 'Quicksand',
          ),
        ),
        automaticallyImplyLeading: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              child: Text(
                "iRis© App is an interactive ocular anatomy and physiology instant resource for students and practitioners. The App is an unparalleled source knowledge, providing immediate access to detailed notes from students in a simple language for easy understanding. It combines interactive pictures and systematic arrangement and orderly presentation of ideas. iRis makes Ocular Physiology and Anatomy easy and enjoyable to study",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Quicksand'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              child: Text(
                "A project work in partial fulfilment of the course, OPT234: OCULAR PHYSIOLOGY.",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Quicksand'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              child: Text(
                "This App was a project work for the course, “Ocular Physiology”, supervised by Dr. Carl Halladay Abraham for second year Optometry students in the Department of Optometry, University of Cape Coast, Ghana.",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Quicksand'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              child: Text(
                "The Team Members are;  \n1.	Paul Owusu   \n2.	Philip Abakah Mensah  \n3.	Esthella Yeadoo  \n4.	Gideon Datsomor  \n5.	Seyram Afi Tunyo",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Quicksand'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: Text(
                  "©iRis App, 2021",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Quicksand'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
