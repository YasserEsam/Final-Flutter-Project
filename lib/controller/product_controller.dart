import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/product.dart';
import 'package:http/http.dart' as http; // the libary to get data from internet

// import 'package:http/http.dart';
class ProductController extends GetxController {
  List<Product> cartProduct = [];
  List<Product> producList = [];

  Future getProductFromIpi() async {
    http.Response response =
        await http.get(Uri.parse('https://fakestoreapi.com/products'));
    if (response.statusCode == 200) {
      for (var json in jsonDecode(response.body)) {
        producList.add(Product.fromJson(json));
      }
    }
  }

  void addtocart(Product product) {
    if (!isInTheCart(product.id)) {
      cartProduct.add(product);
      snackbar(
          title: "Added successfully ",
          message: "this product Added successfully",
          backgroundColor: const Color.fromARGB(255, 65, 154, 68));
    } else {
      snackbar(
          title: "Not Added",
          message: "this product already exists",
          backgroundColor: Colors.amber);
    }
  }

  bool isInTheCart(int id) {
    for (var product in cartProduct) {
      if (product.id == id) {
        return true;
      }
    }
    return false;
  }

  void delete(int id) {
    for (var product in cartProduct) {
      if (product.id == id) {
        cartProduct.remove(product);
      }
    }
  }

  double getTotalPrice() {
    double totalPrice = 0.0;
    for (var product in cartProduct) {
      totalPrice += product.price;
    }
    return totalPrice;
  }

  snackbar({required title, required message, required backgroundColor}) {
    return Get.snackbar(title, message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: backgroundColor,
        colorText: Colors.white);
  }
}
