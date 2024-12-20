import 'package:delivery_app/constants.dart';
import 'package:delivery_app/screens/login/login_screen.dart';
import 'package:delivery_app/screens/register/widgets/dropdown.dart';
import 'package:delivery_app/screens/register/widgets/register_button.dart';
import 'package:delivery_app/screens/register/widgets/register_info_widget.dart';
import 'package:delivery_app/services/register_service.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

String? country;

class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key});

  static String id = "Register";

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String? firstName, lastName, city, password, passwordConf;

  dynamic phoneNumber;

  bool isLouding = false, obscureText = true;

  GlobalKey<FormState> formState = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return ModalProgressHUD(
      inAsyncCall: isLouding,
      child: Scaffold(
        backgroundColor: kSecondaryColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  ClipPath(
                    clipper: DrawClip(),
                    child: Container(
                      width: size.width,
                      height: size.height * 0.6,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              kPrimaryColor,
                              const Color(0xFFE57481),
                              const Color(0xFFEFB8B8)
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          color: kPrimaryColor),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.only(top: size.height * 0.1, left: 16),
                        child: Text(
                          'Register',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Do you have an account ? '),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, LoginScreen.id);
                            },
                            child: Text(
                              "Login",
                              style: TextStyle(color: kSecondaryColor),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      RegisterInfoWidget(
                        hintText: 'First Name',
                        icon: const Icon(Icons.person),
                        onChanged: (data) {
                          firstName = data;
                        },
                      ),
                      RegisterInfoWidget(
                        hintText: 'Last Name',
                        icon: const Icon(Icons.person),
                        onChanged: (data) {
                          lastName = data;
                        },
                      ),
                      RegisterInfoWidget(
                        hintText: 'Phone Number',
                        icon: const Icon(Icons.phone),
                        onChanged: (data) {
                          phoneNumber = data;
                        },
                        minimum: 10,
                        errorText: ' phone number is less than 10 number',
                      ),

                      // RegisterInfoWidget(
                      //   hintText: 'Country',
                      //   icon: const Icon(Icons.location_on),
                      //   onChanged: (data) {
                      //     country = data;
                      //   },
                      // ),
                      DropDownCountry(),
                      RegisterInfoWidget(
                        hintText: 'City',
                        icon: const Icon(Icons.location_on),
                        onChanged: (data) {
                          city = data;
                        },
                      ),
                      RegisterInfoWidget(
                        hintText: 'Password',
                        icon: const Icon(Icons.lock),
                        obscureText: obscureText,
                        onChanged: (data) {
                          password = data;
                          print('The password is $data');
                        },
                        minimum: 8,
                        errorText: ' passowrd is less than 8 character',
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                obscureText = !obscureText;
                              });
                            },
                            icon: Icon(obscureText
                                ? Icons.visibility_off
                                : Icons.visibility)),
                      ),

                      RegisterInfoWidget(
                        hintText: 'Confirm Password',
                        icon: const Icon(Icons.lock),
                        obscureText: true,
                        onChanged: (data) {
                          passwordConf = data;
                        },
                        minimum: 8,
                        errorText: ' passowrd is less than 8 character',
                      ),
                      //زر التأكيد
                      RegisterButton(
                        text: 'Register',
                        onPressed: () async {
                          isLouding = true;
                          setState(() {});
                          try {
                            await RegisterMethod(country: country);
                            print('succesful');
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('register success!'),backgroundColor: kPrimaryColor,));
                          } catch (e) {
                            print(e.toString());
                            
                          }
                          isLouding = false;
                          setState(() {});
                        },
                      )
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> RegisterMethod({String? country}) async {
    await RegisterService().registerService(
        firstName: firstName!,
        lastName: lastName!,
        phoneNumber: phoneNumber,
        country: country!,
        city: city!,
        password: password!,
        passwordConf: passwordConf!);
    isLouding = false;
  }
}

class DrawClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height / 2);
    path.cubicTo(size.width / 4, size.height, 3 * size.width / 4,
        size.height / 2, size.width, size.height * 0.8);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
