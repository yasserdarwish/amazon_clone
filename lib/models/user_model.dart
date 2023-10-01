import 'dart:convert';

class User {
  final String id;
  final String name;
  final String email;
  final String password;
  final String type;
  final String address;
  final String token;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.type,
    required this.address,
    required this.token,
  });

  Map<String, dynamic> toMap() {
    return {
      '_id': id,
      'name': name,
      'email': email,
      'password': password,
      'type': type,
      'address': address,
      'token': token,
    };
  }

  String toJson() => jsonEncode(toMap());

  factory User.fromJson(Map<String, dynamic> user) {
    return User(
      id: user['_id'] ?? '',
      name: user['name'] ?? '',
      email: user['email'] ?? '',
      password: user['password'] ?? '',
      type: user['type'] ?? '',
      address: user['address'] ?? '',
      token: user['token'] ?? '',
    );
  }
}
