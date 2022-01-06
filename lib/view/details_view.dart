import 'package:firebasegetex/core/view_model/cart_view_model.dart';
import 'package:firebasegetex/model/cart_product_model.dart';
import 'package:firebasegetex/model/products_model.dart';
import 'package:firebasegetex/view/widget/custemtext.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constance.dart';
import 'widget/custem_button.dart';

class DetailsView extends StatelessWidget {
  final ProductsModel model;
  const DetailsView({required this.model});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 1,
                  itemBuilder: (context, int) {
                    return Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 270,
                          child: Image.network(
                            model.image,
                            fit: BoxFit.fill,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Container(
                          padding: EdgeInsets.all(18),
                          child: Column(
                            children: [
                              CstumText(
                                text: model.name,
                                fontSize: 26,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(16),
                                    width:
                                        MediaQuery.of(context).size.width * .45,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(color: Colors.grey)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        CstumText(
                                          text: 'Size',
                                        ),
                                        CstumText(
                                          text: model.size,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(16),
                                    width:
                                        MediaQuery.of(context).size.width * .45,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(color: Colors.grey)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        CstumText(
                                          text: 'Color',
                                        ),
                                        Container(
                                          height: 20,
                                          width: 30,
                                          decoration: BoxDecoration(
                                              color: model.color,
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              border: Border.all(
                                                  color: Colors.grey)),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              CstumText(
                                text: 'Details',
                                fontSize: 18,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              CstumText(
                                text: model.description,
                                maxLine: 9,
                                height: 2.5,
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  }),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    CstumText(
                      text: "PRICE ",
                      fontSize: 22,
                      color: Colors.grey,
                    ),
                    CstumText(
                      text: ' \$' + model.price,
                      color: primaryColor,
                      fontSize: 18,
                    )
                  ],
                ),
                GetBuilder<CartViewModel>(
                  init: CartViewModel(),
                  builder: (controller) => Container(
                    padding: EdgeInsets.only(top: 20, right: 20, bottom: 10),
                    width: 180,
                    height: 100,
                    child: CustomButton(
                      onPress: () {
                        controller.addProducts(CartProductsModel(
                            name: model.name,
                            image: model.image,
                            quantity: 1,
                            price: model.price,
                            productsId: model.productsId));
                      },
                      text: 'Add',
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
