import 'package:camping/data/local_storage.dart';
import 'package:camping/domain/api_client_impl.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> getItInit() async {
  if (getIt.isRegistered(instance: LocalStorage())) {
    return;
  }

  getIt.registerSingleton<LocalStorage>(LocalStorage());
  await Future.delayed(const Duration(seconds: 1));
  getIt.registerSingleton<ApiClientImpl>(ApiClientImpl());
}
