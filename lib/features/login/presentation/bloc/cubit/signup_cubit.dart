import 'package:bloc/bloc.dart';
import 'package:dukkantek/core/helpers/md5.dart';
import 'package:meta/meta.dart';

import '../../../domain/entities/login_entity.dart';
import '../../../domain/usecases/login.dart';
import '../../../domain/usecases/sign_up.dart';
import 'package:google_sign_in/google_sign_in.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final SignUp signUp;
  final _googleSignIn = GoogleSignIn();

  SignupCubit({required this.signUp})
      : super(SignupInitial(
            isloading: false, errorMessage: "", loginuserData: null));

  Future signUpUser(email, password) async {
    password = generateMd5(password);
    final _result = signUp(LoginParams(
      email: email,
      password: password,
    ));

    _result.then((value) {
      value.fold(
          //if failed
          (failure) => emit(SignupInitial(
              isloading: false,
              errorMessage: failure.displayErrorMessage(),
              loginuserData: null)),
          //if success
          (loginuserData) => emit(SignupInitial(
                isloading: false,
                errorMessage: "",
                loginuserData: loginuserData,
              )));
    });
  }

  Future googleSignIn() async {
    final user = await _googleSignIn.signIn();
    if (user != null) {
      signUpUser(user.email, user.id);
    }
  }
}
