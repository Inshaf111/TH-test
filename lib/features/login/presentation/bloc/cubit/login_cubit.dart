import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../../../core/helpers/md5.dart';
import '../../../domain/entities/login_entity.dart';
import '../../../domain/usecases/login.dart';
import 'package:crypto/crypto.dart';
import 'package:google_sign_in/google_sign_in.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  ///usecases
  final LoginUser userLogin;
  final _googleSignIn = GoogleSignIn(
      // scopes: ['email', 'id'],
      // hostedDomain: "",
      // clientId: "",
      );

  ///load initial state
  LoginCubit({
    required this.userLogin,
  }) : super(LoginInitial(
            isloading: false, errorMessage: "", loginuserData: null));

  Future login(email, password) async {
    password = generateMd5(password);
    // ignore: prefer_const_constructors
    final _result = userLogin(LoginParams(
      email: email,
      password: password,
    ));

    _result.then((value) {
      value.fold(
          //if failed
          (failure) => emit(LoginInitial(
              isloading: false,
              errorMessage: failure.displayErrorMessage(),
              loginuserData: null)),
          //if success
          (loginuserData) => emit(LoginInitial(
                isloading: false,
                errorMessage: "",
                loginuserData: loginuserData,
              )));
    });
  }

  Future googleSignIn() async {
    final user = await _googleSignIn.signIn();
    if (user != null) {
      login(user.email, user.id);
    }
  }
}
