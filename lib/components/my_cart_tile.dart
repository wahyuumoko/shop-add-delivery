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
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(8),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                  // name and price
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        // clothes name
                        Text(cartItem.clothes.name),
                        // clothes price
                        Text(
                          '\$' + cartItem.clothes.price.toString(),
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.primary),
                        ),
                        const SizedBox(height: 10),
                        // increment or decrement quantity
                        QuantitySelector(
                          quantity: cartItem.quantity,
                          clothes: cartItem.clothes,
                          onDecrement: () {
                            shop.removeFromCart(cartItem);
                          },
                          onIncrement: () {
                            shop.addToCart(cartItem.clothes, cartItem.selectedAddons);
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // addons
            SizedBox(
              height: cartItem.selectedAddons.isEmpty ? 0 : 60,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                children: cartItem.selectedAddons
                    .map(
                      (addon) => Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: FilterChip(
                          label: Row(
                            children: [
                              // addons name
                              Text(addon.name),
                              // addons price
                              Text(' (\$${addon.price})'),
                            ],
                          ),
                          shape: StadiumBorder(
                              side: BorderSide(
                                  color: Theme.of(context).colorScheme.primary)),
                          onSelected: (value) {},
                          backgroundColor:
                              Theme.of(context).colorScheme.secondary,
                          labelStyle: TextStyle(
                            color: Theme.of(context).colorScheme.inversePrimary,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
