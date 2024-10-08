import 'package:flutter/material.dart';
import 'package:futurelabinterviewapp/screens/cart_page.dart';
import 'package:provider/provider.dart';

import '../repository/cart_provider.dart';
import 'util/green_container.dart';

class ProductDetailScreen extends StatelessWidget {
  final String title;
  final String subtitle;
  final String price;
  final String image;
  final String description;

  const ProductDetailScreen(
      {Key? key,
      required this.title,
      required this.subtitle,
      required this.price,
      required this.image,
      required this.description, required String rating})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.ios_share, color: Colors.black),
            onPressed: () {},
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
                  Center(
                    child: Image.network(
                      image,
                      height: 200,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                        icon: const Icon(Icons.favorite_border,
                            color: Colors.black),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  Text(
                    subtitle,
                    style: const TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.remove),
                          ),
                          Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: Colors.black,
                                width: 1,
                              ),
                            ),
                            child: const Center(
                                child:
                                    Text('1', style: TextStyle(fontSize: 16))),
                          ),
                          IconButton(
                            onPressed: () {
                             
                            },
                            icon: const Icon(Icons.add),
                          ),
                        ],
                      ),
                      Text(
                        price,
                        style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const ExpansionTile(
                    title: Text('Product Detail'),
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          'Apples are nutritious. Apples may be good for weight loss. Apples may be good for your heart as part of a healthful and varied diet.',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                  const ExpansionTile(
                    title: Text('Nutritions'),
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          'Nutrition details for this product will be displayed here.',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                  const ExpansionTile(
                    title: Text('Review'),
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Row(
                          children: [
                            Text('5.0'),
                            SizedBox(width: 10),
                            Icon(Icons.star, color: Colors.orange, size: 20),
                            Icon(Icons.star, color: Colors.orange, size: 20),
                            Icon(Icons.star, color: Colors.orange, size: 20),
                            Icon(Icons.star, color: Colors.orange, size: 20),
                            Icon(Icons.star, color: Colors.orange, size: 20),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 80),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 16,
            left: 16,
            right: 16,
            child: GreenContainer(
              onTap: () {
                Provider.of<Cart>(context, listen: false)
                    .addItem(title, subtitle, price, image, description);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('$title added to the cart')),
                );
              },
              text: 'Add To Basket',
            ),
          ),
        ],
      ),
    );
  }
}
