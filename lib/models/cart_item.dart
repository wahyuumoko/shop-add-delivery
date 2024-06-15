import 'package:app1/models/clothes.dart';

class CartItem {
  Clothes clothes;
  List<Addon> selectedAddons;
  int quantity;

  CartItem({
    required this.clothes,
    required this.selectedAddons,
    this.quantity = 1,
  });

  double get totalPrice {
    double addonsPrice =
        selectedAddons.fold(0, (sum, addon) => sum + addon.price);
    return (clothes.price + addonsPrice) * quantity;
  }
}
