// ignore_for_file: prefer_const_constructors, must_be_immutable, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/view/animation/fade_animation.dart';

import 'package:shopapp/view/constants.dart';
import 'package:shopapp/view/home_page/hom_page_screen.dart';
import 'package:shopapp/view/signin_screen/shared.dart';

import '../../../provider/auth_provider.dart';

class EmailSignUP extends StatelessWidget {
  TextEditingController emailconttrolar = TextEditingController();
  TextEditingController passconttrolar = TextEditingController();
  TextEditingController unameconttrolar = TextEditingController();
  TextEditingController phoneconttrolar = TextEditingController();

  EmailSignUP({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            backgroundColor: Const().kprimarycolor,
            child: Icon(Icons.keyboard_arrow_right_sharp),
            onPressed: (() {})),
        body: Stack(
          children: [
            Image.asset('images/background.png'),
            Container(
              height: double.infinity,
              width: double.infinity,
              color: Colors.white.withOpacity(.92),
              child: SingleChildScrollView(
                child: Consumer<Auth>(builder: (context, provider, _) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      FadeAnimation(
                        1,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(Icons.arrow_back_ios_new),
                        ),
                      ),
                      FadeAnimation(
                        1.3,
                        child: Center(
                          child: Image.asset('images/mainlogo.png'),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      FadeAnimation(
                        1.6,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            '''Sign Up''',
                            style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.w600,
                                wordSpacing: 1.5),
                          ),
                        ),
                      ),
                      FadeAnimation(
                        1.8,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8, left: 16),
                          child: Text(
                            'Enter your credentials to continue',
                            style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      FadeAnimation(2,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 30, left: 16),
                            child: Text(
                              'User name',
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500),
                            ),
                          )),
                      FadeAnimation(
                        2.2,
                        child: DefultField(
                          inputType: TextInputType.text,
                          controller: unameconttrolar,
                          text: 'Enter your name',
                        ),
                      ),
                      FadeAnimation(
                        2.4,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 30, left: 16),
                          child: Text(
                            'Phone',
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 20,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      FadeAnimation(
                        2.6,
                        child: DefultField(
                          inputType: TextInputType.text,
                          controller: phoneconttrolar,
                          text: 'Enter your phone',
                        ),
                      ),
                      FadeAnimation(
                        2.8,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 30, left: 16),
                          child: Text(
                            'Email',
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 20,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      FadeAnimation(
                        3,
                        child: DefultField(
                          controller: emailconttrolar,
                          inputType: TextInputType.emailAddress,
                          text: 'Enter your email',
                        ),
                      ),
                      FadeAnimation(
                        3.2,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 30, left: 16),
                          child: Text(
                            'PassWord',
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 20,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      FadeAnimation(
                        3.6,
                        child: DefultField(
                          controller: passconttrolar,
                          inputType: TextInputType.visiblePassword,
                          text: 'Enter your password',
                        ),
                      ),
                      FadeAnimation(
                        3.8,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 16, left: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                '''By continuing you agree to our  ''',
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                'terms of Service',
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Const().kprimarycolor,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                      ),
                      FadeAnimation(
                        4,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 8, left: 16, bottom: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                '''and  ''',
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                'Privacy Policy',
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Const().kprimarycolor,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                      ),
                      FadeAnimation(
                        4.2,
                        child: Center(
                            child: GestureDetector(
                                onTap: (() {
                                  provider.register(
                                      email: emailconttrolar.text,
                                      password: passconttrolar.text,
                                      phone: phoneconttrolar.text,
                                      name: unameconttrolar.text);
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: ((context) =>
                                  //             HomePageScreen())));
                                }),
                                child: AppButton(text: "Sign Up"))),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      FadeAnimation(4.4,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Already have an account? ",
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w600),
                              ),
                              Text(
                                'Sign in',
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Const().kprimarycolor,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ))
                    ],
                  );
                }),
              ),
            )
          ],
        ));
  }
}
