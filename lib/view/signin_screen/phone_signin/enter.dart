// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:shopapp/view/constants.dart';
import 'package:shopapp/view/signin_screen/email_sign%20in/email_signin_screen.dart';

class EnterScreen extends StatelessWidget {
  const EnterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            backgroundColor: Const().kprimarycolor,
            child: Icon(Icons.keyboard_arrow_right_sharp),
            onPressed: (() {
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => EmailSignIn())));
            })),
        body: Stack(
          children: [
            Image.asset('images/background.png'),
            Container(
              height: double.infinity,
              width: double.infinity,
              color: Colors.white.withOpacity(.92),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.arrow_back_ios_new),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      '''Enter your mobile number''',
                      style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w600,
                          wordSpacing: 1.5),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8, left: 16),
                    child: Text(
                      'Mobile Number',
                      style: TextStyle(
                          color: Colors.black54, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextFormField(
                      onSaved: (newValue) {},
                      decoration: InputDecoration(
                        prefixIcon: CountryCodePicker(
                          initialSelection: '+20',
                          onChanged: (value) {},
                        ),
                      ),
                      keyboardType: TextInputType.phone,
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
