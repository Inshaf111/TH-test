import 'package:bloc/bloc.dart';
import 'package:dukkantek/core/usecases/usecase.dart';
import 'package:meta/meta.dart';
import '../../../domain/entities/user_entity.dart';
import '../../../domain/usecases/get_user.dart';
import 'package:crypto/crypto.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  ///usecases
  final GetUser getUser;

  ///load initial state
  HomeCubit({
    required this.getUser,
  }) : super(HomeInitial());

  Future getUserData() async {
    emit(HomeLoading());
    final _result = getUser(NoParams());

    _result.then((value) {
      value.fold(
          //if failed
          (failure) => emit(HomeError(
                errorMessage: failure.displayErrorMessage(),
              )),
          //if success
          (loginuserData) => emit(HomeLoaded(
                userData: loginuserData,
              )));
    });
  }
}
