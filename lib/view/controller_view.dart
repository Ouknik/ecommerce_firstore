//import 'package:firebasegetex/core/services/view_model/auth_view_model.dart';
import 'package:firebasegetex/core/view_model/auth_view_model.dart';
import 'package:firebasegetex/core/view_model/controller_view_model.dart';
import 'package:firebasegetex/view/auth/login_scren.dart';
import 'package:firebasegetex/view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ControllerView extends GetWidget<AuthViewModel> {
  var uid;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return (Get.find<AuthViewModel>().user == null)
            ? LoginScren()
            : GetBuilder<ControllerViewModel>(
                init: ControllerViewModel(),
                builder: (controller) => Scaffold(
                  bottomNavigationBar: _BouttonNavigatorBar(),
                  body: controller.currentValue,
                ),
              );
      },
    );
  }
}

Widget _BouttonNavigatorBar() {
  return GetBuilder<ControllerViewModel>(
    init: ControllerViewModel(),
    builder: (controller) => BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              activeIcon: Padding(
                padding: EdgeInsets.only(top: 25.0),
                child: Text("explore"),
              ),
              label: "",
              icon: Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: Icon(Icons.travel_explore),
              )),
          BottomNavigationBarItem(
              activeIcon: Padding(
                padding: EdgeInsets.only(top: 25.0),
                child: Text("Cart"),
              ),
              label: "",
              icon: Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: Icon(Icons.shopping_cart),
              )),
          BottomNavigationBarItem(
              activeIcon: Padding(
                padding: EdgeInsets.only(top: 25.0),
                child: Text("Account"),
              ),
              label: "",
              icon: Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: Icon(Icons.person),
              )),
        ],
        elevation: 0.0,
        currentIndex: controller.navigatorValue,
        selectedItemColor: Colors.black,
        backgroundColor: Colors.grey.shade50,
        onTap: (index) {
          controller.changeSelectedValue(index);
        }),
  );
}
