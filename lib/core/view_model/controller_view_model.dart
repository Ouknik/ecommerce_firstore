import 'package:firebasegetex/view/cart_view.dart';
import 'package:firebasegetex/view/home_view.dart';
import 'package:firebasegetex/view/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ControllerViewModel extends GetxController {
  int _navigatorValue = 0;
  Widget _currentValue = HomeView();
  get navigatorValue => _navigatorValue;
  get currentValue => _currentValue;
  void changeSelectedValue(int selectedValue) {
    _navigatorValue = selectedValue;

    switch (selectedValue) {
      case 0:
        {
          _currentValue = HomeView();
          break;
        }
      case 1:
        {
          _currentValue = CartView();
          break;
        }
      case 2:
        {
          _currentValue = ProfileView();
          break;
        }
    }
    update();
  }
}
