import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/features/forget_password/data/models_dto/verify_reset_code/verify_reset_code_request.dart';
import 'package:online_exam_app/features/forget_password/data/models_dto/verify_reset_code/verify_reset_code_response.dart';
import 'package:online_exam_app/features/forget_password/domain/use_cases/verify_reset_code_use_case.dart';

part 'verify_password_state.dart';
@injectable
class VerifyPasswordViewModel extends Cubit<VerifyPasswordState> {
  final VerifyResetCodeUseCase _verifyResetCodeUseCase;
  VerifyPasswordViewModel(this._verifyResetCodeUseCase) : super(VerifyPasswordInitial());

  void verifyPassword (String resetCode) async {
    try {
      emit(VerifyPasswordLoading());

      var request = VerifyResetCodeRequest(resetCode: resetCode);
      var response = await _verifyResetCodeUseCase.call(request);
      emit(VerifyPasswordLoaded(response));
    }
    catch(e){
      emit(VerifyPasswordError(e.toString()));
    }
  }



}
