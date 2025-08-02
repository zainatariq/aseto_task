
import 'package:flutter/material.dart';

class PaymentOptionButton extends StatelessWidget {
  final String text;
  final String imageUrl;
  final VoidCallback onPressed;

  const PaymentOptionButton({
    Key? key,
    required this.text,
    required this.imageUrl,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        minimumSize: const Size(double.infinity, 60),
        side: const BorderSide(color: Colors.indigo),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        backgroundColor: Colors.white,
      ),
      onPressed: onPressed,
      child: Row(
        children: [
          Image.asset(imageUrl, height: 30, width: 30,color: Colors.indigo,),
          const SizedBox(width: 16),
          Text(
            text,
            style: const TextStyle(color: Colors.indigo, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
