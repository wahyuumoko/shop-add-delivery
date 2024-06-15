import 'package:app1/models/clothes.dart';
import 'package:flutter/material.dart';

class ClothesTile extends StatelessWidget {
  final Clothes clothes;
  final void Function()? onTap;

  const ClothesTile({
    super.key,
    required this.clothes,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                // text food detail
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(clothes.name),
                      Text(
                        '\$' + clothes.price.toString(),
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        clothes.description,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(width: 15),

                // food image
                ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(clothes.imagePath, height: 120)),
              ],
            ),
          ),
        ),

        // divider line
        Divider(
          color: Theme.of(context).colorScheme.tertiary,
          endIndent: 25,
          indent: 25,
        )
      ],
    );
  }
}
