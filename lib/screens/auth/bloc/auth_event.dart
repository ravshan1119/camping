part of 'auth_bloc.dart';

class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class RegisterChangedEvent extends AuthEvent {
  final String? email;
  final String? password;
  final String? name;
  final String? phone;
  const RegisterChangedEvent({
    this.email,
    this.password,
    this.name,
    this.phone,
  });
}

class LoginChangedEvent extends AuthEvent {
  final String? email;
  final String? password;
  const LoginChangedEvent({
    this.email,
    this.password,
  });
}

class CurrentPageChangedEvent extends AuthEvent {
  final int page;
  const CurrentPageChangedEvent({
    required this.page,
  });
}

class RegisterEvent extends AuthEvent {
  const RegisterEvent();
}

class LoginEvent extends AuthEvent {
  const LoginEvent();
}
