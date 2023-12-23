import 'dart:convert';

import 'package:adv_test_app/model/api_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class ApiProvider extends ChangeNotifier {
  List<ApiModel> dataofapi = [];
  List cart = [];

  List image = [
    "assets/1.jpeg",
    "assets/2.webp",
    "assets/3.jpeg",
    "assets/4.webp"
  ];
  Future<void> fetchdatafromapi() async {
    String api = "https://fakestoreapi.com/products";
    http.Response response = await http.get(Uri.parse(api));

    if (response.statusCode == 200) {
      String alldata = response.body;
      List<dynamic> fetchdataapi = jsonDecode(alldata);
      dataofapi = fetchdataapi
          .map((e) => ApiModel(
              id: e['id'],
              title: e['title'],
              price: e['price'],
              description: e['description'],
              category: e['category'],
              image: e['image']))
          .toList();
    }
  }
}
