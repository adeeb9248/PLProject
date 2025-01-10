import 'package:delivery_app/constants.dart';
import 'package:delivery_app/providers/add_to_cart_provider.dart';
import 'package:flutter/material.dart';

class Checkout extends StatelessWidget {
  const Checkout({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = AddToCartProvider.of(context);
    return Container(
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius:const BorderRadius.only(
          topRight: Radius.circular(30),
          bottomLeft: Radius.circular(30),
        ),
      ),
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          // TextField(
          //   decoration: InputDecoration(
          //     border: OutlineInputBorder(
          //     borderRadius: BorderRadius.circular(30),
          //     borderSide: BorderSide.none ),
          //     contentPadding: EdgeInsets.symmetric(vertical: 5,horizontal: 15,),
          //     filled: true,
          //    fillColor: Colors.white
          //   ),
          // )

          // SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "SubTotal",
                style: TextStyle(
                    //fontWeight: FontWeight.bold,
                    color: Colors.grey,
                    fontSize: 14),
              ),
              Text(
                "\$${provider.totalPrice()}",
                style: TextStyle(
                    //fontWeight: FontWeight.bold,
                    color: Colors.grey,
                    fontSize: 14),
              ),
            ],
          ),
          SizedBox(height: 10),
          Divider(),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total",
                style: TextStyle(
                    // fontWeight: FontWeight.bold,
                    color: Colors.grey,
                    fontSize: 16),
              ),
              Text(
                "\$${provider.totalPrice()}",
                style: TextStyle(
                    //   fontWeight: FontWeight.bold,
                    color: Colors.grey,
                    fontSize: 16),
              ),
            ],
          ),
          SizedBox(height: 20),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: kPrimaryColor,
                minimumSize: Size(double.infinity, 40),
              ),
              onPressed: () {},
              child: Text(
                "Check Out",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.white),
              ))
        ],
      ),
    );
  }
}
