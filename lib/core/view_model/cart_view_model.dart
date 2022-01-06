import 'package:firebasegetex/core/services/database/cord_database_holder.dart';
import 'package:firebasegetex/model/cart_product_model.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class CartViewModel extends GetxController {
  var dbHalper = CordDatabaseHelper.db;
  bool get loading => _loading;
  bool _loading = false;

  List<CartProductsModel> _cartProductsModel = [];
  List<CartProductsModel> get cartProductsModel => _cartProductsModel;
  double get totlaprice => _totlaprice;
  double _totlaprice = 0;
  bool verife = false;
  CartViewModel() {
    getAllProducts();
  }

  getAllProducts() async {
    _loading = true;
    var dbHelper = CordDatabaseHelper.db;

    _cartProductsModel = await dbHelper.getAllProdects();

    grtTotalPrice();
    update();
  }

  grtTotalPrice() async {
    for (int i = 0; i < _cartProductsModel.length; i++) {
      _totlaprice += (double.parse(_cartProductsModel[i].price)) *
          _cartProductsModel[i].quantity;
    }
    update();
  }

  addProducts(CartProductsModel cartProductsModel) async {
    for (int i = 0; i < _cartProductsModel.length; i++) {
      if (_cartProductsModel[i].productsId == cartProductsModel.productsId) {
        return;
      }
    }

    await dbHalper.inser(cartProductsModel);
    _totlaprice +=
        (double.parse(cartProductsModel.price)) * cartProductsModel.quantity;
    update();
  }

  icreaseQuantity(int index) async {
    _cartProductsModel[index].quantity++;
    _totlaprice += (double.parse(_cartProductsModel[index].price));
    await dbHalper.updateProducts(_cartProductsModel[index]);
    update();
  }

  decreaseQuantity(int index) async {
    if (_cartProductsModel[index].quantity == 0) {
      await dbHalper.removeProducs(_cartProductsModel[index]);
    }
    if (_cartProductsModel[index].quantity >= 1) {
      _cartProductsModel[index].quantity--;
      _totlaprice -= (double.parse(_cartProductsModel[index].price));
      await dbHalper.updateProducts(_cartProductsModel[index]);
    }
    update();
  }
}
