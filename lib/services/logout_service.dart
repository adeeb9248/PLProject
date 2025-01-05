import 'package:delivery_app/helper/api.dart';

class LogoutService {
  Future<bool> logoutService({required String token}) async {
    Map<String, dynamic> data = await Api().post(url: '/logout', token: token);
    print("yes");
    return true;
  }
}
