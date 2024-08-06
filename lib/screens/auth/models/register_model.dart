import 'package:equatable/equatable.dart';

class RegisterModel extends Equatable {
  final String email;
  final String password;
  final String name;
  final String phone;
  final String rePassword;

  const RegisterModel({
    required this.email,
    required this.password,
    required this.name,
    required this.phone,
    required this.rePassword,
  });

  RegisterModel copyWith({
    String? email,
    String? password,
    String? name,
    String? phone,
    String? rePassword,
  }) =>
      RegisterModel(
        email: email ?? this.email,
        password: password ?? this.password,
        name: name ?? this.name,
        phone: phone ?? this.password,
        rePassword: rePassword ?? this.rePassword,
      );

  @override
  List<Object?> get props => [
        email,
        password,
        name,
        phone,
        rePassword,
      ];
}
