// ignore_for_file: prefer_const_constructors, file_names

import 'package:flutter/material.dart';
import 'package:shopapp/view/animation/fade_animation.dart';
import 'package:shopapp/view/signin_screen/phone_signin/enter.dart';
import 'package:shopapp/view/signin_screen/shared.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FadeAnimation(
              1,
              child: Image.asset('images/background.png'),
            ),
            FadeAnimation(
              1.3,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '''Get your groceries
with nectar''',
                  style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w600,
                      wordSpacing: 1.5),
                ),
              ),
            ),
            SizedBox(
              height: 35,
            ),
            FadeAnimation(
              1.4,
              child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => EnterScreen())));
                  },
                  child: Center(child: Image.asset('images/text.png'))),
            ),
            SizedBox(
              height: 50,
            ),
            FadeAnimation(
              1.6,
              child: Center(
                child: Text(
                  "Or connect with social media",
                  style: TextStyle(
                      fontWeight: FontWeight.w200,
                      color: Colors.grey,
                      fontSize: 16),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Column(
                children: [
                  FadeAnimation(
                    1.6,
                    child: SignButton(
                      color: Color(0xFF5383EC),
                      text: "Continue with Google",
                      navigate: '',
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  FadeAnimation(
                    1.9,
                    child: SignButton(
                      color: Color(0xFF4A66AC),
                      text: "Continue with FaceBook",
                      navigate: '',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
