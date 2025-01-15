import 'package:delivery_app/models/user_info_model.dart';
import 'package:delivery_app/providers/add_to_cart_provider.dart';
import 'package:delivery_app/providers/product_details_provider.dart';
import 'package:delivery_app/providers/products_provider.dart';
import 'package:delivery_app/providers/stores_provider.dart';
import 'package:delivery_app/providers/userinfo_provider.dart';
import 'package:delivery_app/screens/cart_screen/cart_screen.dart';
import 'package:delivery_app/screens/home_screen/widgets/navigatorBar.dart';
import 'package:delivery_app/screens/info_personal/info_personal_screen.dart';
import 'package:delivery_app/screens/login/login_screen.dart';
import 'package:delivery_app/screens/register/register_screen.dart';
import 'package:delivery_app/screens/splash_screen/splach_screen.dart';
import 'package:delivery_app/screens/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


//late SharedPreferences storage;
void main()  {
 // WidgetsFlutterBinding.ensureInitialized;
 // storage = await SharedPreferences.getInstance();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=>AddToCartProvider()),
        ChangeNotifierProvider(create: (context) => ProductDetailsProvider()),
        ChangeNotifierProvider(create: (context) => ProductsProvider()),
        ChangeNotifierProvider(create: (context) => StoresProvider()),
        ChangeNotifierProvider(create: (context) => UserinfoProvider(),)
      ],
    child: DeliveryApp(),
  ));
}

class DeliveryApp extends StatelessWidget {
  const DeliveryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplachScreen(),
      theme: ThemeData(fontFamily: 'PatuaOne'),
      routes: {
        RegisterScreen.id: (context) => RegisterScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        InfoPersonalScreen.id: (context) => InfoPersonalScreen(),
        CartScreen.id:(context)=>CartScreen(),
        HomeScreen.id:(context)=>HomeScreen(),
        Navigatorbar.id:(context)=>Navigatorbar()
      },
      
    );
  }
}
