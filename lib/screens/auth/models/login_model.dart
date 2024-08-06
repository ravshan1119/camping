import 'package:equatable/equatable.dart';

class LoginModel extends Equatable {
  final String phone;
  final String password;

  const LoginModel({required this.phone, required this.password});

  LoginModel copyWith({
    String? phone,
    String? password,
  }) =>
      LoginModel(
        phone: phone ?? this.phone,
        password: password ?? this.password,
      );

  @override
  List<Object?> get props => [phone, password];
}
