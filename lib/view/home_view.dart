import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebasegetex/core/view_model/controller_view_model.dart';
import 'package:firebasegetex/core/view_model/home_view_model.dart';
import 'package:firebasegetex/view/auth/login_scren.dart';
import 'package:firebasegetex/view/widget/custemtext.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constance.dart';
import 'details_view.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      init: HomeViewModel(),
      builder: (controller) => Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(top: 100, left: 20, right: 20),
            child: Column(
              children: [
                _searchTextFormField(),
                const SizedBox(
                  height: 30,
                ),
                CstumText(
                  text: "Categories",
                ),
                const SizedBox(
                  height: 30,
                ),
                _listViewCategory(),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CstumText(
                      text: "Best Selling",
                      fontSize: 18,
                    ),
                    CstumText(
                      text: "See all",
                      fontSize: 16,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                _listViewProducts(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _searchTextFormField() {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: Colors.grey.shade200,
    ),
    child: TextFormField(
      decoration: const InputDecoration(
        border: InputBorder.none,
        prefixIcon: Icon(
          Icons.search,
          color: Colors.black,
        ),
      ),
    ),
  );
}

Widget _listViewCategory() {
  return GetBuilder<HomeViewModel>(
    init: HomeViewModel(),
    builder: (controller) => controller.loding.value == true
        ? Center(child: const CircularProgressIndicator())
        : Container(
            height: 140,
            width: double.infinity,
            child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: controller.categoryModel.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.grey.shade100,
                      ),
                      height: 60,
                      width: 60,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.network(
                          controller.categoryModel[index].image,
                          width: 60,
                          height: 60,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CstumText(
                      text: controller.categoryModel[index].name,
                    ),
                  ],
                );
              },
              separatorBuilder: (context, index) => SizedBox(
                width: 20,
              ),
            ),
          ),
  );
}

Widget _listViewProducts() {
  return GetBuilder<HomeViewModel>(
    init: HomeViewModel(),
    builder: (controllor) => controllor.loding == true
        ? CircularProgressIndicator()
        : Container(
            height: 320,
            width: double.infinity,
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: controllor.productsModel.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, i) {
                return GestureDetector(
                  onTap: () =>
                      Get.to(DetailsView(model: controllor.productsModel[i])),
                  child: Container(
                    width: MediaQuery.of(context).size.width * .4,
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.grey.shade100,
                          ),
                          child: Container(
                              height: 220,
                              width: MediaQuery.of(context).size.width * .4,
                              child: Image.network(
                                controllor.productsModel[i].image,
                                width: 60,
                                height: 60,
                                fit: BoxFit.fill,
                              )),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        CstumText(
                          text: controllor.productsModel[i].name,
                          alignment: Alignment.bottomLeft,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Expanded(
                          child: CstumText(
                            text: controllor.productsModel[i].description,
                            color: Colors.grey,
                            alignment: Alignment.bottomLeft,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CstumText(
                          text: controllor.productsModel[i].price + ' \$',
                          color: primaryColor,
                          alignment: Alignment.bottomLeft,
                        ),
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) => SizedBox(
                width: 20,
              ),
            ),
          ),
  );
}
