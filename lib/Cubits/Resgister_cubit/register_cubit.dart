import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
  Future<void> registerUser(
      {required String email, required String password}) async {
    emit(RegisterLoading());
    try {
      var auth = FirebaseAuth.instance;
      UserCredential user = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      ;
      emit(RegisterSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == "ERROR_INVALID_EMAIL" || e.code == "invalid-email") {
        emit(RegisterFailed(errMassege: "Email address is invalid."));
      } else if (e.code == 'ERROR_EMAIL_ALREADY_IN_USE' ||
          e.code == "email-already-in-use") {
        emit(RegisterFailed(
            errMassege: "Email already used. Go to login page."));
      } else {
        emit(RegisterFailed(errMassege: 'some thing went worong'));
      }
    }
  }
}
