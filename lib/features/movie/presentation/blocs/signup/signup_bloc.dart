import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geeksynergy/features/movie/domain/entities/user.dart';
import 'package:geeksynergy/features/movie/domain/use_cases/sign_up_user.dart';
part 'signup_event.dart';
part 'signup_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final SignUpUser signUpUser;

  SignUpBloc(this.signUpUser) : super(SignUpInitial()) {
    on<SignUpRequested>(_onSignUpRequested);
  }

  Future<void> _onSignUpRequested(
      SignUpRequested event, Emitter<SignUpState> emit) async {
    try {
      await signUpUser.call(event.user);
      emit(SignUpSuccess());
    } catch (_) {
      emit(SignUpFailure());
    }
  }
}
