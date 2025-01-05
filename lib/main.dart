import 'package:delivery_app/models/user_info_model.dart';
import 'package:delivery_app/providers/userinfo_provider.dart';
import 'package:delivery_app/screens/info_personal/info_personal_screen.dart';
import 'package:delivery_app/screens/login/login_screen.dart';
import 'package:delivery_app/screens/register/register_screen.dart';
import 'package:delivery_app/screens/splash_screen/splach_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

//late SharedPreferences storage;
void main()  {
  WidgetsFlutterBinding.ensureInitialized;
 // storage = await SharedPreferences.getInstance();
  runApp(ChangeNotifierProvider(
    create: (context) => UserinfoProvider(),
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
      },
    );
  }
}
