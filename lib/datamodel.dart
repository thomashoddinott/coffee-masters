class Product {
  // Properties
  int id;
  String name;
  double price;
  String image;

  // Get-only * property
  String get imageUrl =>
      "https://firtman.github.io/coffeemasters/api/images/$image";

  // Constructor
  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
    // * No need to set imageUrl here
  });
}

class Category {
  String name;
  List<Product> products;

  Category({required this.name, required this.products});
}

class ItemInCart {
  Product product;
  int quantity;
  ItemInCart({required this.product, required this.quantity});
}
