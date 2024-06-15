import 'package:app1/components/my_quantity_selector.dart';
import 'package:flutter/material.dart';
import 'package:app1/models/cart_item.dart';
import 'package:app1/models/shop.dart';
import 'package:provider/provider.dart';

class MyCartTile extends StatelessWidget {
  final CartItem cartItem;

  const MyCartTile({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return Consumer<Shop>(
      builder: (context, shop, child) => Container(
        child: Column(
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    cartItem.clothes.imagePath,
                    height: 100,
                    width: 100,
                  ),
                ),

                const SizedBox(width: 10),

                //  name and price
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // clothes name
                    Column(
                      children: [
                        Text(cartItem.clothes.name),

                        // clothes price
                        Text('\$' + cartItem.clothes.price.toString()),
                      ],
                    ),

                    // increment or decrement quantity
                    QuantitySelector(
                      quantity: cartItem.quantity,
                      clothes: cartItem.clothes,
                      onDecrement: () {
                        shop.removeFromCart(cartItem);
                      },
                      onIncrement: () {
                        shop.addToCart(
                            cartItem.clothes, cartItem.selectedAddons);
                      },
                    )
                  ],
                )
              ],
            ),
            // addons
          ],
        ),
      ),
    );
  }
}
