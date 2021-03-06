import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  FirestoreService._();
  static final instance = FirestoreService._();

  Future<void> setData({
    required String path,
    required Map<String, dynamic> data,
  }) async {
    final documentReference = FirebaseFirestore.instance.doc(path);
    print('path===$path, data===$data');
    await documentReference.set(data);
  }

  Stream<List<T>> collectionStream<T>({
    required String path,
    required T Function(Map<String, dynamic> data, String documentId) builder,
  }) {
    final ref = FirebaseFirestore.instance.collection(path);
    final snapshot = ref.snapshots();

    return snapshot.map((snapshot) => snapshot.docs
        .map((snapshot) => builder(snapshot.data(), snapshot.id))
        .toList());
  }

  Future<void> deleteData({required String path}) async {
    final reference = FirebaseFirestore.instance.doc(path);
    print('delete $path');
    await reference.delete();
  }
}
