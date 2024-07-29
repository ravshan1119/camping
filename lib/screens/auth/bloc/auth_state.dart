part of 'auth_bloc.dart';

class AuthState extends Equatable {
  const AuthState({
    this.isLoading = false,
    this.errorEmail,
    this.errorPassword,
    this.registerModel,
    this.loginModel,
    this.currentPage = 0,
  });
  final bool isLoading;
  final String? errorEmail;
  final String? errorPassword;
  final RegisterModel? registerModel;
  final LoginModel? loginModel;
  final int currentPage;

  AuthState copyWith({
    bool? isLoading,
    String? errorEmail,
    String? errorPassword,
    RegisterModel? registerModel,
    LoginModel? loginModel,
    int? currentPage,
  }) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      errorEmail: errorEmail,
      errorPassword: errorPassword,
      registerModel: registerModel ?? this.registerModel,
      loginModel: loginModel ?? this.loginModel,
      currentPage: currentPage ?? this.currentPage,
    );
  }

  @override
  List<Object?> get props => [
        isLoading,
        errorEmail,
        errorPassword,
        registerModel,
        loginModel,
        currentPage,
      ];
}
