import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geeksynergy/features/movie/domain/use_cases/login_user.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUser loginUser;

  LoginBloc(this.loginUser) : super(LoginInitial()) {
    on<LoginRequested>(_onLoginRequested);
  }

  Future<void> _onLoginRequested(
      LoginRequested event, Emitter<LoginState> emit) async {
    final user = loginUser.call(event.name, event.password);
    if (user != null) {
      emit(LoginSuccess());
    } else {
      emit(const LoginFailure("Invalid Credentials"));
    }
  }
}
