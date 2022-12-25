import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iris/tools/btnbar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddName extends StatefulWidget {
  const AddName({super.key});

  @override
  State<AddName> createState() => _AddNameState();
}

class _AddNameState extends State<AddName> {
  final _formkey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FormBuilder(
        key: _formkey,
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          children: [
            const SizedBox(
              height: 200,
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(
                  'images/welcome.svg',
                  width: 200,
                  height: 250,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Text(
                  'Welcome to iRis, your Ocular Physiology guide.',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 26,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Quicksand'),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              child: Text(
                'Please enter your name',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Quicksand'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Container(
                  margin: const EdgeInsets.only(left: 4, right: 20),
                  child: FormBuilderTextField(
                    name: 'name',
                    decoration: const InputDecoration(hintText: 'First Name'),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    keyboardType: TextInputType.text,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(context,
                          errorText: "First name is required "),
                    ]),
                  )),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: const Color(0xFF4354b3),
        onPressed: () async {
          if (_formkey.currentState!.validate()) {
            _formkey.currentState!.save();
            print(_formkey.currentState!.value['name']);
            SharedPreferences prefs = await SharedPreferences.getInstance();
            prefs.setString('name', _formkey.currentState!.value['name']);
            prefs.setBool('isLoggin', true);
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (_) => BtnNavbar()));
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('Welcome ${_formkey.currentState!.value['name']}',
                  style: const TextStyle(
                      fontFamily: 'Quicksand',
                      fontWeight: FontWeight.w500,
                      fontSize: 18)),
              duration: const Duration(seconds: 3),
              backgroundColor: Colors.green,
              elevation: 0,
              behavior: SnackBarBehavior.floating,
            ));
          }
        },
        elevation: 0,
        icon: const Icon(
          LineIcons.angleRight,
          color: Colors.white,
        ),
        label: const Text(
          'Go',
          style: TextStyle(
              fontFamily: 'Quicksand',
              fontWeight: FontWeight.w500,
              fontSize: 20),
        ),
      ),
    );
  }
}
