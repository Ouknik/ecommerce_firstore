import 'package:cloud_firestore/cloud_firestore.dart';

class HomeService {
  final CollectionReference _categorycollectionReference =
      FirebaseFirestore.instance.collection('Category');

  final CollectionReference _ProductscollectionReference =
      FirebaseFirestore.instance.collection('Products');

  Future<List<QueryDocumentSnapshot>> getCategory() async {
    var value = await _categorycollectionReference.get();
    return value.docs;
  }

  Future<List<QueryDocumentSnapshot>> getBestSelling() async {
    var value = await _ProductscollectionReference.get();
    return value.docs;
  }
}
