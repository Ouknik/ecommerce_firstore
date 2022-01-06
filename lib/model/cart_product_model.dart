import 'package:firebasegetex/helpear/extenstion.dart';
import 'package:flutter/material.dart';

class CartProductsModel {
  late String name, image, price, productsId;
  late int quantity;

  CartProductsModel({
    required this.name,
    required this.image,
    required this.quantity,
    required this.price,
    required this.productsId,
  });
  CartProductsModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
    name = map['name'];
    image = map['image'];
    quantity = map['quantity'];
    price = map['price'];
    productsId = map['productsId'];
  }
  toJson() {
    return {
      'name': name,
      'image': image,
      'quantity': quantity,
      'price': price,
      'productsId': productsId,
    };
  }
}
