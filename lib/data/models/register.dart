class RegisterModel {
  final bool? isRegister;
  final String? errorEmail;
  final String? errorPassword;

  RegisterModel(
      {this.errorEmail,
      this.isRegister,
      this.errorPassword});

  RegisterModel copyWith({
    String? errorEmail,
    bool? isRegister,
    String? errorPassword,
  }) =>
      RegisterModel(
        errorEmail: errorEmail ?? this.errorEmail,
        isRegister: isRegister ?? this.isRegister,
        errorPassword: errorPassword ?? this.errorPassword,
      );
}
