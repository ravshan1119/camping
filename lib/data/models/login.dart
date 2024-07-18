class LoginModel {
  final bool? isLogin;
  final String? errorEmail;
  final String? errorPassword;

  LoginModel(
      {this.errorEmail,
      this.isLogin,
      this.errorPassword});

  LoginModel copyWith({
    String? errorEmail,
    bool? isLogin,
    String? errorPassword,
  }) =>
      LoginModel(
        errorEmail: errorEmail ?? this.errorEmail,
        isLogin: isLogin ?? this.isLogin,
        errorPassword: errorPassword ?? this.errorPassword,
      );
}
