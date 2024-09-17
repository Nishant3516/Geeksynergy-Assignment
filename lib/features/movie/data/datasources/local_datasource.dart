import 'package:geeksynergy/features/movie/data/models/user_model.dart';
import 'package:geeksynergy/features/movie/domain/entities/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class LocalStorageService {
  final SharedPreferences sharedPreferences;

  LocalStorageService(this.sharedPreferences);

  Future<void> saveUser(User user) async {
    final userModel = UserModel(
      name: user.name,
      password: user.password,
      email: user.email,
      phoneNumber: user.phoneNumber,
      profession: user.profession,
    );
    final userData = json.encode(userModel.toJson());
    await sharedPreferences.setString('user', userData);
  }

  User? getUser() {
    final userData = sharedPreferences.getString('user');
    if (userData != null) {
      return UserModel.fromJson(json.decode(userData));
    }
    return null;
  }

  Future<void> clearUser() async {
    await sharedPreferences.remove('user');
  }
}
