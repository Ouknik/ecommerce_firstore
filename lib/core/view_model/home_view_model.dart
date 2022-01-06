import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebasegetex/core/services/firestor_user.dart';
import 'package:firebasegetex/core/services/home_services.dart';
import 'package:firebasegetex/model/category_model.dart';
import 'package:firebasegetex/model/products_model.dart';
import 'package:firebasegetex/model/products_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class HomeViewModel extends GetxController {
  ValueNotifier<bool> get loding => _loding;
  ValueNotifier<bool> _loding = ValueNotifier(false);

  List<CategoryModel> get categoryModel => _categoryModel;
  late List<CategoryModel> _categoryModel = [];

  List<ProductsModel> get productsModel => _productsModel;
  late List<ProductsModel> _productsModel = [];

  HomeViewModel() {
    getCategory();
    getBestSellingProducts();
  }
  getCategory() async {
    _loding.value = true;
    HomeService().getCategory().then((value) => {
          for (int i = 0; i < value.length; i++)
            {
              _categoryModel.add(CategoryModel.fromjson(
                  value[i].data() as Map<String, dynamic>)),
              // print(value[i].data()),
              _loding.value = false
            }
        });
    update();
  }

  getBestSellingProducts() async {
    _loding.value = true;
    HomeService().getBestSelling().then((value) => {
          for (int i = 0; i < value.length; i++)
            {
              _productsModel.add(ProductsModel.fromJson(
                  value[i].data() as Map<String, dynamic>)),
              print(value[i].data()),
              _loding.value = false
            }
        });
    update();
  }
}
