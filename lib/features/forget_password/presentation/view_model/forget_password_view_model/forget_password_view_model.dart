import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/features/forget_password/data/models_dto/forget_password/forget_password_request.dart';
import 'package:online_exam_app/features/forget_password/domain/models/forget_password_model.dart';
import 'package:online_exam_app/features/forget_password/domain/use_cases/forget_password_use_case.dart';
part 'forget_password_state.dart';

@injectable
class ForgetPasswordViewModel extends Cubit<ForgetPasswordState> {
  final ForgetPasswordUseCase _forgetPasswordUseCase;
  ForgetPasswordViewModel(this._forgetPasswordUseCase) : super(ForgetPasswordInitial());

  void forgetPassword(ForgetPasswordRequest forgetPasswordRequest) async {
    try {
      emit(ForgetPasswordLoading());
      var response = await _forgetPasswordUseCase.call(forgetPasswordRequest);
      emit(ForgetPasswordLoaded(response));
    }
    catch(e){
      emit(ForgetPasswordError(e.toString()));
    }
  }

}
