import 'package:app1/models/cart_item.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

import 'clothes.dart';

class Shop extends ChangeNotifier {
  // list clothes
  final List<Clothes> _clothesList = [
    // jacket
    Clothes(
      name: "BAPE X Canada Goose Crofto Puffer",
      description: "Zip closure, Logo patch,Camo design",
      imagePath: "lib/images/jacket/jbape1.jpg",
      price: 1643,
      category: ClothesCategory.jacket,
      availableAddons: [
        Addon(name: "Army Green", price: 1.643),
        Addon(name: "Grey", price: 1.643),
      ],
    ),

    Clothes(
      name: "Liquid Camo Hoodie Jacket",
      description: "",
      imagePath: "lib/images/jacket/jbape2.jpg",
      price: 437,
      category: ClothesCategory.jacket,
      availableAddons: [
        Addon(name: "Blue", price: 437),
        Addon(name: "Black", price: 437),
      ],
    ),

    Clothes(
      name: "Warm Up Camo Shark Hoodie",
      description: "",
      imagePath: "lib/images/jacket/jbape3.jpg",
      price: 595,
      category: ClothesCategory.jacket,
      availableAddons: [
        Addon(name: "Pink", price: 595),
      ],
    ),

    Clothes(
      name: "Color Camo Snowboard Jacket",
      description: "",
      imagePath: "lib/images/jacket/jbape4.jpg",
      price: 772,
      category: ClothesCategory.jacket,
      availableAddons: [
        Addon(name: "Purple", price: 772),
        Addon(name: "Blue", price: 772),
      ],
    ),

    Clothes(
      name: "BAPE Varsity Jacket",
      description: "",
      imagePath: "lib/images/jacket/jbape5.jpg",
      price: 1207,
      category: ClothesCategory.jacket,
      availableAddons: [
        Addon(name: "Black", price: 1207),
      ],
    ),

    // pants
    Clothes(
      name: "City Camo Ape Head One Point Beach Shorts",
      description: "",
      imagePath: "lib/images/pants/pbape1.jpg",
      price: 245,
      category: ClothesCategory.pants,
      availableAddons: [
        Addon(name: "Grey", price: 245),
      ],
    ),

    Clothes(
      name: "BAPE Reversible Basketball Shorts",
      description: "",
      imagePath: "lib/images/pants/pbape2.jpg",
      price: 356,
      category: ClothesCategory.pants,
      availableAddons: [
        Addon(name: "Grey", price: 356),
      ],
    ),

    Clothes(
      name: "Shark Denim Shorts",
      description: "",
      imagePath: "lib/images/pants/pbape3.jpg",
      price: 345,
      category: ClothesCategory.pants,
      availableAddons: [
        Addon(name: "Grey", price: 345),
      ],
    ),

    Clothes(
      name: "Color Camo Shark Sweat Shorts",
      description: "",
      imagePath: "lib/images/pants/pbape4.jpg",
      price: 345,
      category: ClothesCategory.pants,
      availableAddons: [
        Addon(name: "Grey", price: 345),
      ],
    ),

    Clothes(
      name: "Color Camo Ape Head One Point Beach Shorts",
      description: "",
      imagePath: "lib/images/pants/pbape5.jpg",
      price: 345,
      category: ClothesCategory.pants,
      availableAddons: [
        Addon(name: "Grey", price: 345),
      ],
    ),

    //shirt
    Clothes(
      name: "Comic Art Open Collar S/S Shirt",
      description: "",
      imagePath: "lib/images/shirt/sbape1.jpg",
      price: 329,
      category: ClothesCategory.shirt,
      availableAddons: [
        Addon(name: "Army Green", price: 329),
      ],
    ),

    Clothes(
      name: "Ape Head One Point Check Shirt",
      description: "",
      imagePath: "lib/images/shirt/sbape2.jpg",
      price: 274,
      category: ClothesCategory.shirt,
      availableAddons: [
        Addon(name: "Black", price: 274),
      ],
    ),

    Clothes(
      name: "Acid Wash Work Shirt",
      description: "",
      imagePath: "lib/images/shirt/sbape3.jpg",
      price: 388,
      category: ClothesCategory.shirt,
      availableAddons: [
        Addon(name: "Denim", price: 388),
      ],
    ),

    Clothes(
      name: "1st Camo Baseball Shirt",
      description: "",
      imagePath: "lib/images/shirt/sbape4.jpg",
      price: 340,
      category: ClothesCategory.shirt,
      availableAddons: [
        Addon(name: "Yellow", price: 340),
      ],
    ),

    Clothes(
      name: "Color Camo CPO Shirt",
      description: "",
      imagePath: "lib/images/shirt/sbape5.jpg",
      price: 399,
      category: ClothesCategory.shirt,
      availableAddons: [
        Addon(name: "Purple", price: 399),
      ],
    ),

    // sneakers
    Clothes(
      name: "",
      description: "",
      imagePath: "lib/images/sneakers/snbape1.jpg",
      price: 123,
      category: ClothesCategory.sneakers,
      availableAddons: [
        Addon(name: "Army Green", price: 123),
      ],
    ),

    Clothes(
      name: "",
      description: "",
      imagePath: "lib/images/sneakers/snbape2.jpg",
      price: 123,
      category: ClothesCategory.sneakers,
      availableAddons: [
        Addon(name: "Army Green", price: 123),
      ],
    ),

    Clothes(
      name: "",
      description: "",
      imagePath: "lib/images/sneakers/snbape3.jpg",
      price: 123,
      category: ClothesCategory.sneakers,
      availableAddons: [
        Addon(name: "Army Green", price: 123),
      ],
    ),

    Clothes(
      name: "",
      description: "",
      imagePath: "lib/images/sneakers/snbape4.jpg",
      price: 123,
      category: ClothesCategory.sneakers,
      availableAddons: [
        Addon(name: "Army Green", price: 123),
      ],
    ),

    Clothes(
      name: "",
      description: "",
      imagePath: "lib/images/sneakers/snbape5.jpg",
      price: 123,
      category: ClothesCategory.sneakers,
      availableAddons: [
        Addon(name: "Army Green", price: 123),
      ],
    ),

    // tshirt
    Clothes(
      name: "",
      description: "",
      imagePath: "lib/images/tshirt/bape1.jpg",
      price: 1643,
      category: ClothesCategory.tshirt,
      availableAddons: [
        Addon(name: "Army Green", price: 1.643),
        Addon(name: "Grey", price: 1.643),
      ],
    ),

    Clothes(
      name: "",
      description: "",
      imagePath: "lib/images/tshirt/bape2.jpg",
      price: 437,
      category: ClothesCategory.tshirt,
      availableAddons: [
        Addon(name: "Blue", price: 437),
        Addon(name: "Black", price: 437),
      ],
    ),

    Clothes(
      name: "",
      description: "",
      imagePath: "lib/images/tshirt/bape3.jpg",
      price: 595,
      category: ClothesCategory.tshirt,
      availableAddons: [
        Addon(name: "Pink", price: 595),
      ],
    ),

    Clothes(
      name: "",
      description: "",
      imagePath: "lib/images/tshirt/bape4.jpg",
      price: 772,
      category: ClothesCategory.tshirt,
      availableAddons: [
        Addon(name: "Purple", price: 772),
        Addon(name: "Blue", price: 772),
      ],
    ),

    Clothes(
      name: "",
      description: "",
      imagePath: "lib/images/tshirt/bape5.jpg",
      price: 1207,
      category: ClothesCategory.tshirt,
      availableAddons: [
        Addon(name: "Black", price: 1207),
      ],
    ),
  ];
  /*
  GETTERS

  */
  List<Clothes> get clothes => _clothesList;
  List<CartItem> get cart => _cart;
  /*
  OPERATIONS

  */

  // user cart
  final List<CartItem> _cart = [];

  // add to cart
  void addToCart(Clothes clothes, List<Addon> selectedAddons) {
    // see if there is a cart item already with the same food and selected addons
    CartItem? cartItem = _cart.firstWhereOrNull((item) {
      // chech ssame item
      bool isSameClothes = item.clothes == clothes;

      // check same addon
      bool isSameAddons =
          ListEquality().equals(item.selectedAddons, selectedAddons);

      return isSameClothes && isSameAddons;
    });

    if (cartItem != null) {
      cartItem.quantity++;

      // otherwise
    } else {
      _cart.add(
        CartItem(
          clothes: clothes,
          selectedAddons: selectedAddons,
        ),
      );
    }
    notifyListeners();
  }

  // remove from cart
  void removeFromCart(CartItem cartItem) {
    int cartIndex = _cart.indexOf(cartItem);

    if (cartIndex != -1) {
      if (_cart[cartIndex].quantity > 1) {
        _cart[cartIndex].quantity--;
      } else {
        _cart.removeAt(cartIndex);
      }
    }

    notifyListeners();
  }

  // get total price of cart
  double getTotalPrice() {
    double total = 0.0;

    for (CartItem cartItem in _cart) {
      double itemTotal = cartItem.clothes.price;

      for (Addon addon in cartItem.selectedAddons) {
        itemTotal += addon.price;
      }
      total += itemTotal * cartItem.quantity;
    }

    return total;
  }

  // get total number of items in cart
  int getTotalItemCount() {
    int totalItemCount = 0;

    for (CartItem cartItem in _cart) {
      totalItemCount += cartItem.quantity;
    }

    return totalItemCount;
  }

  // clear cart
  void clearCart() {
    _cart.clear();
    notifyListeners();
  }

  /*
  HELPER

  */

  // generate a receipt

  // format double value into money

  // format list of addons into a string summary
}
