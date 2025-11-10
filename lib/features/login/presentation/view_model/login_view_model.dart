import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/features/login/data/models_dto/login/request_login.dart';
import 'package:online_exam_app/features/login/domain/models/response_login.dart';
import 'package:online_exam_app/features/login/domain/usecases/login_usecase.dart';
part 'login_state.dart';

@injectable
class LoginViewModel extends Cubit<LoginState> {
  final LoginUseCase _loginUseCase;
  LoginViewModel(this._loginUseCase) : super(LoginInitial());

  void login (RequestLogin requestLogin) async {
    try {
      emit(LoginLoading());
      var response = await _loginUseCase.call(requestLogin);
      emit(LoginLoaded(response));
    }
    catch(e){
      emit(LoginError(e.toString()));
    }
  }
}
