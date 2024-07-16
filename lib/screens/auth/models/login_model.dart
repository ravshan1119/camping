import 'package:equatable/equatable.dart';

class LoginModel extends Equatable {
  final String email;
  final String password;

  const LoginModel({required this.email, required this.password});

  LoginModel copyWith({
    String? email,
    String? password,
  }) =>
      LoginModel(
        email: email ?? this.email,
        password: password ?? this.password,
      );

  @override
  List<Object?> get props => [email, password];
}
