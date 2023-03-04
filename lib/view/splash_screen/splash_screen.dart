import 'package:flutter/material.dart';
import 'package:shopapp/view/constants.dart';
import 'package:shopapp/view/onbording_screen/onbording_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 3), (() {
      Navigator.push(context,
          MaterialPageRoute(builder: ((context) => OnBordingScreen())));
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Const().kprimarycolor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Image.asset('images/logo.png')),
          SizedBox(
            height: 150,
          ),
          Center(
            child: CircularProgressIndicator(color: Colors.white),
          )
        ],
      ),
    );
  }
}
