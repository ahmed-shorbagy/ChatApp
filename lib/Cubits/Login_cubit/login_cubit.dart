import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  Future<void> loginUser(
      {required String email, required String password}) async {
    emit(LoginLoading());
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      emit(LoginSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found' ||
          e.code == 'ERROR_USER_NOT_FOUND' ||
          e.code == "ERROR_INVALID_EMAIL" ||
          e.code == "invalid-email") {
        emit(LoginFailed(errMassege: 'No user found for that email.'));
      } else if (e.code == 'wrong-password') {
        emit(LoginFailed(errMassege: 'Wrong password provided for that user.'));
      } else {
        emit(LoginFailed(errMassege: 'some thing went worong'));
      }
    }
  }
}
