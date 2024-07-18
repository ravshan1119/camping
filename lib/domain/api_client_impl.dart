import 'package:camping/data/injection.dart';
import 'package:camping/data/local_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'api_client.dart';

class ApiClientImpl extends ApiClient {
  @override
  Future<bool?> register(String email, String password) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (credential.user?.email != null) {
        getIt<LocalStorage>().setToken(credential.user!.uid);
        return true;
      } else {
        return false;
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
      return false;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
