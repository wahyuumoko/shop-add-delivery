import 'package:app1/components/my_cart_tile.dart';
import 'package:flutter/material.dart';
import 'package:app1/models/shop.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Shop>(
      builder: (context, shop, child) {
        // cart
        final userCart = shop.cart;

        // scaffold UI
        return Scaffold(
          appBar: AppBar(
            title: const Text("Cart"),
            backgroundColor: Colors.transparent,
            foregroundColor: Theme.of(context).colorScheme.inversePrimary,
            actions: [
              // clear cart button
              IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  showDialog(
                    context: context, 
                    builder: (context) => AlertDialog(
                      title: const Text("Are you sure you want to clear?"),
                      actions: [
                        // cancel button
                        TextButton(
                          onPressed: () => Navigator.pop(context), 
                          child: const Text("Cancel"),
                        ),
                        // yes button
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            shop.clearCart();
                          }, 
                          child: const Text("Yes"),
                        ),
                      ],
                    ),
                  );
                },
              ),
              // checkout button
              IconButton(
                onPressed: () {}, 
                icon: const Icon(Icons.check),
              ),
            ],
          ),
          body: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: userCart.length,
                  itemBuilder: (context, index) {
                    final cartItem = userCart[index];

                    return MyCartTile(cartItem: cartItem);
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
