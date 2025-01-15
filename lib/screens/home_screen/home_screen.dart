import 'package:delivery_app/constants.dart';
import 'package:delivery_app/models/product.dart';
import 'package:delivery_app/providers/stores_provider.dart';
import 'package:delivery_app/screens/cart_screen/cart_screen.dart';
import 'package:delivery_app/screens/home_screen/widgets/navigatorBar.dart';
import 'package:delivery_app/screens/info_personal/info_personal_screen.dart';
import 'package:delivery_app/screens/products_screen/product_details_screen.dart';
import 'package:delivery_app/screens/stores_screen/stores_screen.dart';
import 'package:delivery_app/services/get_top3.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static String id = "home";

  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int categoryHome = 1;

  int categoryFood = 2;

  final List<Product> vegetables = [
    Product(
      id: 1,
      name: 'Boston Lettuce',
      price: '1.10 €/piece',
      description: 'Fresh Boston Lettuce, perfect for your salads!',
      storeId: 0,
      image:
          'https://www.thespruceeats.com/thmb/xna3brlTYvIfpbzwrqhoHKzHKn0=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/what-is-butter-lettuce-4773670-hero-06-0b9d54128b3e48e081015e17b5764c39.jpg',
      quantity: 10,
    ),
    Product(
      id: 2,
      name: 'Purple Cauliflower',
      price: '1.85 €/kg',
      description: 'Exotic purple cauliflower, rich in antioxidants.',
      storeId: 0,
      image: 'https://m.media-amazon.com/images/I/71yTV1+FI0L.jpg',
      quantity: 10,
    ),
    Product(
      id: 3,
      name: 'Savoy Cabbage',
      price: '1.45 €/kg',
      description: 'Crunchy savoy cabbage, ideal for your recipes.',
      storeId: 0,
      image:
          'https://media-cdn2.greatbritishchefs.com/media/yrkhs1dh/img12504.whqc_1426x713q80.jpg',
      quantity: 10,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Image.network(
            //     'https://i.pinimg.com/736x/a9/63/1c/a9631c393aa4718a29fcf07ff81b2741.jpg'),
            Image.asset('assets/home_screen.jpg'),
            const SizedBox(height: 20),
            const Text(
              'Category :',
              style: TextStyle(
                fontSize: 18,
                color: kPrimaryColor,
              ),
            ),
            // Category Images
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildCategoryImage(
                      context, 'Home Furniture', 1, Icons.weekend),
                  _buildCategoryImage(context, 'Foods', 2, Icons.restaurant),
                ],
              ),
            ),
            const SizedBox(height: 14),
            // Top Products Text
            const Text(
              'Top 3 Products :',
              style: TextStyle(
                fontSize: 18,
                // fontWeight: FontWeight.bold,
                color: kPrimaryColor,
              ),
            ),
            const SizedBox(height: 10),
            // Top 3 Vegetables
            FutureBuilder<List<Product>>(
                future: GetTop3().getTop3(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<Product> products3 = snapshot.data!;
                    return Flexible(
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: products3.length,
                        itemBuilder: (context, index) {
                          return _buildVegetableCard(context, products3[index]);
                        },
                      ),
                    );
                  } else {
                    return Flexible(
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: vegetables.length,
                        itemBuilder: (context, index) {
                          return _buildVegetableCard(
                              context, vegetables[index]);
                        },
                      ),
                    );
                  }
                })
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryImage(BuildContext context, String categoryName,
      int? categoryId, dynamic icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: GestureDetector(
        onTap: () async {
          if (categoryId == null) {
            return;
          }
          await Provider.of<StoresProvider>(context, listen: false)
              .getStoresByCategoryIdAsync(categoryId);

          // Navigate to the corresponding store screen
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => StoresScreen(categoryName: categoryName),
            ),
          );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 80,
              height: 80,
              child: Card(
                color: Colors.grey.shade200,
                margin: EdgeInsets.all(10),
                child: Icon(
                  icon,
                  color: kPrimaryColor,
                ),
              ),
            ),
            const SizedBox(height: 2),
            Text(categoryName,
                style: const TextStyle(
                  fontSize: 10,
                )),
          ],
        ),
      ),
    );
  }

  Widget _buildVegetableCard(BuildContext context, Product vegetable) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: InkWell(
        onTap: () {
          // Navigate to ProductDetailsScreen
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductDetailsScreen(product: vegetable),
            ),
          );
        },
        child: Container(
          decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(20)),
          height: 120,
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              // Product Image
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  vegetable.image ??
                      'https://m.media-amazon.com/images/I/71yTV1+FI0L.jpg',
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 16),
              // Product Name
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      vegetable.name ?? 'Product Name',
                      style: const TextStyle(
                        color: Colors.black,
                        // fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      vegetable.price ?? 'Product Price',
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 10,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
