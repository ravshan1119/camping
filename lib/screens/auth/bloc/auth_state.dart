part of 'auth_bloc.dart';

class AuthState extends Equatable {
  const AuthState({
    this.isLoading = false,
    this.errorText,
    this.registerModel,
    this.loginModel,
    this.currentPage = 0,
  });
  final bool isLoading;
  final String? errorText;
  final RegisterModel? registerModel;
  final LoginModel? loginModel;
  final int currentPage;

  AuthState copyWith({
    bool? isLoading,
    String? errorText,
    RegisterModel? registerModel,
    LoginModel? loginModel,
    int? currentPage,
  }) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      errorText: errorText ?? this.errorText,
      registerModel: registerModel ?? this.registerModel,
      loginModel: loginModel ?? this.loginModel,
      currentPage: currentPage ?? this.currentPage,
    );
  }

  @override
  List<Object?> get props => [
        isLoading,
        errorText,
        registerModel,
        loginModel,
        currentPage,
      ];
}
