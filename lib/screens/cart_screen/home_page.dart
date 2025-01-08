import 'package:delivery_app/constants.dart';
import 'package:delivery_app/screens/cart_screen/cart_screen.dart';
import 'package:delivery_app/screens/info_personal/info_personal_screen.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  static String id = "HomePage";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, InfoPersonalScreen.id);
            },
            icon: Icon(
              Icons.person,
              color: kPrimaryColor,
            )),
        title:
         IconButton(
          onPressed: () {
             Navigator.pushNamed(context, CartScreen.id);
          },
          icon: Icon(Icons.shopping_cart),
          color: kPrimaryColor,
                 ),
      ),
    );
  }
}
