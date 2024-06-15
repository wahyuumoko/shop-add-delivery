import 'package:app1/components/my_button.dart';
import 'package:app1/models/clothes.dart';
import 'package:app1/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ClothesPage extends StatefulWidget {
  final Clothes clothes;
  final Map<Addon, bool> selectedAddons = {};

  ClothesPage({
    super.key,
    required this.clothes,
  }) {
    // initialize selected addons to be false
    for (Addon addon in clothes.availableAddons) {
      selectedAddons[addon] = false;
    }
  }

  @override
  State<ClothesPage> createState() => _ClothesPageState();
}

class _ClothesPageState extends State<ClothesPage> {
  // method add to cart
  void addToCart(Clothes clothes, Map<Addon, bool> selectedAddons) {
    Navigator.pop(context);

    List<Addon> currentlySelectedAddons = [];
    for (Addon addon in widget.clothes.availableAddons) {
      if (widget.selectedAddons[addon] == true) {
        currentlySelectedAddons.add(addon);
      }
    }
    // add to cart
    context.read<Shop>().addToCart(clothes, currentlySelectedAddons);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // scaffold UI
        Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                // clothes image
                Image.asset(widget.clothes.imagePath),

                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // clothes name
                      Text(
                        widget.clothes.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),

                      // clothes price
                      Text(
                        '\$${widget.clothes.price}',
                        style: TextStyle(
                            fontSize: 16,
                            color: Theme.of(context).colorScheme.primary),
                      ),

                      const SizedBox(height: 10),

                      // clothes description
                      Text(
                        widget.clothes.description,
                      ),

                      const SizedBox(height: 10),

                      Divider(color: Theme.of(context).colorScheme.secondary),

                      const SizedBox(height: 10),

                      // addons
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Theme.of(context).colorScheme.secondary),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.zero,
                          itemCount: widget.clothes.availableAddons.length,
                          itemBuilder: (context, index) {
                            // get individual addon
                            Addon addon = widget.clothes.availableAddons[index];

                            // return check box UI
                            return CheckboxListTile(
                              title: Text(addon.name),
                              subtitle: Text(
                                '\$${addon.price}',
                                style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                              ),
                              value: widget.selectedAddons[addon],
                              onChanged: (bool? value) {
                                setState(() {
                                  widget.selectedAddons[addon] = value!;
                                });
                              },
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),

                // button > add to cart
                MyButton(
                  onTap: () => addToCart(widget.clothes, widget.selectedAddons),
                  text: "Add to cart",
                ),

                const SizedBox(height: 25),
              ],
            ),
          ),
        ),

        // back button
        SafeArea(
          child: Opacity(
            opacity: 1,
            child: Container(
              margin: const EdgeInsets.only(left: 25),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
