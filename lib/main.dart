import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'notes.dart';
import 'onboard.dart';
import 'tools/verify.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'models/notesprovider.dart';
import 'notesaddpage.dart';
import 'notesview.dart';

int? intScreen;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefences = await SharedPreferences.getInstance();
  // ignore: await_only_futures
  intScreen = await prefences.getInt('intScreen');
  await prefences.setInt('intScreen', 1);
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => NoteProvider(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(primarySwatch: Colors.blue, scaffoldBackgroundColor: Colors.grey[100]),
          home: Container(
            decoration: const BoxDecoration(color: Colors.white),
            child: Center(
              child: Container(
                child: intScreen == 0 || intScreen == null ? const IntroScreen() : VerifyUser(),
              ),
            ),
          ),
          routes: {
            'homepage': (context) => const Notes(),
            'noteView': (context) => NoteView(),
            'noteEdit': (context) => const NoteEditScreen(),
          },
        ));
  }
}
