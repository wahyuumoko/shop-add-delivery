import 'package:flutter/material.dart';

class MyReceipt extends StatelessWidget {
  const MyReceipt({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.only(left: 25, right: 25, bottom: 25),
    child: Column(
      children: [
        const Text("Thank you for your order!"),
        Container(
          decoration: BoxDecoration(
           border: 
           Border.all(color:Theme.of(context).colorScheme.secondary),
           borderRadius: BorderRadius.circular(8)
          ),
          padding: const EdgeInsets.all(25),
          child: const Text("Receipt here..."),
        ),
      ],
    ),
    );
  }
}