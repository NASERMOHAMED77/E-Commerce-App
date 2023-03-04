import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/provider/fav_provider.dart';
import 'package:shopapp/view/constants.dart';

import '../product/product_screen.dart';

class FavoriateScreen extends StatelessWidget {
  const FavoriateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<FavProvider>(builder: ((context, provider, child) {
      if (provider.datafav.length == 0) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: CircularProgressIndicator(
                  color: Const().kprimarycolor,
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Text("Wait.....")
            ],
          ),
        );
      } else {
        return Container(
          child: GridView.builder(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemCount: provider.datafav.length,
              itemBuilder: ((context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: ((context) {
                      return ProductScreen();
                    })));
                  },
                  child: ProductCard(
                      id: provider.datafav[index]['product']['id'],
                      image: provider.datafav[index]['product']['image']
                          .toString(),
                      text: provider.datafav[index]['product']['price']
                          .toString(),
                      text2: provider.datafav[index]['product']['old_price']
                          .toString(),
                      name: provider.datafav[index]['product']['name']
                          .toString()),
                );
              })),
        );
      }
    }));
  }
}
//provider.datafav[0]['product']['name'].toString()