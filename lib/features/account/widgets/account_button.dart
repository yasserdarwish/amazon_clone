import 'package:flutter/material.dart';

class AccountButton extends StatelessWidget {
  const AccountButton({super.key, required this.onPressed, required this.text});
  final VoidCallback onPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: OutlinedButton(
          style: ElevatedButton.styleFrom(
              padding: EdgeInsets.zero,
              minimumSize: const Size.fromHeight(40),
              backgroundColor: Colors.black12.withOpacity(0.03),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50))),
          onPressed: onPressed,
          child: Text(
            text,
            style: const TextStyle(color: Colors.black),
          ),
        ),
      ),
    );
  }
}
