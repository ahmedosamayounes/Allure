import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class HomeService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Stream<QuerySnapshot> getProducts() {
    return _db.collection('products').snapshots();
  }

  Future<String> getImageUrl(String path) {
    return _storage.ref(path).getDownloadURL();
  }
}