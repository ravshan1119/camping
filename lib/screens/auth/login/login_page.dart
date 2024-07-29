import 'package:camping/core/app_colors.dart';
import 'package:camping/core/app_icons.dart';
import 'package:camping/core/app_images.dart';
import 'package:camping/core/extension.dart';
import 'package:camping/core/route/navigator.dart';
import 'package:camping/core/route/routes_const.dart';
import 'package:camping/screens/auth/bloc/auth_bloc.dart';
import 'package:camping/screens/common/loader.dart';
import 'package:camping/screens/common/my_elevated_button.dart';
import 'package:camping/screens/common/text_form_field_widget.dart';
import 'package:camping/screens/common/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        _emailController.text = state.loginModel?.email ?? '';
        _passwordController.text = state.loginModel?.password ?? '';

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                100.h,
                Image.asset(AppImages.logo2),
                40.h,
                const TextWidget(
                    text: "Email",
                    textColor: AppColors.grey_500,
                    fontWeight: FontWeight.w400,
                    fontSize: 16),
                8.h,
                MyTextFormField(
                  fillColor: AppColors.grey_50,
                  radius: 12,
                  textInputType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  controller: _emailController,
                  error: state.errorEmail,
                  onChanged: (v) {
                    context.read<AuthBloc>().add(LoginChangedEvent(email: v));
                  },
                ),
                20.h,
                const TextWidget(
                    text: "Password",
                    textColor: AppColors.grey_500,
                    fontWeight: FontWeight.w400,
                    fontSize: 16),
                8.h,
                MyTextFormField(
                  fillColor: AppColors.grey_50,
                  radius: 12,
                  textInputType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.done,
                  obscureText: true,
                  controller: _passwordController,
                  error: state.errorPassword,
                  onChanged: (v) {
                    context.read<AuthBloc>().add(LoginChangedEvent(password: v));
                  },
                ),
                10.h,
                Center(
                  child: TextButton(
                    onPressed: () {},
                    child: const TextWidget(
                        text: "Forgot Password?",
                        textColor: AppColors.grey_400,
                        fontWeight: FontWeight.w400,
                        fontSize: 16),
                  ),
                ),
                24.h,
                MyElevatedButton(
                  expanded: true,
                  radius: 12,
                  onTap: () {
                    context
                        .read<AuthBloc>()
                        .add(LoginEvent());
                  },
                  primaryColor: AppColors.green_500,
                  child: state.isLoading
                      ? const Center(
                          child: Loader(
                            color: AppColors.white,
                          ),
                        )
                      : const TextWidget(
                          text: "Log In",
                          textColor: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 16),
                ),
                20.h,
                MyElevatedButton(
                  expanded: true,
                  radius: 12,
                  elevation: 0,
                  onTap: () {
                    context
                        .read<AuthBloc>()
                        .add(const CurrentPageChangedEvent(page: 1));
                  },
                  primaryColor: Colors.white,
                  borderColor: AppColors.green_500,
                  child: const TextWidget(
                      text: "Register",
                      textColor: AppColors.green_500,
                      fontWeight: FontWeight.w500,
                      fontSize: 16),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
