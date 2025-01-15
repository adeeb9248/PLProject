import 'package:delivery_app/constants.dart';
import 'package:delivery_app/models/product.dart';
import 'package:delivery_app/providers/add_to_cart_provider.dart';
import 'package:delivery_app/screens/cart_screen/widgets/checkout.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  CartScreen({super.key});
  static String id = "cart";
  static List<Product> products = [];

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int itemCount = 0;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final bottomPadding = MediaQuery.of(context).viewInsets.bottom + 70;
    final provider = AddToCartProvider.of(context);
    final finalList = provider.cart;
    producerQuantity(IconData icon, int index) {
      return GestureDetector(
        onTap: () {
          setState(
            () {
              icon == Icons.add
                  ? provider.increamnt(index)
                  : provider.decreamnt(index);
            },
          );
        },
        child: Icon(
          icon,
          size: 20,
        ),
      );
    }

    return finalList.isEmpty
        ? Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 100,
              ),
              Center(
                child: Text(
                  "The cart is empty !",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Checkout()
            ],
          )
        : Column(
            children: [
              Flexible(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: finalList.length,
                  itemBuilder: (context, index) {
                    final cartItems = finalList[index];
                    return Padding(
                      padding: const EdgeInsets.all(10),
                      child: ConstrainedBox(
                        constraints: BoxConstraints(maxHeight: 145),
                        child: Container(
                          height: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.grey.shade200,
                          ),
                          padding: EdgeInsets.all(13),
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.grey.withOpacity(0.3),
                                    ),
                                    //padding: EdgeInsets.all(20),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.network(
                                        cartItems.image!,
                                        width: 100,
                                        height: 100,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        // mainAxisAlignment:
                                        //     MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                            "${cartItems.name}",
                                            style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            "${cartItems.price}",
                                            style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 10,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Positioned(
                                top: 20,
                                right: 5,
                                child: Column(
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        finalList.removeAt(index);
                                        setState(() {});
                                      },
                                      icon: const Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                        size: 20,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      height: 30,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: Colors.white,
                                          border: Border.all(
                                              color: Colors.grey.shade400,
                                              width: 2)),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          SizedBox(
                                            width: 10,
                                          ),
                                          producerQuantity(Icons.add, index),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            cartItems.quantityToSend.toString(),
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          producerQuantity(Icons.remove, index),
                                          SizedBox(
                                            width: 10,
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Checkout()
            ],
          );
  }
}
