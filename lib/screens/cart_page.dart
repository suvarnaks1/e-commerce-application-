import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../repository/cart_provider.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cart.itemCount,
              itemBuilder: (context, index) {
                final item = cart.items[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 150,
                    width: 34,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Align(
                            alignment: Alignment.topLeft,
                            child: Image.network(item.image,
                                height: 90, width: 90)),
                        Column(crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  item.name,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 16),
                                ),
                                IconButton(
                                    onPressed: () {
                  
                                      Provider.of<Cart>(context, listen: false)
                      .removeItem(index);
                  
                                    },
                                    icon: Icon(
                                      Icons.close,
                                      size: 20,
                                    ))
                              ],
                            ),
                            Text(item.description),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 120,
                                  height: 70,
                                  child: Row(
                                    children: [
                                      IconButton(
                                          onPressed: () {},
                                          icon: Icon(
                                            Icons.add_circle_outline,
                                            size: 30,
                                          )),
                                      Text('1'),
                                      IconButton(
                                          onPressed: () {},
                                          icon: Icon(
                                            Icons.remove_circle_outline,
                                            size: 30,
                                          ))
                                    ],
                                  ),
                                ),
                                Text(
                                  item.price,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 16),
                                )
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              height: 50,
              width: 300,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(10),
              ),
              alignment: Alignment.center,
              child: Row(
                children: [
                  SizedBox(
                    width: 90,
                  ),
                  Text(
                    'Go To Checkout',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                      height: 20,
                      width: 70,
                      color: Colors.grey,
                      child: Text(' \$${cart.totalAmount.toStringAsFixed(2)}')),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
