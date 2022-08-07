// https://javiercbk.github.io/json_to_dart/
// ==> generates factory methods from json schema

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

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
        id: json['id'] as int,
        name: json['name'] as String,
        price: json['price'] as double,
        image: json['image'] as String);
  }
}

class CategoryModel {
  String name;
  List<Product> products;

  CategoryModel({required this.name, required this.products});

  // Add this in class Category
  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    var productsJson = json['products'] as Iterable<dynamic>;
    var products = productsJson.map((p) => Product.fromJson(p)).toList();
    return CategoryModel(name: json['name'] as String, products: products);
  }
}

class ItemInCart {
  Product product;
  int quantity;
  ItemInCart({required this.product, required this.quantity});
}
