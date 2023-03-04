import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:shopapp/view/constants.dart';

class ProfileProvider extends ChangeNotifier {
  bool status = false;
  logout({required String t}) async {
    http.Response response = await http.post(
        Uri.parse('https://student.valuxapps.com/api/logout'),
        headers: {'Authorization': t});
    if (response.statusCode == 200) {
      status = json.decode(response.body)['status'];
      //  token = null;
      print(json.decode(response.body)['message']);
    }
  }

  Map data = {};
  getdata({required String token}) async {
    try {
      http.Response response = await http.get(
          Uri.parse('https://student.valuxapps.com/api/profile'),
          headers: {'Authorization': token});
      if (response.statusCode == 200) {
        data.addAll(json.decode(response.body)['data']);
        print(data);
        notifyListeners();
      } else {
        Fluttertoast.showToast(
          msg: '${json.decode(response.body)['message']}',
          backgroundColor: Colors.green,
          textColor: Colors.white,
        );
        notifyListeners();
      }
    } on SocketException {
      Fluttertoast.showToast(
        msg: 'Network Error',
        backgroundColor: Colors.green,
        textColor: Colors.white,
      );
      notifyListeners();
    } catch (e) {
      Fluttertoast.showToast(
        msg: 'Error Ya ghali',
        backgroundColor: Colors.green,
        textColor: Colors.white,
      );
      notifyListeners();
    }
  }
}
