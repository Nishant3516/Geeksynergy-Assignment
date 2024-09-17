part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object?> get props => [];
}

class LoginRequested extends LoginEvent {
  final String name;
  final String password;

  const LoginRequested(this.name, this.password);

  @override
  List<Object?> get props => [name, password];
}
