import 'package:flutter/material.dart';

class ProductDetailScreen extends StatelessWidget {
  final String title;
  final String subtitle;
  final String price;
  final String image;

  const ProductDetailScreen({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite_border, color: Colors.black),
            onPressed: () {}, // Add functionality if needed
          ),
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Product Image
                  Center(
                    child: Image.network(
                      image, // Use the passed image URL
                      height: 200,
                    ),
                  ),
                  SizedBox(height: 20),
                  // Product Info
                  Text(
                    title, // Use the passed title
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    subtitle, // Use the passed subtitle
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(height: 10),
                  // Price
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Quantity Selector
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              // Implement decrease quantity
                            },
                            icon: Icon(Icons.remove_circle_outline),
                          ),
                          Text('1', style: TextStyle(fontSize: 16)), // Update based on actual quantity
                          IconButton(
                            onPressed: () {
                              // Implement increase quantity
                            },
                            icon: Icon(Icons.add_circle_outline),
                          ),
                        ],
                      ),
                      // Price
                      Text(
                        price, // Use the passed price
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.green),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  // Product Detail Section
                  ExpansionTile(
                    title: Text('Product Detail'),
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          'Apples are nutritious. Apples may be good for weight loss. Apples may be good for your heart as part of a healthful and varied diet.',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                  ExpansionTile(
                    title: Text('Nutritions'),
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          'Nutrition details for this product will be displayed here.',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                  ExpansionTile(
                    title: Text('Review'),
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Row(
                          children: [
                            Text('5.0'),
                            SizedBox(width: 10),
                            Icon(Icons.star, color: Colors.yellow, size: 20),
                            Icon(Icons.star, color: Colors.yellow, size: 20),
                            Icon(Icons.star, color: Colors.yellow, size: 20),
                            Icon(Icons.star, color: Colors.yellow, size: 20),
                            Icon(Icons.star, color: Colors.yellow, size: 20),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 80), // Adjusted space for the container
                ],
              ),
            ),
          ),
          // Add to Basket Container
          Positioned(
            bottom: 16, // Space from bottom
            left: 16, // Space from left
            right: 16, // Space from right
            child: GestureDetector(
              onTap: () {
                // Add functionality to add product to the basket
              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.green, // Background color
                  borderRadius: BorderRadius.circular(10), // Rounded corners
                ),
                alignment: Alignment.center,
                child: Text(
                  'Add To Basket',
                  style: TextStyle(fontSize: 18, color: Colors.white), // Text style
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
