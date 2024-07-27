import 'package:flutter/material.dart';

class MyReceipt extends StatelessWidget {
  const MyReceipt({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.only(left: 25, right: 25, bottom: 25),
    child: Column(
      children: [
        Text("Thank you for your order!"),
        Container(
          child: Text("Receipt here..."),
        ),
      ],
    ),
    );
  }
}