import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   elevation: 0,
      //   leading: IconButton(
      //     icon: Icon(Icons.arrow_back, color: Colors.black),
      //     onPressed: () {
      //       Navigator.pop(context);
      //     },
      //   ),
      //   title: Text(
      //     'My Cart',
      //     style: TextStyle(color: Colors.black),
      //   ),
      //   centerTitle: true,
      // ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  CartItem(
                      name: 'Bell Pepper Red',
                      quantity: '1kg, Price',
                      price: '\$4.99',
                      image: 'assets/bell_pepper.png'),
                  CartItem(
                      name: 'Egg Chicken Red',
                      quantity: '4pcs, Price',
                      price: '\$1.99',
                      image: 'assets/egg.png'),
                  CartItem(
                      name: 'Organic Bananas',
                      quantity: '12kg, Price',
                      price: '\$3.00',
                      image: 'assets/banana.png'),
                  CartItem(
                      name: 'Ginger',
                      quantity: '250gm, Price',
                      price: '\$2.99',
                      image: 'assets/ginger.png'),
                ],
              ),
            ),
            // Go to Checkout Button
            Container(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total: \$12.96',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.green),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                 
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      child: Text(
                        'Go to Checkout',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.store),
            label: 'Shop',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favourite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Account',
          ),
        ],
        currentIndex: 2, // Cart selected
      ),
    );
  }
}

class CartItem extends StatelessWidget {
  final String name;
  final String quantity;
  final String price;
  final String image;

  const CartItem({
    Key? key,
    required this.name,
    required this.quantity,
    required this.price,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Product Image
          Image.asset(
            image,
            height: 50,
            width: 50,
          ),
          // Product Details
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(quantity, style: TextStyle(color: Colors.grey)),
            ],
          ),
          // Quantity Selector
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.remove_circle_outline),
              ),
              Text('1'),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.add_circle_outline),
              ),
            ],
          ),
          // Price
          Text(
            price,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          // Delete Item Icon
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.close),
          ),
        ],
      ),
    );
  }
}
