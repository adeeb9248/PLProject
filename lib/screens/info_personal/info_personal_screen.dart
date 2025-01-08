import 'dart:developer';

import 'package:delivery_app/constants.dart';
import 'package:delivery_app/models/user_info_model.dart';
import 'package:delivery_app/providers/userinfo_provider.dart';
import 'package:delivery_app/screens/home_screen/widgets/navigatorBar.dart';
import 'package:delivery_app/screens/info_personal/widgets/image_profile.dart';
import 'package:delivery_app/screens/info_personal/widgets/info_personal_container.dart';
import 'package:delivery_app/screens/login/login_screen.dart';
import 'package:delivery_app/services/get_personal_info.dart';
import 'package:delivery_app/services/logout_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InfoPersonalScreen extends StatelessWidget {
  const InfoPersonalScreen({super.key});
  static String id = "PersonalInformation";

  @override
  Widget build(BuildContext context) {
    UserInfoModel? userInfoModel =
        Provider.of<UserinfoProvider>(context).userInfoModel;
    // ModalRoute.of(context)!.settings.arguments as UserInfoModel;
    final Size size = MediaQuery.of(context).size;
    return FutureBuilder(
        future: GetPersonalInfo().getPersonalInfo(token: userInfoModel!.token),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Stack(
              children: [
                Container(
                  width: size.width,
                  height: size.height * 0.25,
                  child: Center(
                      child: Text(
                    '${snapshot.data!.firstName} ${snapshot.data!.lastName}',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  )),
                  decoration: const BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(60),
                          bottomRight: Radius.circular(60))),
                ),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 150,
                      ),
                      ImageProfile(imageFromUser: snapshot.data!.image),
                      SizedBox(
                        height: 30,
                      ),
                      InfoPersonalContainer(
                          text:
                              '${snapshot.data!.firstName} ${snapshot.data!.lastName}',
                          icon: Icons.person),
                      InfoPersonalContainer(
                          text: '${snapshot.data!.phoneNumber}',
                          icon: Icons.phone),
                      InfoPersonalContainer(
                          text: '${snapshot.data!.country}',
                          icon: Icons.location_on),
                      InfoPersonalContainer(
                          text: '${snapshot.data!.city}',
                          icon: Icons.location_on),
                      Padding(
                          padding: const EdgeInsets.all(16),
                          child: Container(
                            width: 150,
                            height: 40,
                            decoration: BoxDecoration(
                                color: kPrimaryColor,
                                borderRadius: BorderRadius.circular(30)),
                            child: GestureDetector(
                              onTap: () async {
                                print("here");
                                bool status = await LogoutService()
                                    .logoutService(token: userInfoModel.token);
                                if (status) {
                                  Navigator.pushNamedAndRemoveUntil(
                                      context,
                                      LoginScreen.id,
                                      (Route<dynamic> route) => false);
                                }
                              },
                              child: Row(
                                children: [
                                  Spacer(),
                                  Icon(
                                    Icons.logout,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    " Logout",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Spacer()
                                ],
                              ),
                            ),
                          )

                          // IconButton(
                          //     onPressed: () async {
                          //       print("here");
                          //       bool status = await LogoutService()
                          //           .logoutService(token: userInfoModel.token);
                          //       if (status) {
                          //         Navigator.pushNamedAndRemoveUntil(
                          //             context,
                          //             LoginScreen.id,
                          //             (Route<dynamic> route) => false);
                          //       }
                          //     },
                          //     icon: Icon(
                          //       Icons.logout,
                          //       color: kButtonColor,
                          //     )),
                          ),
                    ],
                  ),
                )
              ],
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
