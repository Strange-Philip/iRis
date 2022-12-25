import 'package:fluid_bottom_nav_bar/fluid_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import '../home.dart';
import '../notes.dart';
import '../quiz.dart';
import '../set.dart';

class BtnNavbar extends StatefulWidget {
  @override
  _BtnNavbarState createState() => _BtnNavbarState();
}

class _BtnNavbarState extends State<BtnNavbar> {
  int _currentIndex = 0;
  final List<Widget> _children = [Home(), Notes(), QuizOverview(), Setttings()];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        body: _children[_currentIndex],
        bottomNavigationBar: FluidNavBar(
          animationFactor:0.9,
          onChange: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          defaultIndex: _currentIndex,
          style: FluidNavBarStyle(
              // iconBackgroundColor: Color(0xFF4354b3),
              barBackgroundColor: Color(0xFF4354b3),
              iconSelectedForegroundColor: Colors.white,
              iconUnselectedForegroundColor: Colors.white),
          icons: [
            FluidNavBarIcon(icon: LineIcons.home,
                // backgroundColor: Colors.white,
                // selectedForegroundColor: Color(0xFF4354b3),
                extras: {"label": "home"}),
            FluidNavBarIcon(icon: LineIcons.stickyNote,
                // backgroundColor: Color(0xFF4354b3),
                extras: {"label": "notes"}),
            FluidNavBarIcon(icon: LineIcons.question,
                // backgroundColor: Color(0xFF4354b3),
                extras: {"label": "quiz"}),
            FluidNavBarIcon(icon: LineIcons.bars,
              //  selectedForegroundColor: Color(0xFF4354b3),
                extras: {"label": "profile"}),
          ],
        ),
      ),
    );
  }
}
