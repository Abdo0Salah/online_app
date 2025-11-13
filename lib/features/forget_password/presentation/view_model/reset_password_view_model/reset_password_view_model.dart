import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/features/forget_password/data/models_dto/reset_password/reset_password_request.dart';
import 'package:online_exam_app/features/forget_password/data/models_dto/reset_password/reset_password_response.dart';
import 'package:online_exam_app/features/forget_password/domain/use_cases/reset_password_use_case.dart';

part 'reset_password_state.dart';
@injectable
class ResetPasswordViewModel extends Cubit<ResetPasswordState> {
  final ResetPasswordUseCase _resetPasswordUseCase;
  ResetPasswordViewModel(this._resetPasswordUseCase) : super(ResetPasswordInitial());

  void resetPassword ({required String email, required String newPassword}) async {
    try{
      emit(ResetPasswordLoading());
      var request = ResetPasswordRequest(email: email,newPassword: newPassword);
      var response = await _resetPasswordUseCase.call(request);
      emit(ResetPasswordLoaded(response));
    }
    catch (e){
      emit(ResetPasswordError(e.toString()));
    }



  }


}
