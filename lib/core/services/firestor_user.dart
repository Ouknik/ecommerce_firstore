import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebasegetex/model/user_model.dart';

class FirestorUser {
  final CollectionReference _usercollectionReference =
      FirebaseFirestore.instance.collection('Users');
  adduserToFirestor(UserModel userModel) async {
    return await _usercollectionReference
        .doc(userModel.userId)
        .set(userModel.toJson());
  }

  Future<List<QueryDocumentSnapshot>> getUser() async {
    var value = await _usercollectionReference.get();
    return value.docs;
  }
}
