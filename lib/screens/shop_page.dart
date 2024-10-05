import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../repository/getshop_data_provider.dart';
import 'util/product_card.dart';

class ShopScreen extends StatefulWidget {
  @override
  _ShopScreenState createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  String _searchQuery = ''; 
  TextEditingController _searchController = TextEditingController(); 

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<ShopListNotifier>(context);

    return FutureBuilder(
      future: data.getShop(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No items found'));
        } else {
          final shopItems = snapshot.data;

         
          final filteredItems = shopItems!.where((item) {
            final titleLower = item.title.toLowerCase();
            final searchLower = _searchQuery.toLowerCase();
            return titleLower.contains(searchLower);
          }).toList();

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
               
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: GestureDetector(
                    onTap: () {
                       _searchController.clear();
                          setState(() {
                            _searchQuery = '';
                          });
                    },
                    child: TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        hintText: 'Search Store',
                       // prefixIcon: Icon(Icons.search),
                        border: InputBorder.none,
                        // suffixIcon: IconButton(
                        //   icon: Icon(Icons.clear),
                        //   onPressed: () {
                        //     _searchController.clear();
                        //     setState(() {
                        //       _searchQuery = '';
                        //     });
                        //   },
                        // ),
                      ),
                      onChanged: (query) {
                        setState(() {
                          _searchQuery = query; 
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(height: 20),
                
                Expanded(
                  child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.8,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: filteredItems.length,
                    itemBuilder: (context, index) {
                      final item = filteredItems[index];
                      return ProductCard(
                        title: item.category.toString(),
                        subtitle: item.id.toString(),
                        price: '\$${item.price}',
                        image: item.image, 
                        description: item!.description,

                      );
                    },
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}