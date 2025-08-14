import 'package:flutter/material.dart';
import 'cart_item.dart';

class CartScreenDetails extends StatefulWidget {
  final List<CartItem> cartItems;

  const CartScreenDetails({
    super.key,
    required this.cartItems,
  });

  @override
  State<CartScreenDetails> createState() => _CartScreenDetailsState();
}

class _CartScreenDetailsState extends State<CartScreenDetails> {
  double get totalPrice {
    return widget.cartItems
        .fold(0, (sum, item) => sum + item.price * item.quantity);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
  children: [
    Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 30),
            Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.grey.shade300,
                  foregroundColor: Colors.black,
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.chevron_left),
                  ),
                ),
                const SizedBox(width: 10),
                const Text(
                  'Cart',
                  style: TextStyle(
                      fontFamily: 'Sen', fontSize: 17, color: Colors.white),
                ),
                const Spacer(),
                const Text(
                  'EDIT ITEMS',
                  style: TextStyle(
                      fontFamily: 'Sen', fontSize: 14, color: Colors.red),
                )
              ],
            ),

            // Cart items list
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: widget.cartItems.length,
              itemBuilder: (context, index) {
                final item = widget.cartItems[index];
                return CartItems(
                  cartItem: item,
                  onQuantityChanged: (newQuantity) {
                    setState(() {
                      item.quantity = newQuantity;
                    });
                  },
                );
              },
            ),
            const SizedBox(height: 320),
          ],
        ),
      ),
    ),

    Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 300,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Column(
            children: [
              Row(
                children: const [
                  Text(
                    'DELIVERY ADDRESS',
                    style: TextStyle(
                        fontSize: 14, fontFamily: 'Sen', color: Colors.grey),
                  ),
                  Spacer(),
                  Text(
                    'EDIT',
                    style: TextStyle(
                        fontSize: 14, fontFamily: 'Sen', color: Colors.red),
                  )
                ],
              ),
              const SizedBox(height: 20),
              const Textfield(hinttext: 'Address'),
              const SizedBox(height: 20),
              Row(
                children: [
                  const Text(
                    'TOTAL:',
                    style: TextStyle(
                        fontSize: 14, fontFamily: 'Sen', color: Colors.grey),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    '\$${totalPrice.toStringAsFixed(2)}',
                    style: const TextStyle(
                        fontSize: 30, fontFamily: 'Sen', color: Colors.black),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Button(text: 'PLACE ORDER', ontap: () {})
            ],
          ),
        ),
      ),
    )
  ],
),

    );
  }
}

class CartItems extends StatelessWidget {
  final CartItem cartItem;
  final Function(int) onQuantityChanged;

  const CartItems({
    super.key,
    required this.cartItem,
    required this.onQuantityChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.black,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Container(
              height: 130,
              width: 140,
              decoration: BoxDecoration(
                  color: Colors.grey.shade800,
                  borderRadius: BorderRadius.circular(20)),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    cartItem.img,
                    fit: BoxFit.contain,
                  )),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(cartItem.title, style: _itemTextStyle),
                  Text(cartItem.subtitle, style: _itemTextStyle),
                  const SizedBox(height: 10),
                
                  Row(
                    children: [
                        Text(
                      '\$${(cartItem.price * cartItem.quantity).toStringAsFixed(2)}',
                      style: _priceStyle),
                  Spacer(),
                      SizedBox(
                        height: 25,
                        width: 25,
                        child: FloatingActionButton(
                          onPressed: () {
                            if (cartItem.quantity > 1) {
                              onQuantityChanged(cartItem.quantity - 1);
                            }
                          },
                          backgroundColor: Colors.grey.shade800,
                          foregroundColor: Colors.white,
                          child: const Icon(Icons.remove, size: 18),
                        ),
                      ),
                      const SizedBox(width: 15),
                      Text('${cartItem.quantity}',
                          style: const TextStyle(color: Colors.white)),
                      const SizedBox(width: 15),
                      SizedBox(
                        height: 25,
                        width: 25,
                        child: FloatingActionButton(
                          onPressed: () {
                            onQuantityChanged(cartItem.quantity + 1);
                          },
                          backgroundColor: Colors.grey.shade800,
                          foregroundColor: Colors.white,
                          child: const Icon(Icons.add, size: 18),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  TextStyle get _itemTextStyle =>
      const TextStyle(fontSize: 18, fontFamily: 'sen', color: Colors.white);

  TextStyle get _priceStyle => const TextStyle(
      fontFamily: 'Sen',
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Colors.white);
}

class Textfield extends StatelessWidget {
  final String hinttext;
  final Icon? icon;
  final Icon? prefixicon;
  const Textfield(
      {super.key, required this.hinttext, this.icon, this.prefixicon});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: hinttext,
        suffixIcon: icon,
        prefixIcon: prefixicon,
        hintStyle: TextStyle(
          color: Colors.black54,
          fontFamily: 'sen',
        ),
        filled: true,
        fillColor: Color(0xFFF0F4F8),
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 18),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
      style: TextStyle(color: Colors.black),
    );
  }
}

class Button extends StatelessWidget {
  final String text;
  final VoidCallback ontap;
  const Button({super.key, required this.text, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              padding: EdgeInsets.all(22),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              backgroundColor: Color(0xFFFF7622)),
          onPressed: ontap,
          child: Text(
            text,
            style: TextStyle(color: Colors.white, fontFamily: 'sen'),
          )),
    );
  }
}


