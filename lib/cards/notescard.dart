import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

import '../models/constants.dart';
import '../models/notes.dart';

class NotesCard extends StatelessWidget {
  final Note ?note;
  const NotesCard({
    Key? key,
    this.note,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed('noteView', arguments: note!.id);
        },
        child: Container(
          height: 130,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 150,
                width: 5,
                decoration: BoxDecoration(
                  color: hexToColor(note!.color),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10)),
                ),
              ),
              SizedBox(width: 10),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Container(
                  height: 120,
                  width: 289,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 30,
                        width: double.infinity,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 250,
                              child: Text(
                                note!.title,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Quicksand',
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            Spacer(),
                            note!.imagePath == null || note!.imagePath == ""
                                ? SizedBox()
                                : Padding(
                                    padding: const EdgeInsets.only(right: 0),
                                    child: Icon(
                                      LineIcons.image,
                                      color: Color(0xFF4354b3),
                                    ),
                                  )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        // width: 270,
                        child: Text(
                          note!.content,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Quicksand',
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Spacer(),
                     
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
