import 'package:geeksynergy/features/movie/data/datasources/local_datasource.dart';
import '../entities/user.dart';

class SignUpUser {
  final LocalStorageService localStorage;

  SignUpUser(this.localStorage);

  Future<void> call(User user) async {
    await localStorage.saveUser(user);
  }
}
