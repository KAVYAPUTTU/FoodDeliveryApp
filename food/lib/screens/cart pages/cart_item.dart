class CartItem {
  final String img;
  final String title;
  final String subtitle;
  final double price;
  int quantity;

  CartItem({
    required this.img,
    required this.title,
    required this.subtitle,
    required this.price,
    this.quantity = 1,
  });
}