import 'package:camping/screens/auth/bloc/auth_bloc.dart';
import 'package:camping/screens/auth/login/login_page.dart';
import 'package:camping/screens/auth/register/register_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return Scaffold(
          body: state.currentPage == 0
              ? const LoginPage(
                )
              : const RegisterPage(),
        );
      },
    );
  }
}
