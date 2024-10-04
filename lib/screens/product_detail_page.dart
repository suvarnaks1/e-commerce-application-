import 'package:flutter/material.dart';

class ProductDetailScreen extends StatelessWidget {
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
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image
            Center(
              child: Image.asset(
                'assets/apple.png', // Replace with actual image
                height: 200,
              ),
            ),
            SizedBox(height: 20),
            // Product Info
            Text(
              'Naturel Red Apple',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Text(
              '1kg, Priceg',
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
                      onPressed: () {},
                      icon: Icon(Icons.remove_circle_outline),
                    ),
                    Text('1', style: TextStyle(fontSize: 16)),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.add_circle_outline),
                    ),
                  ],
                ),
                // Price
                Text(
                  '\$4.99',
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
            SizedBox(height: 20),
            // Add to Basket Button
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'Add To Basket',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
