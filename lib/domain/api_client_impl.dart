import 'package:camping/data/injection.dart';
import 'package:camping/data/local_storage.dart';
import 'package:camping/data/models/login.dart';
import 'package:camping/data/models/register.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'api_client.dart';

class ApiClientImpl extends ApiClient {
  @override
  Future<RegisterModel> register(String email, String password) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (credential.user?.email != null) {
        getIt<LocalStorage>().setToken(credential.user!.uid);
        return RegisterModel(
          isRegister: true,
        );
      } else {
        return RegisterModel(
            errorEmail: "Kutilmagan xatolik!",
            isRegister: false,
            errorPassword: "Kutilmagan xatolik!");
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('ApiClientImpl.register passworddddd');
        return RegisterModel(
          errorPassword: "The password provided is too weak.",
          isRegister: false,
        );
      } else if (e.code == 'email-already-in-use') {
        print('ApiClientImpl.register emailllllll');
        return RegisterModel(
          errorEmail: "The account already exists for that email.",
          isRegister: false,
        );
      }
      return RegisterModel(errorEmail: e.toString(), isRegister: false);
    } catch (e) {
      print(e);
      return RegisterModel(errorEmail: e.toString(), isRegister: false);
    }
  }

  @override
  Future<LoginModel> login(String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      if (credential.user?.email != null) {
        getIt<LocalStorage>().setToken(credential.user!.uid);
        return LoginModel(isLogin: true);
      } else {
        return LoginModel(
            errorEmail: "Kutilmagan xatolik!",
            isLogin: false,
            errorPassword: "Kutilmagan xatolik!");
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return LoginModel(
          errorEmail: "No user found for that email.",
          isLogin: false,
        );
      } else if (e.code == 'wrong-password') {
        return LoginModel(
          errorPassword: "Wrong password provided for that user.",
          isLogin: false,
        );
      }
      return LoginModel(errorEmail: e.toString(), isLogin: false);
    } catch (e) {
      print(e);
      return LoginModel(errorEmail: e.toString(), isLogin: false);
    }
  }
}
