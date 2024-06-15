// clothes item
class Clothes {
  final String name; // 3D Art Ape Head Tee
  final String description; // Graphic print
  final String imagePath; // lib/images/jacket/jbape1.jpg
  final double price; // US$117.00
  final ClothesCategory category; // tshirt
  List<Addon> availableAddons; // [white, black]

  Clothes({
    required this.name,
    required this.description,
    required this.imagePath,
    required this.price,
    required this.category,
    required this.availableAddons,
  });
}

// clothes category
enum ClothesCategory {
  jacket,
  pants,
  shirt,
  sneakers,
  tshirt,
}

// clothes addons
class Addon {
  String name;
  double price;

  Addon({
    required this.name,
    required this.price,
  });
}
