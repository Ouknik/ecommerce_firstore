import 'package:firebasegetex/constance.dart';
import 'package:firebasegetex/core/view_model/cart_view_model.dart';
import 'package:firebasegetex/view/widget/custem_button.dart';
import 'package:firebasegetex/view/widget/custemtext.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CartView extends StatelessWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartViewModel>(
      init: CartViewModel(),
      builder: (controller) => controller.cartProductsModel.length == 0
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'lib/assets/images/cart.svg',
                  width: 200,
                  height: 200,
                ),
                SizedBox(
                  height: 20,
                ),
                CstumText(
                  text: 'Cart empty',
                  fontSize: 32,
                  alignment: Alignment.center,
                )
              ],
            )
          : Scaffold(
              body: Column(
                children: [
                  Expanded(
                    child: Container(
                      child: ListView.separated(
                        itemCount: controller.cartProductsModel.length,
                        itemBuilder: (context, i) {
                          return Container(
                            height: 140,
                            child: Row(
                              children: [
                                Container(
                                    width: 140,
                                    child: Image.network(
                                      controller.cartProductsModel[i].image,
                                    )),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CstumText(
                                        text: controller
                                            .cartProductsModel[i].name,
                                        fontSize: 18,
                                        color: Colors.black,
                                      ),
                                      CstumText(
                                        text:
                                            '${controller.cartProductsModel[i].price}\$',
                                        color: primaryColor,
                                      ),
                                      const SizedBox(
                                        height: 25,
                                      ),
                                      Container(
                                        width: 140,
                                        color: Colors.grey.shade200,
                                        alignment: Alignment.center,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            GestureDetector(
                                              child: Container(
                                                  child: Icon(Icons.add)),
                                              onTap: () {
                                                controller.icreaseQuantity(i);
                                              },
                                            ),
                                            const SizedBox(
                                              width: 25,
                                            ),
                                            CstumText(
                                              alignment: Alignment.center,
                                              text: controller
                                                  .cartProductsModel[i].quantity
                                                  .toString(),
                                              fontSize: 20,
                                            ),
                                            const SizedBox(
                                              width: 25,
                                            ),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(bottom: 15),
                                              child: GestureDetector(
                                                child: Container(
                                                  child: Icon(Icons.minimize),
                                                ),
                                                onTap: () {
                                                  controller
                                                      .decreaseQuantity(i);
                                                },
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) =>
                            const SizedBox(
                          height: 20,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GetBuilder<CartViewModel>(
                          init: CartViewModel(),
                          builder: (controllor) => Column(
                            children: [
                              CstumText(
                                text: 'TOTAL',
                                fontSize: 22,
                                color: Colors.grey,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              CstumText(
                                text: controllor.totlaprice.toString(),
                                fontSize: 18,
                                color: primaryColor,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 180,
                          height: 60,
                          child: CustomButton(
                            onPress: () {},
                            text: 'CHCKOUT',
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
    );
  }
}
