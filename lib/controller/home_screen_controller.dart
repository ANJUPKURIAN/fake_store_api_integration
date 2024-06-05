import 'dart:convert';
import 'dart:developer';
import 'package:fake_store_api_integration/model/products_res_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreenController with ChangeNotifier {
  List<ProductsResModel> productsList = [];
  bool isLoading = false;

  Future getProducts() async {
    isLoading = true;
    notifyListeners();

    final url = Uri.parse("https://fakestoreapi.com/products");

    try {
      final res = await http.get(url);

      if (res.statusCode == 200) {
        // decode
        final decodedRes = jsonDecode(res.body) as List;
        log(decodedRes.toString());
        productsList = decodedRes
            .map((element) => ProductsResModel.fromJson(element))
            .toList();

        log(productsList.first.title.toString());
      } else {
        log("failed");
      }
    } catch (e) {
      log(e.toString());
    }

    isLoading = false;
    notifyListeners();
  }
}