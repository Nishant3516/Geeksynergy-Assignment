import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geeksynergy/features/movie/data/datasources/local_datasource.dart';
import 'package:geeksynergy/features/movie/data/repositories/movie_repositories.dart';
import 'package:geeksynergy/features/movie/domain/use_cases/login_user.dart';
import 'package:geeksynergy/features/movie/domain/use_cases/sign_up_user.dart';
import 'package:geeksynergy/features/movie/presentation/blocs/login/login_bloc.dart';
import 'package:geeksynergy/features/movie/presentation/blocs/signup/signup_bloc.dart';
import 'package:geeksynergy/features/movie/presentation/pages/login.dart';
import 'package:geeksynergy/features/movie/presentation/pages/movies.dart';
import 'package:geeksynergy/features/movie/presentation/pages/signup.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final sharedPreferences = await SharedPreferences.getInstance();
  final dio = Dio();

  final localStorage = LocalStorageService(sharedPreferences);
  final movieRepository = MovieRepository(dio);

  final signUpUser = SignUpUser(localStorage);
  final loginUser = LoginUser(localStorage);

  final signUpBloc = SignUpBloc(signUpUser);
  final loginBloc = LoginBloc(loginUser);

  runApp(MyApp(
    signUpBloc: signUpBloc,
    loginBloc: loginBloc,
    movieRepository: movieRepository,
  ));
}

class MyApp extends StatelessWidget {
  final SignUpBloc signUpBloc;
  final LoginBloc loginBloc;
  final MovieRepository movieRepository;

  const MyApp({
    super.key,
    required this.signUpBloc,
    required this.loginBloc,
    required this.movieRepository,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SignUpBloc>.value(value: signUpBloc),
        BlocProvider<LoginBloc>.value(value: loginBloc),
      ],
      child: MaterialApp(
        title: 'Movies App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/signup',
        routes: {
          '/signup': (context) => SignUpPage(),
          '/login': (context) => LoginPage(),
          '/movies': (context) => MoviesPage(movieRepository: movieRepository),
        },
      ),
    );
  }
}
