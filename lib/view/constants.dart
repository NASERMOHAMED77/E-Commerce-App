import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/model/local/cachenetwork.dart';
import 'package:shopapp/provider/cart_provider.dart';
import 'package:shopapp/provider/fav_provider.dart';

class Const {
  Color kprimarycolor = const Color(0xFF53B175);
  TextStyle styletitlesproduct = const TextStyle(
      overflow: TextOverflow.fade,
      fontWeight: FontWeight.w600,
      color: Colors.black,
      fontSize: 16);
  TextStyle stylegreen = const TextStyle(
      fontWeight: FontWeight.w400, color: Colors.green, fontSize: 16);
  TextStyle styletitles = const TextStyle(
    fontWeight: FontWeight.w600,
    color: Colors.black,
    fontSize: 25,
  );
  TextStyle style = const TextStyle(
      fontWeight: FontWeight.w600, color: Colors.white, fontSize: 48);
}

class AppButton extends StatelessWidget {
  const AppButton({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Const().kprimarycolor,
      ),
      height: 67,
      width: 353,
      child: Text(
        text,
        style: const TextStyle(
            color: Colors.white, fontWeight: FontWeight.w600, fontSize: 18),
      ),
    );
  }
}

class ProductCard extends StatefulWidget {
  const ProductCard({
    Key? key,
    required this.image,
    required this.text,
    required this.text2,
    required this.name,
    required this.id,
  }) : super(key: key);
  final String image;
  final String text;
  final String text2;
  final String name;
  final int id;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool fav = true;
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(10),
        height: 250,
        width: 175,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.network(
                  widget.image,
                  width: 80,
                  height: 105,
                ),
              ),
              Text(
                widget.name,
                style: TextStyle(
                    fontSize: 10,
                    color: Colors.black38,
                    fontWeight: FontWeight.w600),
                maxLines: 1,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Text(
                        widget.text2 + ' \$',
                        style: TextStyle(
                            fontSize: 10,
                            color: Colors.black38,
                            fontWeight: FontWeight.w600),
                        maxLines: 1,
                      ),
                      Container(
                          height: 1, width: 50, color: Const().kprimarycolor),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.text + "\$",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w600),
                        maxLines: 1,
                      ),
                      Consumer<FavProvider>(builder: (context, p, _) {
                        return Row(
                          children: [
                            InkWell(
                              onTap: (() {
                                setState(() {
                                  fav = !fav;
                                });

                                p.adddata(id: widget.id, token: token!);
                                p.getfavdata(token: token!);
                                print(p.datafav[10]);
                                print(token);
                              }),
                              child: Icon(
                                fav ? Icons.favorite_border : Icons.favorite,
                                color: Const().kprimarycolor,
                                size: 25,
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            InkWell(
                              onTap: () {
                                Provider.of<CartProvider>(context,
                                        listen: false)
                                    .addtoCart(id: widget.id, token: token!);
                              },
                              child: Container(
                                height: 25,
                                child: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                                width: 25,
                                decoration: BoxDecoration(
                                    color: Const().kprimarycolor,
                                    borderRadius: BorderRadius.circular(5)),
                              ),
                            ),
                          ],
                        );
                      })
                    ],
                  )
                ],
              ),
            ],
          ),
        ));
  }
}

class DefultField extends StatelessWidget {
  const DefultField({
    Key? key,
    required this.text,
    required this.controller,
    required this.inputType,
  }) : super(key: key);
  final String text;
  final TextEditingController controller;
  final TextInputType inputType;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        onSaved: (newValue) {},
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Required filed';
          } else if (value.length < 6) {
            return 'Must be bigger than 8';
          }
          return null;
        },
        controller: controller,
        decoration: InputDecoration(
          hintText: text,
        ),
        keyboardType: inputType,
      ),
    );
  }
}

String? token;
