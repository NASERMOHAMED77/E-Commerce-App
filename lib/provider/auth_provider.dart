import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shopapp/model/local/cachenetwork.dart';
import 'package:shopapp/model/user_model/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:shopapp/view/constants.dart';

class Auth extends ChangeNotifier {
  bool loading = false;
  bool x = true;
  UserModel? userModel;
  login({required String email, required String password}) async {
    try {
      http.Response response = await http
          .post(Uri.parse('https://student.valuxapps.com/api/login'), body: {
        'email': email,
        'password': password,
      });
      var res = jsonDecode(response.body);
      if (json.decode(response.body)['status'] == true) {
        await CacheNetwork.inserttocache(
            key: "token", value: res['data']['token']);
        print('done');
        userModel =
            UserModel.fromJson(json: json.decode(response.body)['data']);
        print(userModel!.name);
        Fluttertoast.showToast(
          msg: '${json.decode(response.body)['message']}',
          backgroundColor: Colors.green,
          textColor: Colors.white,
        );
        x = false;
        loading = false;
        notifyListeners();
      } else {
        print('${json.decode(response.body)['message']}');
        Fluttertoast.showToast(
          msg: '${json.decode(response.body)['message']}',
          backgroundColor: Colors.red,
          textColor: Colors.white,
        );
        loading = false;
        notifyListeners();
      }
    } on SocketException {
      print('Internet Error');
      Fluttertoast.showToast(
        msg: 'Internet Error',
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
      loading = false;
      notifyListeners();
    } catch (e) {
      Fluttertoast.showToast(
        msg: 'Error',
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
      loading = false;
      notifyListeners();
      print(e.toString());
    }
  }

  register({
    required String email,
    required String password,
    required String phone,
    required String name,
  }) async {
    loading = true;
    notifyListeners();
    try {
      http.Response response = await http.post(
        Uri.parse('https://student.valuxapps.com/api/register'),
        body: {
          'email': email,
          'password': password,
          'name': name,
          'phone': phone,
          'image': ''
        },
      );
      if (json.decode(response.body)['status'] == true) {
        print('Done');
        userModel =
            UserModel.fromJson(json: json.decode(response.body)['data']);
        print(userModel!.name);
        Fluttertoast.showToast(
          msg: '${json.decode(response.body)['message']}',
          backgroundColor: Colors.green,
          textColor: Colors.white,
        );
        loading = false;
        notifyListeners();
      } else {
        Fluttertoast.showToast(
          msg: '${json.decode(response.body)['message']}',
          backgroundColor: Colors.red,
          textColor: Colors.white,
        );
        loading = false;
        notifyListeners();
      }
    } on SocketException {
      Fluttertoast.showToast(
        msg: 'Internet Error',
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
      loading = false;
      notifyListeners();
    } catch (e) {
      Fluttertoast.showToast(
        msg: 'Error',
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
      loading = false;
      notifyListeners();
      print(e.toString());
    }
  }

  
}
