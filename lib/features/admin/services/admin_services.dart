import 'dart:io';

import 'package:amazon_clone/constants/error_handling.dart';
import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/constants/utils.dart';
import 'package:amazon_clone/models/product_model.dart';
import 'package:amazon_clone/providers/user_provider.dart';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class AdminServices {
  void sellProduct({
    required BuildContext context,
    required String name,
    required String description,
    required String category,
    required double price,
    required int quantity,
    required List<File> images,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
      final cloudinary = CloudinaryPublic('dsskzrbtl', 'uqtxxn94');
      List<String> imagesUrls = [];

      for (var image in images) {
        CloudinaryResponse response = await cloudinary
            .uploadFile(CloudinaryFile.fromFile(image.path, folder: name));
        imagesUrls.add(response.secureUrl);
      }

      Product product = Product(
          name: name,
          description: description,
          category: category,
          price: price,
          quantity: quantity,
          images: imagesUrls);

      http.Response response = await http.post(
          Uri.parse('$baseUrl/admin/add-product'),
          body: product.toJson(),
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
            'x-auth-token': userProvider.user.token,
          });

      if (context.mounted) {
        httpErrorHandling(
            response: response,
            context: context,
            onSuccess: () {
              showSnackBar(context, 'Product added successfully');
              Navigator.pop(context);
            });
      }
    } catch (e) {
      if (context.mounted) {
        showSnackBar(context, e.toString());
      }
    }
  }
}
