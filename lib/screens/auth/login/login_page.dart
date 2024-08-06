import 'package:camping/core/app_colors.dart';
import 'package:camping/core/app_images.dart';
import 'package:camping/core/extension.dart';
import 'package:camping/screens/auth/bloc/auth_bloc.dart';
import 'package:camping/screens/common/loader.dart';
import 'package:camping/screens/common/my_elevated_button.dart';
import 'package:camping/screens/common/text_form_field_widget.dart';
import 'package:camping/screens/common/text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:toastification/toastification.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();

  var maskFormatter = MaskTextInputFormatter(
      mask: '(##) ###-##-##',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
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
                    text: "Phone",
                    textColor: AppColors.grey_500,
                    fontWeight: FontWeight.w400,
                    fontSize: 16),
                8.h,
                MyTextFormField(
                  fillColor: AppColors.grey_50,
                  radius: 12,
                  textInputType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  controller: _phoneController,
                  error: state.errorEmail,
                  inputFormatter: [maskFormatter],
                  style: const TextStyle(
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                    color: Colors.black,
                  ),
                  prefixIcon: const Padding(
                    padding: EdgeInsets.only(
                        left: 20, bottom: 11, top: 11, right: 5),
                    child: Text(
                      "+998 ",
                      style: TextStyle(
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  onChanged: (v) {
                    context.read<AuthBloc>().add(LoginChangedEvent(phone: v));
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
                    context
                        .read<AuthBloc>()
                        .add(LoginChangedEvent(password: v));
                  },
                ),
                10.h,
                Center(
                  child: TextButton(
                    onPressed: () {
                      toastification.show(
                        context:
                            context, // optional if you use ToastificationWrapper
                        type: ToastificationType.success,
                        style: ToastificationStyle.flat,
                        autoCloseDuration: const Duration(seconds: 5),
                        title: const Text('In progressing...'),
                        // you can also use RichText widget for title and description parameters
                        description: RichText(
                            text: const TextSpan(text: 'In progress...')),
                        alignment: Alignment.topRight,
                        direction: TextDirection.ltr,
                        animationDuration: const Duration(milliseconds: 300),
                        animationBuilder:
                            (context, animation, alignment, child) {
                          return FadeTransition(
                            // turns: animation,
                            opacity: animation,
                            child: child,
                          );
                        },
                        icon: const Icon(CupertinoIcons.app_badge_fill),
                        showIcon: true, // show or hide the icon
                        primaryColor: Colors.green.shade300,
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 16),
                        margin: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 8),
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x07000000),
                            blurRadius: 16,
                            offset: Offset(0, 16),
                            spreadRadius: 0,
                          )
                        ],
                        showProgressBar: true,
                        closeButtonShowType: CloseButtonShowType.onHover,
                        closeOnClick: false,
                        pauseOnHover: true,
                        dragToClose: true,
                        applyBlurEffect: true,
                        callbacks: ToastificationCallbacks(
                          onTap: (toastItem) =>
                              print('Toast ${toastItem.id} tapped'),
                          onCloseButtonTap: (toastItem) => print(
                              'Toast ${toastItem.id} close button tapped'),
                          onAutoCompleteCompleted: (toastItem) => print(
                              'Toast ${toastItem.id} auto complete completed'),
                          onDismissed: (toastItem) =>
                              print('Toast ${toastItem.id} dismissed'),
                        ),
                      );
                    },
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
                    context.read<AuthBloc>().add(const LoginEvent());
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
