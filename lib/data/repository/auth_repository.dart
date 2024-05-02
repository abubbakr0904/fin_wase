import 'package:firebase_auth/firebase_auth.dart';
import '../exception/exception.dart';
import '../responce/network_responce.dart';

class AuthRepository {
  Future<NetworkResponse> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential =
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return NetworkResponse(data: userCredential);
    } on FirebaseAuthException catch (e) {
      return NetworkResponse(
        errorText: SignUpWithEmailAndPasswordFailure.fromCode(e.code).message,
      );
    } catch (error) {
      return NetworkResponse(
          errorText: "An unknown exception occurred: ${error}");
    }
  }

  Future<NetworkResponse> checkUser() async {
    NetworkResponse networkResponse = NetworkResponse();

    try {
      networkResponse.data = FirebaseAuth.instance.currentUser;
    } on FirebaseAuthException catch (error) {
      networkResponse.errorText = error.code;
    } catch (err) {
      networkResponse.errorText = err.toString();
    }
    return networkResponse;
  }

  Future<NetworkResponse> registerWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential =
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return NetworkResponse(data: userCredential);
    } on FirebaseAuthException catch (e) {
      return NetworkResponse(
        errorText: LogInWithEmailAndPasswordFailure.fromCode(e.code).message,
      );
    } catch (error) {
      return NetworkResponse(
          errorText: "An unknown exception occurred: ${error}");
    }
  }

  Future<NetworkResponse> logOutUser() async {
    try {
      await FirebaseAuth.instance.signOut();
      return NetworkResponse(data: "success");
    } on FirebaseAuthException catch (e) {
      return NetworkResponse(
        errorText: "Sign Out Error: ${e.message}",
      );
    } catch (_) {
      return NetworkResponse(errorText: "An unknown exception occurred");
    }
  }
}