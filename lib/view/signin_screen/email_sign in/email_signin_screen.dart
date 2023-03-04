// ignore_for_file: public_member_api_docs, sort_constructors_first, sort_child_properties_last
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/provider/auth_provider.dart';
import 'package:shopapp/view/animation/fade_animation.dart';

import 'package:shopapp/view/constants.dart';
import 'package:shopapp/view/home_page/hom_page_screen.dart';
import 'package:shopapp/view/signin_screen/email_signup/email_sginup_screen.dart';
import 'package:shopapp/view/signin_screen/shared.dart';

// ignore: must_be_immutable
class EmailSignIn extends StatelessWidget {
  TextEditingController emailconttrolar = TextEditingController();
  TextEditingController passconttrolar = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  EmailSignIn({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
      key: _formKey,
      child: Consumer<Auth>(builder: (context, provider, _) {
        return Stack(
          children: [
            Image.asset('images/background.png'),
            Container(
              height: double.infinity,
              width: double.infinity,
              color: Colors.white.withOpacity(.92),
              child: SingleChildScrollView(
                child: Column(
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
                    FadeAnimation(1.6,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            '''Login''',
                            style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.w600,
                                wordSpacing: 1.5),
                          ),
                        )),
                    FadeAnimation(
                      1.9,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8, left: 16),
                        child: Text(
                          'Enter your email and password',
                          style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    FadeAnimation(
                      2,
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
                      2.1,
                      child: DefultField(
                        inputType: TextInputType.emailAddress,
                        controller: emailconttrolar,
                        text: 'Enter Your Email',
                      ),
                    ),
                    FadeAnimation(
                      2.2,
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
                      2.3,
                      child: DefultField(
                        inputType: TextInputType.visiblePassword,
                        controller: passconttrolar,
                        text: 'Enter Your Password',
                      ),
                    ),
                    FadeAnimation(
                      2.5,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: InkWell(
                          onTap: () {
                            // Navigator.push(context, MaterialPageRoute(builder: ((context) => )));
                          },
                          child: Text(
                            'Forgot Password',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ),
                    FadeAnimation(
                      2.7,
                      child: Center(
                          child: GestureDetector(
                              onTap: (() {
                                if (_formKey.currentState!.validate()) {
                                  provider.login(
                                      email: emailconttrolar.text,
                                      password: passconttrolar.text);
                                  if (provider.x == false) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: ((context) =>
                                                HomePageScreen())));
                                  }
                                }
                              }),
                              child: AppButton(text: "Sign In"))),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    FadeAnimation(2.9,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don't have an account? ",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w600),
                            ),
                            InkWell(
                              onTap: (() {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: ((context) => EmailSignUP())));
                              }),
                              child: Text(
                                'Sign Up',
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Const().kprimarycolor,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ],
                        ))
                  ],
                ),
              ),
            )
          ],
        );
      }),
    ));
  }
}
