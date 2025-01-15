import 'package:delivery_app/constants.dart';
import 'package:delivery_app/screens/cart_screen/cart_screen.dart';
import 'package:delivery_app/screens/cart_screen/widgets/checkout.dart';
import 'package:delivery_app/screens/history_order_screen/orders_screen.dart';
import 'package:delivery_app/screens/home_screen/home_screen.dart';
import 'package:delivery_app/screens/info_personal/info_personal_screen.dart';
import 'package:flutter/material.dart';

class Navigatorbar extends StatefulWidget {
  const Navigatorbar({super.key});
  static String id = "navigation";
  @override
  State<Navigatorbar> createState() => _NavigatorbarState();
}

class _NavigatorbarState extends State<Navigatorbar> {
  int selectedIndex = 0;
  List<Widget> pages = [
    HomeScreen(),
    InfoPersonalScreen(),
    CartScreen(),
    OrdersScreen()
    
  ];

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
      print(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
    //   bottomSheet: selectedIndex==2?
    //   Checkout():null
    //  ,
      backgroundColor: Colors.white,
      appBar: selectedIndex == 0
          ? AppBar(
              title: const Text(
                'Home Page',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              backgroundColor: kPrimaryColor,
            )
          : selectedIndex == 2
              ? 
               AppBar(
                  iconTheme: IconThemeData(color: Colors.white),
                  backgroundColor: kPrimaryColor,
                  centerTitle: true,
                  title: Text(
                    "M Y  C A R T",
                    style: TextStyle(color: Colors.white),
                  ),
                ):selectedIndex==3?
                
                AppBar(
              title: const Text(
                'History Order',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              backgroundColor: kPrimaryColor,
            ):null ,
      body: IndexedStack(
        index: selectedIndex,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: onItemTapped,
        currentIndex: selectedIndex,
        backgroundColor:Colors.white ,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: kPrimaryColor,
        iconSize: 23,
        selectedFontSize: 18,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'home',
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
              ),
              label: 'profile'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_cart,
              ),
              label: 'cart'),
BottomNavigationBarItem(
              icon: Icon(
                Icons.inventory,
              ),
              label: 'orders'),
        ],
      ),
    );
  }
}
