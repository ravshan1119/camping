part of "api_client_impl.dart";

abstract class ApiClient {
  Future<bool?> login(String number);
}
