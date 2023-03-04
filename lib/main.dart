// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/model/local/cachenetwork.dart';
import 'package:shopapp/provider/auth_provider.dart';
import 'package:shopapp/provider/cart_provider.dart';
import 'package:shopapp/provider/fav_provider.dart';
import 'package:shopapp/provider/get_products.dart';
import 'package:shopapp/provider/profile_ptovider.dart';
import 'package:shopapp/provider/search_provider.dart';
import 'package:shopapp/view/constants.dart';
import 'package:shopapp/view/home_page/hom_page_screen.dart';
import 'package:shopapp/view/onbording_screen/onbording_screen.dart';
import 'package:shopapp/view/signin_screen/signInscreen.dart';
import 'package:shopapp/view/splash_screen/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await CacheNetwork.chacheIntializtiaon();
  token = CacheNetwork.getcachedata(key: 'token');
  print("token $token");
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: ((context) => Get())),
    ChangeNotifierProvider(create: ((context) => ProfileProvider())),
    ChangeNotifierProvider(create: ((context) => Auth())),
    ChangeNotifierProvider(create: ((context) => FavProvider())),
    ChangeNotifierProvider(create: ((context) => SearchProvider())),
    ChangeNotifierProvider(create: ((context) => CartProvider()))
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        'splashscreen': (context) => SplashScreen(),
        'onbording': (context) => OnBordingScreen(),
        'signin': (context) => SignInScreen(),
        'home': (context) => HomePageScreen(),
      },
      initialRoute:
          token != null && token != "" ? "home" : "splashscreen",
    );
  }
}
