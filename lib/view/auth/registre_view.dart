//import 'package:firebasegetex/core/services/view_model/auth_view_model.dart';
import 'package:firebasegetex/core/view_model/auth_view_model.dart';
import 'package:firebasegetex/view/auth/login_scren.dart';
import 'package:firebasegetex/view/widget/custem_button.dart';
import 'package:firebasegetex/view/widget/custem_text_form_filed.dart';
import 'package:firebasegetex/view/widget/custemtext.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegistreView extends GetWidget<AuthViewModel> {
  RegistreView({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: GestureDetector(
            onTap: () {
              Get.off(LoginScren());
            },
            child: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 50,
            right: 20,
            left: 20,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                CstumText(
                  text: "Sign Up",
                  fontSize: 30,
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomTextFormField(
                  text: 'Name',
                  hint: 'ouknik',
                  onSave: (value) {
                    controller.namee = value!;
                  },
                  validator: (value) {
                    if (value == null) {
                      print("ERROR");
                    }
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomTextFormField(
                  text: 'Email',
                  hint: 'oop@gmail.com',
                  onSave: (value) {
                    controller.emaill = value!;
                  },
                  validator: (value) {
                    if (value == null) {
                      print("ERROR");
                    }
                  },
                ),
                const SizedBox(
                  height: 40,
                ),
                CustomTextFormField(
                  text: 'Password',
                  hint: '**********',
                  onSave: (value) {
                    controller.passwordd = value!;
                  },
                  validator: (value) {
                    if (value == null) {
                      print('error');
                    }
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomButton(
                  onPress: () {
                    _formKey.currentState!.save();

                    if (_formKey.currentState!.validate()) {
                      controller.CreateCounWithEmailAndpassword();
                    }
                  },
                  text: 'SIGN Up',
                ),
                const SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
