part of "api_client_impl.dart";

abstract class ApiClient {
  Future<bool?> register(String email, String password);
}
