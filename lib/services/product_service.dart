import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/product.dart';

class ProductService {
  final CollectionReference _productsCollection = FirebaseFirestore.instance
      .collection('products');

  Stream<List<Product>> getProducts() {
    return _productsCollection.snapshots().map((snapshot) {
      print(snapshot.docs.map((doc) => doc.data()));
      return snapshot.docs
          .map(
            (doc) => Product.fromFirestore(doc.data() as Map<String, dynamic>),
          )
          .toList();
    });
  }
}
