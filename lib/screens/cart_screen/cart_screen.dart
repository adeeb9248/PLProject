import 'package:delivery_app/constants.dart';
import 'package:delivery_app/models/product.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  CartScreen({super.key});
  static String id = "cart";
  static List<Product> products = [];
  //  [
  //   Product(
  //     id: 1,
  //     name: "pizza",
  //     price: "4000.0",
  //     description: "pizza cheeze",
  //     storeId: 2,
  //     image: "",
  //     quantity: 10,
  //   )
  // ];

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int itemCount = 0;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return (CartScreen.products.isEmpty)
        ? Center(
            child: Text(
              "The cart is empty !",
              style: TextStyle(color: Colors.grey, fontSize: 20),
            ),
          )
        : ListView.builder(
            itemCount: CartScreen.products.length,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.all(16),
                child: Card(
                  color: Colors.blue,
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Icon(Icons.image),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "${CartScreen.products[index].name}",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              Text(
                                "${CartScreen.products[index].price}",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 10),
                              ),
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    increamentButton(),
                                    Text(
                                      "${itemCount}",
                                      style: TextStyle(fontSize: 15),
                                    ),
                                    decreamentButton(),
                                    deleteCard(),
                                  ])
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            });
  }

  Widget deleteCard() {
    return IconButton(
        onPressed: () {
          CartScreen.products.removeAt(0);
        },
        icon: Icon(Icons.delete));
  }

  Widget increamentButton() {
    return MaterialButton(
      shape: CircleBorder(),
      onPressed: () {
        setState(() {
          itemCount++;
        });
      },
      child: Icon(Icons.add),
      color: Colors.white,
    );
  }

  Widget decreamentButton() {
    return MaterialButton(
      shape: CircleBorder(),
      onPressed: () {
        setState(() {
          itemCount--;
        });
      },
      child: Center(child: Icon(Icons.minimize)),
      color: Colors.white,
    );
  }
}
