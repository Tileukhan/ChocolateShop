// lib/services/product_service.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/product.dart';

class ProductService {
  Stream<List<Product>> getProducts() {
    return FirebaseFirestore.instance
        .collection('products')
        .snapshots()
        .map(
          (snapshot) =>
              snapshot.docs
                  .map((doc) => Product.fromMap(doc.data(), doc.id))
                  .toList(),
        );
  }
}
