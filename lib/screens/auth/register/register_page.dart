import 'package:camping/core/app_colors.dart';
import 'package:camping/core/app_icons.dart';
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

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        _nameController.text = state.registerModel?.name ?? '';
        _emailController.text = state.registerModel?.email ?? '';
        _phoneController.text = state.registerModel?.phone ?? '';
        _passwordController.text = state.registerModel?.password ?? '';
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(AppIcons.logo2),
              40.h,
              const TextWidget(
                  text: "Name",
                  textColor: AppColors.grey_500,
                  fontWeight: FontWeight.w400,
                  fontSize: 16),
              8.h,
              MyTextFormField(
                fillColor: AppColors.grey_50,
                radius: 12,
                textInputType: TextInputType.name,
                textInputAction: TextInputAction.next,
                controller: _nameController,
                onChanged: (v) {
                  context.read<AuthBloc>().add(RegisterChangedEvent(name: v));
                },
              ),
              20.h,
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
                onChanged: (v) {
                  context.read<AuthBloc>().add(RegisterChangedEvent(email: v));
                },
              ),
              20.h,
              const TextWidget(
                  text: "Phone",
                  textColor: AppColors.grey_500,
                  fontWeight: FontWeight.w400,
                  fontSize: 16),
              8.h,
              MyTextFormField(
                fillColor: AppColors.grey_50,
                radius: 12,
                textInputType: TextInputType.phone,
                textInputAction: TextInputAction.next,
                controller: _phoneController,
                onChanged: (v) {
                  context.read<AuthBloc>().add(RegisterChangedEvent(phone: v));
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
                onChanged: (v) {
                  context
                      .read<AuthBloc>()
                      .add(RegisterChangedEvent(password: v));
                },
              ),
              24.h,
              MyElevatedButton(
                expanded: true,
                radius: 12,
                onTap: () {
                  navigator.pushNamed(RouteList.addTrip);
                },
                primaryColor: AppColors.green_500,
                child: state.isLoading
                    ? const Center(
                        child: Loader(
                          color: AppColors.white,
                        ),
                      )
                    : const TextWidget(
                        text: "Register",
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
                      .add(const CurrentPageChangedEvent(page: 0));
                },
                primaryColor: Colors.white,
                borderColor: AppColors.green_500,
                child: const TextWidget(
                    text: "Log In",
                    textColor: AppColors.green_500,
                    fontWeight: FontWeight.w500,
                    fontSize: 16),
              ),
            ],
          ),
        );
      },
    );
  }
}
