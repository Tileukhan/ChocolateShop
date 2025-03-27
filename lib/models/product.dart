class Product {
  final String name; // Название шоколада
  final double price; // Цена
  final String imageUrl; // Ссылка на изображение

  Product({required this.name, required this.price, required this.imageUrl});

  // Метод для преобразования данных из Firestore в объект Product
  factory Product.fromFirestore(Map<String, dynamic> data) {
    return Product(
      name: data['name'] ?? '',
      price: (data['price'] as num).toDouble() ?? 0.0,
      imageUrl: data['ImageUrl'] ?? '',
    );
  }
}
