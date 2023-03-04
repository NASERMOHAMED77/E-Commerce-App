// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: prefer_const_constructors

import 'package:carousel_slider/carousel_slider.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/provider/cart_provider.dart';
import 'package:shopapp/provider/fav_provider.dart';
import 'package:shopapp/provider/get_products.dart';
import 'package:shopapp/provider/profile_ptovider.dart';
import 'package:shopapp/view/account/account_screen.dart';
import 'package:shopapp/view/cart/cart_screen.dart';
import 'package:shopapp/view/constants.dart';
import 'package:shopapp/view/favoriate/favouriate_screen.dart';
import 'package:shopapp/view/home_page/home_screen_widgets.dart';
import 'package:shopapp/view/search/search_screen.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  List<Widget> items = [
    Icon(
      Icons.home_repair_service_rounded,
    ),
    Icon(
      Icons.search_outlined,
    ),
    Icon(
      Icons.shopping_basket_sharp,
    ),
    Icon(
      Icons.favorite_border,
    ),
    Icon(
      Icons.person,
    )
  ];
  List<Widget> screen = [
    Home(),
    SearchScreen(),
    CartScreen(),
    FavoriateScreen(),
    AccountScreen()
  ];
  int index = 0;
  @override
  void initState() {
    super.initState();
    Provider.of<CartProvider>(context, listen: false)
        .getcartdata(token: token!);
    Provider.of<FavProvider>(context, listen: false).getfavdata(token: token!);

    Provider.of<ProfileProvider>(context, listen: false).getdata(token: token!);
  }

  @override
  Widget build(BuildContext context) {
    var x = Provider.of<Get>(context, listen: false)
        .getallproducts('https://student.valuxapps.com/api/products');

    var y = Provider.of<Get>(context, listen: false)
        .getbannars('https://student.valuxapps.com/api/home');
    return Scaffold(
      bottomNavigationBar: Theme(
        data: Theme.of(context)
            .copyWith(iconTheme: IconThemeData(color: Colors.black)),
        child: CurvedNavigationBar(
          onTap: ((value) {
            index = value;
            print(value);
            setState(() {});
          }),
          items: items,
          animationCurve: Curves.easeInOut,
          height: 60,
          color: Colors.white,
          buttonBackgroundColor: Const().kprimarycolor,
          animationDuration: Duration(milliseconds: 300),
          backgroundColor: Colors.transparent,
        ),
      ),
      backgroundColor: Colors.white,
      body: screen[index],
    );
  }
}
