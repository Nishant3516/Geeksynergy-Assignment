import '../../domain/entities/user.dart';

class UserModel extends User {
  UserModel({
    required String name,
    required String password,
    required String email,
    required String phoneNumber,
    required String profession,
  }) : super(
          name: name,
          password: password,
          email: email,
          phoneNumber: phoneNumber,
          profession: profession,
        );

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      password: json['password'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      profession: json['profession'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'password': password,
      'email': email,
      'phoneNumber': phoneNumber,
      'profession': profession,
    };
  }
}
