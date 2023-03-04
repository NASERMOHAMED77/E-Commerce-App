import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SearchProvider extends ChangeNotifier {
  bool loading = false;
  List data = [];
  search({required String word, required String token}) async {
    data = [];
    loading = true;
    notifyListeners();
    http.Response res = await http.post(
        Uri.parse('https://student.valuxapps.com/api/products/search'),
        headers: {"Authorization": token},
        body: {"text": word});
    if (res.statusCode == 200) {
      loading = false;
      data.addAll(json.decode(res.body)['data']['data']);
      print(data.length);
      // print (datta) ;
      notifyListeners();
    } else {
      loading = false;
    }
  }
}
