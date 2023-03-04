import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shopapp/model/product_model/product_model.dart';

class FavProvider extends ChangeNotifier {
  bool x = true;
  List datafav = [];

  getfavdata({required String token}) async {
    datafav = [];
    http.Response response = await http.get(
        Uri.parse('https://student.valuxapps.com/api/favorites'),
        headers: {'Authorization': token});
    if (response.statusCode == 200) {
      x = false;

      notifyListeners();
      datafav.addAll(json.decode(response.body)['data']['data']);

      notifyListeners();
    } else {
      Fluttertoast.showToast(
        msg: 'Error',
        backgroundColor: Colors.green,
        textColor: Colors.white,
      );
      throw (response.statusCode);
    }
  }

  adddata({required num id, required String token}) async {
    http.Response response = await http.post(
        Uri.parse(
          'https://student.valuxapps.com/api/favorites',
        ),
        headers: {'Authorization': token},
        body: {'product_id': '$id'});
    if (response.statusCode == 200) {
      Fluttertoast.showToast(
        msg: '${json.decode(response.body)['message']}',
        backgroundColor: Colors.green,
        textColor: Colors.white,
      );
      // Fluttertoast.showToast(
      //   msg: 'Product added successfully',
      //   backgroundColor: Colors.green,
      //   textColor: Colors.white,
      // );
      notifyListeners();
    } else {
      Fluttertoast.showToast(
        msg: 'Error',
        backgroundColor: Colors.green,
        textColor: Colors.white,
      );
    }
  }
}
