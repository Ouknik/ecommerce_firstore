import 'dart:convert';

import 'package:firebasegetex/model/user_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constance.dart';

class LocalStorageData extends GetxController {
  Future<UserModel?> get getUser async {
    try {
      UserModel userModel = await _getUserData();
      if (userModel == null) {
        return null;
      }
      print("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");

      print(userModel.toString());

      return userModel;
    } catch (e) {
      print("bbbbbbbbbbbbbbbbbbb");

      Get.snackbar('ERROR', e.toString());
      print(e.toString());
      return null;
    }
  }

  _getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var value = prefs.getString(CACHED8_USER_DATA);
    return UserModel.fromJson(json.decode(value!));
  }

  setUser(UserModel userModel) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(
      CACHED8_USER_DATA,
      json.encode(
        userModel.toJson(),
      ),
    );
  }

  deleteUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
