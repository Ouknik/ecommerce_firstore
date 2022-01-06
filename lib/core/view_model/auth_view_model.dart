import 'package:firebasegetex/core/services/firestor_user.dart';
import 'package:firebasegetex/model/user_model.dart';
import 'package:firebasegetex/view/auth/login_scren.dart';
import 'package:firebasegetex/view/controller_view.dart';
import 'package:firebasegetex/view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthViewModel extends GetxController {
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ["email"]);
  FirebaseAuth _auth = FirebaseAuth.instance;
  late String emaill, passwordd, namee;
  Rxn<User> _user = Rxn<User>();

  String? get user => _user.value?.email;
  var id;
  @override
  void onInit() {
    //ferst ready in your Code
    super.onInit();
    _user.bindStream(_auth.authStateChanges());
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> googleSignInMethode() async {
    try {
      GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      GoogleSignInAuthentication googleSignInAuthentication =
          await googleUser!.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken,
      );
      await _auth.signInWithCredential(credential);
    } catch (e) {}
  }

  Future<void> SgnInWithEmailAndPasswor() async {
    try {
      print(emaill);
      await _auth
          .signInWithEmailAndPassword(email: emaill, password: passwordd)
          .then((value) {
        id = value.user!.uid;
      });
      Get.offAll(HomeView());
    } catch (e) {
      Get.snackbar('ERROR', 'email', colorText: Colors.black);
      print(emaill.toString());
    }
  }

  Future<void> CreateCounWithEmailAndpassword() async {
    try {
      print(emaill);
      await _auth
          .createUserWithEmailAndPassword(email: emaill, password: passwordd)
          .then((user) async {
        await FirestorUser().adduserToFirestor(
          UserModel(
              email: user.user!.email.toString(),
              name: namee,
              pic: '',
              userId: user.user!.uid),
        );
      });
      Get.offAll(LoginScren());
    } catch (e) {
      Get.snackbar('ERROR', '${e.toString()}', colorText: Colors.black);
      print(emaill.toString());
    }
  }
}
