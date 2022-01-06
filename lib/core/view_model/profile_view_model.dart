import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasegetex/core/services/firestor_user.dart';
import 'package:firebasegetex/helpear/local_storage_data.dart';
import 'package:firebasegetex/model/user_model.dart';
import 'package:get/get.dart';

class ProfileViewModel extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  List<UserModel> get usersModel => _usersModel;
  late List<UserModel> _usersModel = [];
  bool _loding = false;

  getBestSellingProducts() async {
    _loding = true;
    FirestorUser().getUser().then((value) => {
          for (int i = 0; i < value.length; i++)
            {
              _usersModel.add(
                  UserModel.fromJson(value[i].data() as Map<String, dynamic>)),
              print(value[i].data()),
              _loding = false
            }
        });
    update();
  }

  Future<void> signOut() async {
    FirebaseAuth.instance.signOut();
  }
}
