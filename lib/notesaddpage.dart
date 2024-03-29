import 'dart:io';
import 'package:fast_color_picker/fast_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:line_icons/line_icons.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'models/constants.dart';
import 'models/notes.dart';
import 'models/notesprovider.dart';

class NoteEditScreen extends StatefulWidget {
  const NoteEditScreen({
    Key? key,
  }) : super(key: key);
  @override
  _NoteEditScreenState createState() => _NoteEditScreenState();
}

class _NoteEditScreenState extends State<NoteEditScreen> {
  File? _image;
  final picker = ImagePicker();
  final titleController = TextEditingController();
  final contentController = TextEditingController();
  bool firstTime = true;
  Note? selectedNote;
  bool coloron = false;

  Color _color = Color(0xFF4354b3);
  var id;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (firstTime) {
      id = ModalRoute.of(this.context)!.settings.arguments;
      if (id != null) {
        selectedNote = Provider.of<NoteProvider>(this.context, listen: false).getNote(id);

        titleController.text = selectedNote!.title;
        contentController.text = selectedNote!.content;
        _color = hexToColor(selectedNote!.color);
        if (selectedNote?.imagePath != null) {
          _image = File(selectedNote!.imagePath);
        }
      }
    }
    firstTime = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: Theme.of(context).iconTheme,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        leading: IconButton(
            icon: Icon(LineIcons.times, color: Colors.black),
            onPressed: () {
              Navigator.pop(context);
            }),
        actions: [
          IconButton(
              icon: Icon(LineIcons.palette, color: _color),
              onPressed: () {
                setState(() {
                  coloron = !coloron;
                });
              }),
          IconButton(
              icon: Icon(LineIcons.image, color: Colors.black),
              onPressed: () {
                getImage(ImageSource.gallery);
              }),
          IconButton(
              icon: Icon(LineIcons.camera, color: Colors.black),
              onPressed: () {
                getImage(ImageSource.camera);
              }),
          IconButton(
              icon: Icon(LineIcons.trash, color: Colors.black),
              onPressed: () {
                if (id != null) {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          // title: Text('Error'),
                          content: Text(
                            "Sure you want to delete note?",
                            style: TextStyle(
                                // color: Colors.black,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Quicksand'),
                          ),
                          actions: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: TextButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                                ),
                                child: Text(
                                  'No',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'Quicksand'),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pop(true);
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 15.0),
                              child: SizedBox(
                                width: 100.0,
                                child: TextButton(
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(Color(0xFF4354b3)),
                                  ),
                                  child: Text(
                                    'Yes',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14.0,
                                        fontFamily: 'Quicksand'),
                                  ),
                                  onPressed: () async {
                                    Navigator.pop(context);
                                    await Provider.of<NoteProvider>(context, listen: false)
                                        .deleteNote(selectedNote!.id);
                                    Navigator.pop(context);
                                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                      elevation: 0,
                                      content: const Text('Note Deleted'),
                                      duration: const Duration(seconds: 2),
                                      backgroundColor: Colors.green,
                                      behavior: SnackBarBehavior.floating,
                                    ));
                                  },
                                ),
                              ),
                            ),
                          ],
                        );
                      });
                } else {
                  Navigator.pop(context);
                }
              }),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        elevation: 0,
        onPressed: () {
          if (titleController.text.isEmpty) {
            titleController.text = "Untitled Note";
            saveNote(id);
          } else {
            saveNote(id);
          }
        },
        backgroundColor: _color,
        label: Row(
          children: [
            Text(
              'Add',
              style: TextStyle(fontFamily: 'Quicksand', fontWeight: FontWeight.w500, fontSize: 20),
            ),
            Icon(
              LineIcons.plus,
              color: Colors.white,
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: TextFormField(
              cursorColor: Color(0xFF4354b3),
              controller: titleController,
              maxLines: null,
              textCapitalization: TextCapitalization.sentences,
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                  color: Colors.black45,
                  fontFamily: 'Quicksand'),
              decoration: InputDecoration(
                hintText: "Enter Note Title",
                border: InputBorder.none,
                hintStyle: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    color: Colors.black45,
                    fontFamily: 'Quicksand'),
              ),
            ),
          ),
          if (_image != null)
            Container(
              padding: EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width,
              height: 200,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(image: FileImage(_image!), fit: BoxFit.cover)),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFF4354b3),
                        ),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              _image = null;
                            });
                          },
                          child: Icon(
                            LineIcons.trash,
                            // color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          coloron == true
              ? Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2, vertical: 5),
                  child: Center(
                    child: FastColorPicker(
                      selectedColor: _color,
                      onColorSelected: (color) {
                        setState(() {
                          _color = color;
                          coloron = !coloron;
                        });
                      },
                    ),
                  ),
                )
              : SizedBox(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: TextField(
              cursorColor: Color(0xFF4354b3),
              controller: contentController,
              maxLines: null,
              textCapitalization: TextCapitalization.sentences,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.black45,
                  fontFamily: 'Quicksand'),
              decoration: InputDecoration(
                hintText: "Enter Something...",
                border: InputBorder.none,
                hintStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.black45,
                    fontFamily: 'Quicksand'),
              ),
            ),
          ),
          if (_image == null)
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.4,
            )
          else
            SizedBox(
              height: 60,
            ),
        ],
      )),
    );
  }

  @override
  void dispose() {
    titleController.dispose();
    contentController.dispose();
    super.dispose();
  }

  getImage(ImageSource imageSource) async {
    PickedFile? imageFile = await picker.getImage(source: imageSource);
    if (imageFile == null) return;
    File tempFile = File(imageFile.path);
    final appDir = await getApplicationDocumentsDirectory();
    final fileName = basename(imageFile.path);

    tempFile = await tempFile.copy('${appDir.path}/$fileName');
    setState(() {
      _image = tempFile;
    });
  }

  void saveNote(id) {
    print('done');
    String title = titleController.text.trim();
    String content = contentController.text.trim();
    String? imagePath = _image != null ? _image!.path : null;
    int isAchived = 0;
    Color color = _color;

    print('done');
    print(title);
    print(content);
    print("checking : ${color.value.toRadixString(16)}");
    if (id != null) {
      Provider.of<NoteProvider>(this.context, listen: false).addOrUpdateNote(id, title, content,
          imagePath!, color.value.toRadixString(16), isAchived, EditMode.UPDATE);
      Navigator.pop(this.context);
      ScaffoldMessenger.of(this.context).showSnackBar(SnackBar(
        elevation: 0,
        content: const Text('Note Edited'),
        duration: const Duration(seconds: 2),
        backgroundColor: Colors.green,
        behavior: SnackBarBehavior.floating,
      ));
    } else {
      int id = DateTime.now().microsecondsSinceEpoch;
      print('done');
      Provider.of<NoteProvider>(this.context, listen: false).addOrUpdateNote(
          id, title, content, imagePath!, color.value.toRadixString(16), isAchived, EditMode.ADD);
      print('doneNow');
      // Navigator.of(this.context)
      //     .pushReplacementNamed('homepage', arguments: id);
      Navigator.pop(this.context);
      ScaffoldMessenger.of(this.context).showSnackBar(SnackBar(
        elevation: 0,
        content: const Text('Note Added'),
        duration: const Duration(seconds: 2),
        backgroundColor: Colors.green,
        behavior: SnackBarBehavior.floating,
      ));
      print("Complete");
    }
  }
}
