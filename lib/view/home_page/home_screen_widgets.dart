import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/provider/get_products.dart';
import 'package:shopapp/view/constants.dart';
import 'package:shopapp/view/product/product_screen.dart';

class HeadText extends StatelessWidget {
  const HeadText({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Text(
        text,
        style: Const().styletitles,
      ),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<Get>(builder: (context, product, _) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
                child: Column(
              children: [
                Image.asset(
                  'images/mainlogo.png',
                  width: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Icon(Icons.location_on),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Dhaka ,  Banassre',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                )
              ],
            )),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: TextFormField(
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 0),
                        borderRadius: BorderRadius.circular(20)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 0),
                        borderRadius: BorderRadius.circular(20)),
                    filled: true,
                    fillColor: Colors.black12,
                    hintText: 'Search Store',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.white,
                            width: 0,
                            style: BorderStyle.none),
                        borderRadius: BorderRadius.circular(20))),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              height: 100,
              width: 400,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Const().kprimarycolor, width: 3)),
              child: CarouselSlider.builder(
                itemCount: product.banners.length,
                itemBuilder: ((context, index, realIndex) {
                  if (product.banners.length == 0) {
                    return Center(
                      child: CircularProgressIndicator(
                          color: Const().kprimarycolor),
                    );
                  } else {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.network(
                        product.banners[index].image.toString(),
                        fit: BoxFit.fill,
                        width: 350,
                        height: 80,
                      ),
                    );
                  }
                }),
                options: CarouselOptions(
                    height: 500,
                    autoPlay: true,
                    viewportFraction: 1,
                    enlargeCenterPage: true,
                    enlargeStrategy: CenterPageEnlargeStrategy.height),
              ),
            ),
            HeadText(
              text: "All Products ",
            ),
            Expanded(
              child: Container(
                height: double.infinity,
                width: double.infinity,
                child: GridView.builder(
                    physics: BouncingScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    itemCount: product.productModel.length,
                    itemBuilder: ((context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: ((context) {
                            return ProductScreen();
                          })));
                        },
                        child: ProductCard(
                            id: product.productModel[index].id,
                            image: product.productModel[index].image.toString(),
                            text: product.productModel[index].price.toString(),
                            text2:
                                product.productModel[index].oldrice.toString(),
                            name: product.productModel[index].name.toString()),
                      );
                    })),
              ),
            ),
          ],
        );
      }),
    );
  }
}
