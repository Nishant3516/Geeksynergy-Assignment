part of 'signup_bloc.dart';

abstract class SignUpEvent extends Equatable {
  const SignUpEvent();

  @override
  List<Object?> get props => [];
}

class SignUpRequested extends SignUpEvent {
  final User user;

  const SignUpRequested(this.user);

  @override
  List<Object?> get props => [user];
}
