import 'package:flutter/material.dart';
import 'package:shopapp/view/home_page/home_screen_widgets.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

late String name;
late String description;
late String price;
late String image;
int count = 1;

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            height: 380,
            width: double.infinity,
            child: Stack(
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
                        child: IconButton(
                            onPressed: (() {
                              Navigator.pop(context);
                            }),
                            icon: Icon(Icons.arrow_back_ios_new)),
                      ),
                      // Image.network(
                      //   " ",
                      //   width: 120,
                      //   height: 140,
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              HeadText(text: " "),
              Icon(Icons.favorite_border_outlined)
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: (() {
                        count--;
                        setState(() {});
                      }),
                      icon: Icon(Icons.minimize)),
                  Container(
                    height: 45,
                    width: 45,
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.green)),
                  ),
                  IconButton(
                      onPressed: (() {
                        count++;
                        setState(() {});
                      }),
                      icon: Icon(Icons.add))
                ],
              ),
              HeadText(text: " "),
            ],
          ),
          Container(
            height: 1,
            width: double.infinity,
          ),
          Text(
            "Product Detail",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            " ",
            style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w700,
                color: Colors.black38),
          ),
          Container(
            height: 1,
            width: double.infinity,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Nutritions",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Icon(Icons.arrow_circle_right_outlined)
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Review",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Row(
                children: const [
                  Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
