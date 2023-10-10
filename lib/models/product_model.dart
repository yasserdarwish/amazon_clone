import 'dart:convert';

class Product {
  final String name;
  final String description;
  final String category;
  final double price;
  final int quantity;
  final List<String> images;
  String? id;

  Product({
    required this.name,
    required this.description,
    required this.category,
    required this.price,
    required this.quantity,
    required this.images,
    this.id,
  });

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      category: map['category'] ?? '',
      price: map['price'] ?? 0.0,
      quantity: map['quantity'] ?? 0,
      images: List<String>.from(map['images']),
      id: map['_id'],
    );
  }

  factory Product.fromJson(String source) =>
      Product.fromMap(jsonDecode(source));

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'category': category,
      'price': price,
      'quantity': quantity,
      'images': images,
      'id': id,
    };
  }

  String toJson() => jsonEncode(toMap());
}
