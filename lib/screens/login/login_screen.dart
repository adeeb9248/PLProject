import 'package:delivery_app/constants.dart';
import 'package:delivery_app/screens/register/widgets/register_button.dart';
import 'package:delivery_app/screens/register/widgets/register_info_widget.dart';
import 'package:delivery_app/services/login_service.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginScreen extends StatefulWidget {
  static String id = "Login";
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> formState = GlobalKey();
  bool isLouding = false;
  String? password;

  dynamic phoneNumber;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return ModalProgressHUD(
      inAsyncCall: isLouding,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Container(
            height: size.height,
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
            ),
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
                            // gradient: LinearGradient(
                            //   colors: [kPrimaryColor, const Color(0xFFE57481),const Color.fromARGB(255, 239, 184, 184)],
                            //   begin: Alignment.topLeft,
                            //   end: Alignment.bottomRight,
                            // ),
                            color: kSecondaryColor),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding:
                              EdgeInsets.only(top: size.height * 0.1, left: 16),
                          child: Text(
                            'Welcome !',
                            style: TextStyle(
                              color: kPrimaryColor,
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
                            Text('Do you want to create an account ? '),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                "Register",
                                style: TextStyle(
                                    color: kPrimaryColor, fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        RegisterInfoWidget(
                          hintText: 'Phone Number',
                          icon: Icon(Icons.phone),
                          onChanged: (data) {
                            phoneNumber = data;
                          },
                        ),
                        RegisterInfoWidget(
                          hintText: 'Password',
                          icon: Icon(Icons.lock),
                          obscureText: true,
                          onChanged: (data) {
                            password = data;
                          },
                        ),
                        RegisterButton(
                          text: 'Login',
                          onPressed: () async {
                            isLouding = true;
                            setState(() {});
                            try {
                              await LoginMethod();
                              print('succesful');
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
      ),
    );
  }

  Future<void> LoginMethod() async {
    await LoginService().loginService(
      phoneNumber: phoneNumber,
      password: password!,
    );
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
