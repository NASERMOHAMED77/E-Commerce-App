// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shopapp/model/product_model/product_model.dart';

class Get extends ChangeNotifier {
  List<ProductModel> productModel = [];
  List<ProductModel> productcategoryModel = [];
  List<ProductModel> categoryModel = [];
  List<ProductModel> banners = [];
  Future<List<ProductModel>> getallcategoryproducts(int x) async {
    try {
      http.Response response = await http
          .get(Uri.parse('https://student.valuxapps.com/api/categories/$x'));
      if (response.statusCode == 200) {
        json.decode(response.body)['data']['data'].forEach((e) {
          productcategoryModel.add(ProductModel.fromjson(e));
        });
        notifyListeners();

        return productcategoryModel;
      } else {
        print('error');
        throw (response.statusCode);
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<List<ProductModel>> getallproducts(String url) async {
    productModel = [];
    try {
      http.Response response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        print('ok');
        json.decode(response.body)['data']['data'].forEach((e) {
          productModel.add(ProductModel.fromjson(e));
        });
        notifyListeners();

        return productModel;
      } else {
        print('error');
        throw (response.statusCode);
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<List<ProductModel>> getallcategories(String url) async {
    categoryModel = [];
    try {
      http.Response response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        json.decode(response.body)['data']['data'].forEach((e) {
          categoryModel.add(ProductModel.fromjson(e));
        });
        notifyListeners();

        return categoryModel;
      } else {
        print('error');
        throw (response.statusCode);
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<List<ProductModel>> getbannars(String url) async {
    try {
      http.Response response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        json.decode(response.body)['data']['banners'].forEach((e) {
          banners.add(ProductModel.fromjson(e));
        });
        notifyListeners();

        return banners;
      } else {
        print('error');
        throw (response.statusCode);
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
