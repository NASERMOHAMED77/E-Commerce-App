// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/provider/get_products.dart';
import 'package:shopapp/provider/search_provider.dart';
import 'package:shopapp/view/constants.dart';
import 'package:shopapp/view/home_page/home_screen_widgets.dart';
import 'package:shopapp/view/product/product_screen.dart';
import 'package:shopapp/view/search/search_Cat/serach_cat_product_screen.dart';

class SearchScreen extends StatefulWidget {
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController controller = TextEditingController();
  bool xx = true;

  @override
  Widget build(BuildContext context) {
    var x = Provider.of<Get>(context, listen: false)
        .getallcategories('https://student.valuxapps.com/api/categories');
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(child: Consumer<Get>(builder: (context, p, _) {
        return Consumer<SearchProvider>(builder: (context, pp, _) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const Center(child: HeadText(text: "Find Products")),
              Padding(
                padding: const EdgeInsets.all(20),
                child: TextFormField(
                  onFieldSubmitted: (value) {
                    Provider.of<SearchProvider>(context, listen: false)
                        .search(token: token!, word: value);
                    xx = false;
                    setState(() {});
                  },
                  onChanged: ((value) {
                    // Provider.of<SearchProvider>(context, listen: false)
                    //     .search(token: token!, word: value);
                  }),
                  decoration: InputDecoration(
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    fillColor: Color(0xFFF2F3F2),
                    labelText: "Search Store",
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                  ),
                ),
              ),
              xx
                  ? Expanded(
                      child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2),
                          itemCount:
                              xx ? p.categoryModel.length : pp.data.length,
                          itemBuilder: ((context, index) {
                            if (xx == false) {
                              return Center(
                                child: CircularProgressIndicator(
                                    color: Colors.green),
                              );
                            } else {
                              if (p.categoryModel.length == null) {
                                return Center(
                                  child: CircularProgressIndicator(
                                      color: Colors.green),
                                );
                              } else {
                                return Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Row(
                                    children: [
                                      InkWell(
                                        onTap: (() {
                                          Navigator.push(context,
                                              MaterialPageRoute(
                                                  builder: ((context) {
                                            Provider.of<Get>(context,
                                                    listen: false)
                                                .productcategoryModel = [];

                                            return CategoryProducts(
                                                id: p.categoryModel[index].id,
                                                categoryname: p
                                                    .categoryModel[index].name
                                                    .toString());
                                          })));
                                        }),
                                        child: CatCard(
                                            bordercollor: Colors.green,
                                            fillcollor: Colors.white,
                                            image: p.categoryModel[index].image
                                                .toString(),
                                            text: p.categoryModel[index].name
                                                .toString()),
                                      ),
                                    ],
                                  ),
                                );
                              }
                            }
                          })),
                    )
                  : Expanded(
                      child: Container(
                        height: double.infinity,
                        width: double.infinity,
                        child: GridView.builder(
                            physics: BouncingScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2),
                            itemCount: pp.data.length,
                            itemBuilder: ((context, index) {
                              return InkWell(
                                onTap: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: ((context) {
                                    return ProductScreen();
                                  })));
                                },
                                child: ProductCard(
                                    id: pp.data[index]['id'],
                                    image: pp.data[index]['image'].toString(),
                                    text: pp.data[index]['ptice'].toString(),
                                    text2:
                                        pp.data[index]['oldprice'].toString(),
                                    name: pp.data[index]['name'].toString()),
                              );
                            })),
                      ),
                    ),
            ],
          );
        });
      })),
    );
  }
}

class CatCard extends StatelessWidget {
  CatCard(
      {super.key,
      required this.bordercollor,
      required this.fillcollor,
      required this.image,
      required this.text});
  Color fillcollor;
  Color bordercollor;
  String image;
  String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190,
      width: 174,
      decoration: BoxDecoration(
          color: fillcollor,
          border: Border.all(color: bordercollor),
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          Image.network(
            image,
            width: 120,
            height: 140,
          ),
          Text(
            text,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          )
        ],
      ),
    );
  }
}
