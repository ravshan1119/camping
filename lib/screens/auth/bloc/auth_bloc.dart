import 'package:camping/core/route/navigator.dart';
import 'package:camping/core/route/routes.dart';
import 'package:camping/core/route/routes_const.dart';
import 'package:camping/data/injection.dart';
import 'package:camping/domain/api_client_impl.dart';
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
    on<RegisterEvent>(_register);
    on<LoginEvent>(_login);
  }

  final _apiClient = getIt<ApiClientImpl>();

  void _registerChanged(RegisterChangedEvent event, Emitter<AuthState> emit) {
    emit(
      state.copyWith(
        errorEmail: null,
        errorPassword: null,
        registerModel: RegisterModel(
          email: event.email ?? state.registerModel?.email ?? '',
          password: event.password ?? state.registerModel?.password ?? '',
          name: event.name ?? state.registerModel?.name ?? '',
          phone: event.phone ?? state.registerModel?.phone ?? '',
          rePassword: event.rePassword ?? state.registerModel?.rePassword ?? '',
        ),
      ),
    );
  }

  void _loginChanged(LoginChangedEvent event, Emitter<AuthState> emit) {
    emit(
      state.copyWith(
        errorEmail: null,
        errorPassword: null,
        loginModel: LoginModel(
          phone: event.phone ?? state.loginModel?.phone ?? '',
          password: event.password ?? state.loginModel?.password ?? '',
        ),
      ),
    );
  }

  void _currentPageChanged(
      CurrentPageChangedEvent event, Emitter<AuthState> emit) {
    emit(state.copyWith(currentPage: event.page));
  }

  void _register(RegisterEvent event, Emitter<AuthState> emit) async {
    if (state.registerModel?.rePassword == state.registerModel?.password) {
      emit(state.copyWith(isLoading: true));
      await _apiClient
          .register(
        '998${state.registerModel?.email.replaceAll(" ", "").replaceAll("(", "").replaceAll(")", "").replaceAll("-", "")}@gmail.com',
        state.registerModel?.password ?? '',
      )
          .then((value) {
        print("valueeeeee error: ${value.errorEmail}");
        if (value.isRegister == true) {
          emit(state.copyWith(isLoading: false));
          navigator.pushReplacementNamed(RouteList.addTrip);
        } else {
          emit(state.copyWith(
              errorEmail: value.errorEmail,
              isLoading: false,
              errorPassword: value.errorPassword));
        }
      });
    } else {
      emit(state.copyWith(errorPassword: "Password does not match"));
    }
  }

  void _login(LoginEvent event, Emitter<AuthState> emit) async {
    emit(state.copyWith(isLoading: true));
    await _apiClient
        .login(
      '998${state.loginModel?.phone.replaceAll(" ", "").replaceAll("(", "").replaceAll(")", "").replaceAll("-", "")}@gmail.com' ??
          '',
      state.loginModel?.password ?? '',
    )
        .then((value) {
      print("valueeeeee error: ${value.errorEmail}");
      if (value.isLogin == true) {
        emit(state.copyWith(isLoading: false));
        navigator.pushReplacementNamed(RouteList.addTrip);
      } else {
        emit(state.copyWith(
            errorEmail: value.errorEmail,
            isLoading: false,
            errorPassword: value.errorPassword));
      }
    });
  }
}
