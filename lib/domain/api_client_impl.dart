import 'package:camping/domain/rest.dart';

part 'api_client.dart';

class ApiClientImpl extends ApiClient {
  final _rest = Rest();

  @override
  Future<bool?> login(String number) async {
    final headers = {'Content-Type': 'application/x-www-form-urlencoded'};

    final data = {
      'phone_number': number,
    };

    final result = await _rest.request(
        path: "/api/auth/login",
        data: data,
        method: Method.post,
        header: headers);
    if (result?.statusCode == 200 ||
        result?.statusCode == 201 ||
        result?.statusCode == 202 ||
        result?.statusCode == 208) {
      return true;
    }

    return false;
  }
}
