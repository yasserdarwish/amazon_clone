import 'package:flutter/material.dart';

class SingleProduct extends StatefulWidget {
  const SingleProduct({super.key, required this.image});
  final String image;
  @override
  State<SingleProduct> createState() => _SingleProductState();
}

class _SingleProductState extends State<SingleProduct> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black12, width: 1.5),
          borderRadius: BorderRadius.circular(5)),
      child: Image.network(
        widget.image,
        fit: BoxFit.fill,
        width: 180,
      ),
    );
  }
}
