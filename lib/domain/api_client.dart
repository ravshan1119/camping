part of "api_client_impl.dart";

abstract class ApiClient {
  Future<RegisterModel> register(String email, String password);
  Future<LoginModel> login(String email, String password);
}
