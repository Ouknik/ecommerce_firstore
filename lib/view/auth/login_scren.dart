//import 'package:firebasegetex/core/services/view_model/auth_view_model.dart';
import 'package:firebasegetex/core/view_model/auth_view_model.dart';
import 'package:firebasegetex/view/widget/custem_button.dart';
import 'package:firebasegetex/view/widget/custem_text_form_filed.dart';
import 'package:firebasegetex/view/widget/custemtext.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constance.dart';
import 'registre_view.dart';

class LoginScren extends GetWidget<AuthViewModel> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  LoginScren({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CstumText(
                        text: 'Welcome',
                        fontSize: 30,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(RegistreView());
                        },
                        child: CstumText(
                          text: 'Sign up',
                          fontSize: 18,
                          color: primaryColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CstumText(
                    text: 'Sign in to Continue',
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomTextFormField(
                    onSave: (value) {
                      controller.emaill = value!;
                    },
                    validator: (value) {
                      if (value == null) {
                        return Get.snackbar('ERROR', "vide");
                      }
                    },
                    text: 'Email',
                    hint: 'oop@gmail.com',
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  CustomTextFormField(
                    onSave: (value) {
                      controller.passwordd = value!;
                    },
                    validator: (value) {
                      if (value == null) {
                        return Get.snackbar('ERROR', "vide",
                            colorText: Colors.black,
                            snackPosition: SnackPosition.BOTTOM);
                      }
                    },
                    text: 'Password',
                    hint: '***************',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CstumText(
                    text: 'ForgetPassword',
                    alignment: Alignment.topRight,
                    fontSize: 14,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomButton(
                    onPress: () {
                      _formKey.currentState!.save();
                      // if (_formKey.currentState!.validate()) {
                      controller.SgnInWithEmailAndPasswor();
                      //}
                    },
                    text: 'SIGN IN',
                    color: primaryColor,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CstumText(
                    text: '-OR-',
                    alignment: Alignment.center,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    padding: const EdgeInsets.all(2),
                    color: Colors.white,
                    onPressed: () {},
                    child: Row(
                      children: [
                        const Icon(
                          Icons.facebook_outlined,
                          color: Colors.blue,
                          size: 50,
                        ),
                        const SizedBox(
                          width: 100,
                        ),
                        CstumText(
                          text: 'Sign in with Facebook',
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      MaterialButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          padding: const EdgeInsets.all(2),
                          color: Colors.white,
                          onPressed: () {
                            // controller.googleSignInMethode();
                          },
                          child: Row(
                            children: [
                              Image.asset(
                                'lib/assets/images/google.jpg',
                                height: 45,
                                width: 45,
                              ),
                              const SizedBox(
                                width: 100,
                              ),
                              CstumText(
                                text: 'Sign in with google',
                              ),
                              const SizedBox(
                                width: 85,
                              ),
                            ],
                          )),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
