import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'htmlContent.dart';

class Topic {
  final String name;
  final String time;
  final String pdf;
  final Icon icon;

  Topic(
    this.name,
    this.time,
    this.pdf,
    this.icon,
  );
}

class CourseCard extends StatefulWidget {
  final Topic topic;

  const CourseCard({Key ?key,required this.topic}) : super(key: key);

  @override
  _CourseCardState createState() => _CourseCardState();
}

class _CourseCardState extends State<CourseCard> {
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => ViewHTML(
                        topic: widget.topic,
                      )));
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
          height: 120,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xFF4354b3),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: widget.topic.icon,
              ),
              Spacer(),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                child: Text(
                  widget.topic.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: 'Quicksand',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  child: Row(
                    children: [
                      Icon(LineIcons.clock, color: Colors.white, size: 18),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        widget.topic.time,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Quicksand',
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
