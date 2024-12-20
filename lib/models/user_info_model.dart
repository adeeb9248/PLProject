class UserInfoModel {
  final String firstName;
  final String lastName;
  final dynamic phoneNumber;
  final String country;
  final String city;
  final String? password;
  final String? passwordConf;

  UserInfoModel(
      {required this.firstName,
      required this.lastName,
      required this.phoneNumber,
      required this.country,
      required this.city,
      required this.password,
      required this.passwordConf});

  factory UserInfoModel.fromJson(jsonData) {
    return UserInfoModel(
        firstName: jsonData['first_name'],
        lastName: jsonData['last_name'],
        phoneNumber: jsonData['phone_number'],
        country: jsonData['country'],
        city: jsonData['city'],
        password: jsonData['password'],
        passwordConf: jsonData['password_confirmation']);
  }
}
