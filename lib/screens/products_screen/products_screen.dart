import 'package:delivery_app/constants.dart';
import 'package:delivery_app/models/product.dart';
import 'package:delivery_app/providers/products_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'product_details_screen.dart';

class ProductsScreen extends StatelessWidget {
  final String storeName;

  const ProductsScreen({super.key, required this.storeName});

  // final List<Map<String, dynamic>> products = [
  //   {
  //     'name': 'Boston Lettuce',
  //     'image': 'https://www.thespruceeats.com/thmb/xna3brlTYvIfpbzwrqhoHKzHKn0=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/what-is-butter-lettuce-4773670-hero-06-0b9d54128b3e48e081015e17b5764c39.jpg',
  //     'price': '1.10 €/piece',
  //     'description': 'Fresh Boston Lettuce, perfect for your salads!',
  //   },
  //   {
  //     'name': 'Purple Cauliflower',
  //     'image': 'https://m.media-amazon.com/images/I/71yTV1+FI0L.jpg',
  //     'price': '1.85 €/kg',
  //     'description': 'Exotic purple cauliflower, rich in antioxidants.',
  //   },
  //   {
  //     'name': 'Savoy Cabbage',
  //     'image': 'https://media-cdn2.greatbritishchefs.com/media/yrkhs1dh/img12504.whqc_1426x713q80.jpg',
  //     'price': '1.45 €/kg',
  //     'description': 'Crunchy savoy cabbage, ideal for your recipes.',
  //   },
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$storeName Products'),
        backgroundColor: kPrimaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Consumer<ProductsProvider>(
          builder:
              (BuildContext context, ProductsProvider value, Widget? child) =>
                  Column(
            children: [
              // Search Bar
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextField(
                  controller: value.searchController,
                  decoration: InputDecoration(
                    hintText: 'Search products',
                    prefixIcon: IconButton(
                      icon: const Icon(Icons.search), 
                      onPressed: () => value.searchForProductAsync(value.searchController.text),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              // List of Products
              Expanded(
                child: ListView.builder(
                  itemCount:  value.items.length,
                  itemBuilder: (BuildContext context, int index) =>
                      _buildProductCard(context, value.items[index]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProductCard(BuildContext context, Product product) {
    return Card(
      elevation: 10,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: InkWell(
        onTap: () {
          // Navigate to ProductDetailsScreen
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductDetailsScreen(product: product),
            ),
          );
        },
        child: Container(
          height: 120,
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              // Product Image
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  product.image ?? 'https://via.placeholder.com/150',
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 16),
              // Product Name
              Expanded(
                child: Text(
                  product.name ?? "Product Name",
                  style: const TextStyle(
                    color: kPrimaryColor,
                   // fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
