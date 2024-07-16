import 'package:camping/screens/auth/models/login_model.dart';
import 'package:camping/screens/auth/models/register_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(const AuthState()) {
    on<RegisterChangedEvent>(_registerChanged);
    on<LoginChangedEvent>(_loginChanged);
    on<CurrentPageChangedEvent>(_currentPageChanged);
  }

  void _registerChanged(RegisterChangedEvent event, Emitter<AuthState> emit) {
    emit(
      state.copyWith(
        registerModel: RegisterModel(
          email: event.email ?? state.registerModel?.email ?? '',
          password: event.password ?? state.registerModel?.password ?? '',
          name: event.name ?? state.registerModel?.name ?? '',
          phone: event.phone ?? state.registerModel?.phone ?? '',
        ),
      ),
    );
  }

  void _loginChanged(LoginChangedEvent event, Emitter<AuthState> emit) {
    emit(
      state.copyWith(
        loginModel: LoginModel(
          email: event.email ?? state.loginModel?.email ?? '',
          password: event.password ?? state.loginModel?.password ?? '',
        ),
      ),
    );
  }

  void _currentPageChanged(
      CurrentPageChangedEvent event, Emitter<AuthState> emit) {
    emit(state.copyWith(currentPage: event.page));
  }
}
