import 'package:delivery_app/constants.dart';
import 'package:delivery_app/models/product.dart';
import 'package:delivery_app/screens/cart_screen/cart_screen.dart';
import 'package:delivery_app/screens/products_screen/widgets/addTo_cart_botton.dart';
import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatelessWidget {
  final Product product;

  const ProductDetailsScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          product.name ?? 'Product Name',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        backgroundColor: kPrimaryColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              // Product Image
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: Image.network(
                    product.image ?? 'https://via.placeholder.com/150',
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // Product Name
              Text(
                product.name ?? 'Product Name',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: kPrimaryColor,
                ),
              ),
              const SizedBox(height: 8),
              // Product Price
              Text(
                'price : ',
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.grey,
                ),
              ),
              Text(
                '${product.price}' ?? '\$\$',
                style: TextStyle(
                  fontSize: 13,
                ),
              ),
              const SizedBox(height: 12),
              // Product Description
              Text(
                'description : ',
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.grey,
                ),
              ),
              Text(
                product.description ?? 'Product description',
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.grey[800],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              // Add to Cart Button
              AddtoCartBotton(
                product: product,
              )
            ],
          ),
        ),
      ),
    );
  }
}
