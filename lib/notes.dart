import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iris/cards/notescard.dart';
import 'package:iris/tools/loading.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';

import 'models/notesprovider.dart';

class Notes extends StatefulWidget {
  const Notes({super.key});

  @override
  _NotesState createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  @override
  void initState() {
    Provider.of<NoteProvider>(context, listen: false).getNotes();
    super.initState();
  }

  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Provider.of<NoteProvider>(context, listen: false).getNotes(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Loading();
          } else if (snapshot.connectionState == ConnectionState.done) {
            return Scaffold(
              appBar: AppBar(
                centerTitle: true,
                backgroundColor: Color(0xFF4354b3),
                title: Text(
                  'Notes',
                  style: TextStyle(
                    fontFamily: 'Quicksand',
                  ),
                ),
                automaticallyImplyLeading: false,
                elevation: 0,
                actions: [
                  IconButton(
                      icon: Icon(LineIcons.plus, color: Colors.white),
                      onPressed: () {
                        Navigator.of(context).pushNamed('noteEdit');
                      }),
                ],
              ),
              body: Consumer<NoteProvider>(
                builder: (context, noteprovider, child) => noteprovider.items.isEmpty
                    ? SizedBox()
                    : ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: noteprovider.items.length + 1,
                        itemBuilder: (context, index) {
                          if (index == 0) {
                            return Container();
                          } else {
                            // SizedBox(height: 30,);
                            final i = index - 1;
                            final item = noteprovider.items[i];
                            return NotesCard(
                              note: item,
                            );
                          }
                        }),
                child: Center(
                  child: Column(
                    children: [
                      Spacer(),
                      SvgPicture.asset(
                        "images/flashcards.svg",
                        width: 200,
                        height: 150,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                        child: Text(
                          "No Notes Yet \nTap on the Plus Icon to add notes",
                          maxLines: 5,
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                              // color: Colors.black,
                              fontFamily: 'Quicksand'),
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                ),
              ),
            );
          }
          return Container();
        });
  }
}
