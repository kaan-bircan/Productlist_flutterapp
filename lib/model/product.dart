class Product {
  String name = "";
  double price = 0;
  double discount;
  String? image;

  Product(
      {required this.name, required this.price, this.discount = 0, this.image});

  @override
  String toString() => '$image $name $price';
}
