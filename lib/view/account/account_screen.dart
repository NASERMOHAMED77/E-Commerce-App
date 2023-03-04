// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/provider/profile_ptovider.dart';
import 'package:shopapp/view/account/account_widgets.dart';
import 'package:shopapp/view/animation/fade_animation.dart';
import 'package:shopapp/view/signin_screen/email_sign%20in/email_signin_screen.dart';
import 'package:shopapp/view/splash_screen/splash_screen.dart';

import '../constants.dart';

class AccountScreen extends StatefulWidget {
  AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<ProfileProvider>(builder: (context, provider, child) {
        return Column(
          children: [
            FadeAnimation(
              1,
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Row(
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.network(
                          provider.data['image'].toString(),
                          height: 70,
                        )),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                provider.data['name'].toString(),
                                style: Const().styletitles,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Icon(
                                Icons.edit,
                                color: Const().kprimarycolor,
                                size: 15,
                              )
                            ],
                          ),
                          Text(
                            provider.data['email'],
                            style: TextStyle(fontSize: 15, color: Colors.grey),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            FadeAnimation(
              1.2,
              child: Container(
                height: .3,
                color: Colors.grey,
              ),
            ),
            FadeAnimation(
              1.4,
              child: Account(
                text: 'Orders',
                icon: Icons.card_travel_rounded,
              ),
            ),
            FadeAnimation(
              1.6,
              child: Account(
                text: 'Delivery Address',
                icon: Icons.location_on_outlined,
              ),
            ),
            FadeAnimation(
              1.8,
              child: Account(
                text: 'Promo Code',
                icon: Icons.discount_outlined,
              ),
            ),
            FadeAnimation(
              2,
              child: Account(
                text: 'My Details',
                icon: Icons.card_travel_rounded,
              ),
            ),
            FadeAnimation(
              2.2,
              child: Account(
                text: 'Payment Methods',
                icon: Icons.payment,
              ),
            ),
            FadeAnimation(
              2.4,
              child: Account(
                text: 'Notifecations ',
                icon: Icons.notifications,
              ),
            ),
            FadeAnimation(
              2.6,
              child: Account(
                text: 'Help',
                icon: Icons.help_outline,
              ),
            ),
            FadeAnimation(
              2.8,
              child: Account(
                text: 'About ',
                icon: Icons.help,
              ),
            ),
            FadeAnimation(2.8,
                child: GestureDetector(
                  onTap: (() {
                    provider.logout(t: token!);
                    print("object");
                    if (provider.status) {
                      print(provider.status.toString());
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => EmailSignIn())));
                    }
                  }),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Container(
                      height: 70,
                      alignment: Alignment.center,
                      width: 370,
                      decoration: BoxDecoration(
                          color: Color(0xFFF2F3F2),
                          borderRadius: BorderRadius.circular(50)),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Icon(
                              Icons.logout,
                              color: Const().kprimarycolor,
                            ),
                          ),
                          SizedBox(
                            width: 80,
                          ),
                          Text(
                            "Log Out",
                            style: TextStyle(
                                color: Const().kprimarycolor,
                                fontSize: 20,
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    ),
                  ),
                ))
          ],
        );
      }),
    );
  }
}
