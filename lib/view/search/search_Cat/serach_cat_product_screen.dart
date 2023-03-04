import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/provider/get_products.dart';
import 'package:shopapp/view/constants.dart';
import 'package:shopapp/view/home_page/home_screen_widgets.dart';

class CategoryProducts extends StatelessWidget {
  CategoryProducts({super.key, required this.categoryname, required this.id});
  String categoryname;
  int id;
  @override
  Widget build(BuildContext context) {
    var x = Provider.of<Get>(context, listen: false).getallcategoryproducts(id);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          Icon(
            Icons.tune,
            color: Colors.black,
          )
        ],
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: Colors.black),
        ),
        title: Center(
          child: HeadText(text: categoryname),
        ),
      ),
      body: Consumer<Get>(builder: (context, p, _) {
        return ListView.builder(
            itemCount: p.productcategoryModel.length,
            itemBuilder: ((context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ProductCard(
                  id: p.productcategoryModel[index].id,
                    image: p.productcategoryModel[index].image.toString(),
                    text: p.productcategoryModel[index].price.toString(),
                    text2: p.productcategoryModel[index].oldrice.toString(),
                    name: p.productcategoryModel[index].name.toString()),
              );
            }));
      }),
    );
  }
}
