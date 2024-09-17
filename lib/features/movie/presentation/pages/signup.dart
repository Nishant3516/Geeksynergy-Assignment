import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geeksynergy/features/movie/presentation/blocs/signup/signup_bloc.dart';
import 'package:geeksynergy/features/movie/presentation/pages/login.dart';
import '../../domain/entities/user.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController professionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: BlocListener<SignUpBloc, SignUpState>(
        listener: (context, state) {
          if (state is SignUpSuccess) {
            Navigator.pushNamed(context, '/login');
          } else if (state is SignUpFailure) {
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text('Sign Up Failed')));
          }
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Sign Up",
                    style: TextStyle(fontSize: 40),
                    textAlign: TextAlign.left,
                  ),
                ),
                const SizedBox(height: 30),
                TextField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      labelText: 'Name',
                      border: OutlineInputBorder(),
                    )),
                const SizedBox(height: 10),
                TextField(
                    controller: passwordController,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                    )),
                const SizedBox(height: 10),
                TextField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                    )),
                const SizedBox(height: 10),
                TextField(
                    controller: phoneController,
                    decoration: const InputDecoration(
                      labelText: 'Phone',
                      border: OutlineInputBorder(),
                    )),
                const SizedBox(height: 10),
                DropdownButtonFormField(
                  decoration: const InputDecoration(labelText: 'Profession'),
                  items: ['Engineer', 'Doctor', 'Teacher', 'Student']
                      .map((profession) => DropdownMenuItem(
                          value: profession, child: Text(profession)))
                      .toList(),
                  onChanged: (value) => professionController.text = value ?? '',
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () {
                    final user = User(
                      name: nameController.text,
                      password: passwordController.text,
                      email: emailController.text,
                      phoneNumber: phoneController.text,
                      profession: professionController.text,
                    );
                    context.read<SignUpBloc>().add(SignUpRequested(user));
                  },
                  child: const Text('Sign Up'),
                ),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(
                      builder: (context) {
                        return LoginPage();
                      },
                    ));
                  },
                  child: RichText(
                    text: const TextSpan(
                      style: TextStyle(color: Colors.black),
                      children: [
                        TextSpan(
                          text: 'Already have an account? ',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        TextSpan(
                          text: 'Login',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
