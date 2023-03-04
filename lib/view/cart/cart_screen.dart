// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/provider/cart_provider.dart';
import 'package:shopapp/view/constants.dart';
import 'package:shopapp/view/product/product_screen.dart';

class CartScreen extends StatefulWidget {
  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    // TODO: implement initState

    print(Provider.of<CartProvider>(context, listen: false).datafav);
  }

  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(child: Consumer<CartProvider>(builder: (context, p, _) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                "My Cart",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Divider(
              thickness: 2,
            ),
            Expanded(
              child: Container(
                height: double.infinity,
                width: double.infinity,
                child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: p.datafav.length,
                    itemBuilder: ((context, index) {
                      return CartCard(
                          image:
                              p.datafav[index]['product']['image'].toString(),
                          price:
                              p.datafav[index]['product']['price'].toString(),
                          text: p.datafav[index]['product']['name'].toString());
                    })),
              ),
            ),
          ],
        );
      })),
    );
  }
}

class CartCard extends StatefulWidget {
  CartCard(
      {super.key,
      required this.image,
      required this.price,
      required this.text});
  final String image;
  final String text;
  final String price;

  @override
  State<CartCard> createState() => _CartCardState();
}

class _CartCardState extends State<CartCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 150,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 86,
                width: 86,
                child: Image.network(
                  widget.image,
                ),
              ),
            ),
            SizedBox(
              height: 15,
              width: 30,
            ),
            Expanded(
              child: Column(
                children: [
                  // Expanded(
                  //   child: Text(
                  //     widget.text,
                  //     style: Const().styletitlesproduct,
                  //     maxLines: 1,
                  //     textDirection: TextDirection.rtl,
                  //   ),
                  // ),
                  Text(
                    widget.text,
                    style: Const().styletitlesproduct,
                    maxLines: 1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'price',
                        style: TextStyle(color: Colors.grey),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        widget.price,
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: (() {
                          if (count > 0) {
                            count--;
                          }
                          setState(() {});
                        }),
                        child: Container(
                          alignment: Alignment.center,
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: Colors.grey)),
                          child: Text(
                            '-',
                            style: TextStyle(fontSize: 30, color: Colors.grey),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 40,
                        child: Center(child: Text(count.toString())),
                      ),
                      InkWell(
                        onTap: () {
                          count++;
                          setState(() {});
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: Const().kprimarycolor)),
                          child: Text(
                            '+',
                            style: TextStyle(
                                fontSize: 30, color: Const().kprimarycolor),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
