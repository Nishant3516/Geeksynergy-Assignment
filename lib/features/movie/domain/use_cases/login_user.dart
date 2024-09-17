import 'package:geeksynergy/features/movie/data/datasources/local_datasource.dart';
import '../entities/user.dart';

class LoginUser {
  final LocalStorageService localStorage;

  LoginUser(this.localStorage);

  User? call(String name, String password) {
    final user = localStorage.getUser();
    if (user != null && user.name == name && user.password == password) {
      return user;
    }
    return null;
  }
}
