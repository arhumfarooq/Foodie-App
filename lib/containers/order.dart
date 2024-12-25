import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Order extends StatefulWidget {
  const Order({super.key});

  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          TextField(
            decoration: InputDecoration(
                suffix: Icon(Icons.qr_code_scanner),
                hintText: 'Your order',
                hintStyle: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.white)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.white))),
          )
        ],
      ),
    );
  }
}
