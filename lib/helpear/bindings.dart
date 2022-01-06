//mport 'package:firebasegetex/core/services/view_model/auth_view_model.dart';
import 'package:firebasegetex/core/view_model/auth_view_model.dart';
import 'package:firebasegetex/core/view_model/cart_view_model.dart';
import 'package:firebasegetex/core/view_model/controller_view_model.dart';
import 'package:firebasegetex/core/view_model/home_view_model.dart';
import 'package:firebasegetex/helpear/local_storage_data.dart';
import 'package:get/get.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthViewModel());
    Get.lazyPut(() => ControllerViewModel());
    Get.lazyPut(() => HomeViewModel());
    Get.lazyPut(() => CartViewModel());
    Get.lazyPut(() => LocalStorageData());
  }
}
