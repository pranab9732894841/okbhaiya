import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:okbhaiya/models/Category.dart';

class DatabaseService {
  final CollectionReference categoryCollection =
      FirebaseFirestore.instance.collection('Category');
  final CollectionReference shopUser =
      FirebaseFirestore.instance.collection('shop');
  final CollectionReference businessCollection =
      FirebaseFirestore.instance.collection('Business');
  Stream<List<Category>> getAllCategory() {
    print('Call getAllCategory');
    return categoryCollection.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => Category.fromSnapshot(doc)).toList();
    });
  }

  Future getBusiness(String id) async {
    return await businessCollection.doc(id).get().then((value) => value.data());
  }
}
