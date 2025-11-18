// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../api/api_client.dart' as _i502;
import '../../api/module.dart' as _i77;
import '../../features/forget_password/data/data_sources/remote/forget_password_data_source_remote_contract.dart'
    as _i421;
import '../../features/forget_password/data/data_sources/remote/forget_password_data_source_remote_impl.dart'
    as _i423;
import '../../features/forget_password/data/repo/forget_password_repo_impl.dart'
    as _i576;
import '../../features/forget_password/domain/repo/forget_password_repo_contract.dart'
    as _i665;
import '../../features/forget_password/domain/use_cases/forget_password_use_case.dart'
    as _i437;
import '../../features/forget_password/domain/use_cases/reset_password_use_case.dart'
    as _i56;
import '../../features/forget_password/domain/use_cases/verify_reset_code_use_case.dart'
    as _i798;
import '../../features/forget_password/presentation/view_model/forget_password_view_model/forget_password_view_model.dart'
    as _i482;
import '../../features/forget_password/presentation/view_model/reset_password_view_model/reset_password_view_model.dart'
    as _i427;
import '../../features/forget_password/presentation/view_model/verify_reset_code/verify_password_view_model.dart'
    as _i0;
import '../../features/hom_screen/data/datasources/local/get_all_subjects_local_ds_conteact.dart'
    as _i693;
import '../../features/hom_screen/data/datasources/local/get_all_subjects_local_ds_impl.dart'
    as _i318;
import '../../features/hom_screen/data/datasources/local/get_exam_by_id_local_ds_contract.dart'
    as _i974;
import '../../features/hom_screen/data/datasources/local/get_exam_by_id_local_ds_impl.dart'
    as _i396;
import '../../features/hom_screen/data/datasources/remote/get_all_subjects_remote_ds_conteact.dart'
    as _i205;
import '../../features/hom_screen/data/datasources/remote/get_all_subjects_remote_ds_impl..dart'
    as _i265;
import '../../features/hom_screen/data/datasources/remote/get_exam_by_id_remote_ds_contract.dart'
    as _i132;
import '../../features/hom_screen/data/datasources/remote/get_exam_by_id_remote_ds_impl.dart'
    as _i161;
import '../../features/hom_screen/data/repo/get_all_subjects_repo_impl.dart'
    as _i721;
import '../../features/hom_screen/data/repo/get_exam_by_id_repo_impl.dart'
    as _i776;
import '../../features/hom_screen/domain/repo/get_all_subjects_repo_contrct.dart'
    as _i51;
import '../../features/hom_screen/domain/repo/get_exam_by_id_repo_contract.dart'
    as _i560;
import '../../features/hom_screen/domain/usecases/get_all_subjects_use_cases.dart'
    as _i811;
import '../../features/hom_screen/domain/usecases/get_exam_by_id_use_case.dart'
    as _i548;
import '../../features/hom_screen/presentation/exams/view_model/exams_viewmodel.dart'
    as _i892;
import '../../features/hom_screen/presentation/subject/view_model/subject_viewmodel.dart'
    as _i641;
import '../../features/login/data/datasources/remote/login_remote_datasource_contract.dart'
    as _i502;
import '../../features/login/data/datasources/remote/login_remote_datasource_impl.dart'
    as _i1069;
import '../../features/login/data/repo/login_repo_impl.dart' as _i176;
import '../../features/login/domain/repo/login_repo_contract.dart' as _i180;
import '../../features/login/domain/usecases/login_usecase.dart' as _i420;
import '../../features/login/presentation/view_model/login_view_model.dart'
    as _i225;
import '../../features/sign_up/data/datasources/local/signup_local_datasource_contract.dart'
    as _i644;
import '../../features/sign_up/data/datasources/local/signup_local_datasource_impl.dart'
    as _i345;
import '../../features/sign_up/data/datasources/remote/signup_remote_datasource_contract.dart'
    as _i138;
import '../../features/sign_up/data/datasources/remote/signup_remote_datasource_impl.dart'
    as _i287;
import '../../features/sign_up/data/repo/signup_repo_impl.dart' as _i821;
import '../../features/sign_up/domain/repo/signup_repo_contract.dart' as _i339;
import '../../features/sign_up/domain/usecases/signup_usecase.dart' as _i5;
import '../../features/sign_up/presentation/view_model/signup_viewmodel.dart'
    as _i519;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final module = _$Module();
    gh.lazySingleton<_i361.Dio>(() => module.provideDio());
    gh.factory<_i693.GetAllSubjectsLocalDsContract>(
      () => _i318.GetAllSubjectsLocalDsImpl(),
    );
    gh.lazySingleton<_i644.SignUpLocalDataSourceContract>(
      () => _i345.SignUpLocalDataSourceImpl(),
    );
    gh.lazySingleton<_i502.ApiClient>(
      () => _i502.ApiClient.new(gh<_i361.Dio>()),
    );
    gh.factory<_i974.GetExamByIdLocalDsContract>(
      () => _i396.GetExamByIdLocalDsImpl(),
    );
    gh.factory<_i132.GetExamByIdRemoteDsContract>(
      () => _i161.GetExamByIdRemoteDsImpl(gh<_i502.ApiClient>()),
    );
    gh.factory<_i138.SignUpRemoteDataSourceContract>(
      () => _i287.SignupRemoteDatasourceImpl(gh<_i502.ApiClient>()),
    );
    gh.factory<_i339.SignUpRepoContract>(
      () => _i821.SignUpRepoImpl(
        gh<_i644.SignUpLocalDataSourceContract>(),
        gh<_i138.SignUpRemoteDataSourceContract>(),
      ),
    );
    gh.factory<_i205.GetAllSubjectsRemoteDsContract>(
      () => _i265.GetAllSubjectsRemoteDsImpl(gh<_i502.ApiClient>()),
    );
    gh.factory<_i51.GetAllSubjectsRepoContract>(
      () => _i721.GetAllSubjectsRepoImpl(
        gh<_i693.GetAllSubjectsLocalDsContract>(),
        gh<_i205.GetAllSubjectsRemoteDsContract>(),
      ),
    );
    gh.factory<_i811.GetAllSubjectsUseCases>(
      () => _i811.GetAllSubjectsUseCases(gh<_i51.GetAllSubjectsRepoContract>()),
    );
    gh.factory<_i560.GetExamByIdRepoContract>(
      () => _i776.GetExamByIdRepoImpl(
        gh<_i132.GetExamByIdRemoteDsContract>(),
        gh<_i974.GetExamByIdLocalDsContract>(),
      ),
    );
    gh.factory<_i502.LoginRemoteDatasourceContract>(
      () => _i1069.LoginRemoteDatasourceImpl(gh<_i502.ApiClient>()),
    );
    gh.factory<_i421.ForgetPasswordDataSourceRemoteContract>(
      () => _i423.ForgetPasswordDataSourceRemoteImpl(gh<_i502.ApiClient>()),
    );
    gh.factory<_i5.SignUpUseCase>(
      () => _i5.SignUpUseCase(gh<_i339.SignUpRepoContract>()),
    );
    gh.factory<_i548.GetExamByIdUseCase>(
      () => _i548.GetExamByIdUseCase(gh<_i560.GetExamByIdRepoContract>()),
    );
    gh.factory<_i641.SubjectViewModel>(
      () => _i641.SubjectViewModel(gh<_i811.GetAllSubjectsUseCases>()),
    );
    gh.factory<_i519.SignUpViewModel>(
      () => _i519.SignUpViewModel(gh<_i5.SignUpUseCase>()),
    );
    gh.factory<_i665.ForgetPasswordRepoContract>(
      () => _i576.ForgetPasswordRepoImpl(
        gh<_i421.ForgetPasswordDataSourceRemoteContract>(),
      ),
    );
    gh.factory<_i892.ExamsViewModel>(
      () => _i892.ExamsViewModel(gh<_i548.GetExamByIdUseCase>()),
    );
    gh.factory<_i180.LoginRepoContract>(
      () => _i176.LoginRepoImpl(gh<_i502.LoginRemoteDatasourceContract>()),
    );
    gh.factory<_i437.ForgetPasswordUseCase>(
      () => _i437.ForgetPasswordUseCase(gh<_i665.ForgetPasswordRepoContract>()),
    );
    gh.factory<_i56.ResetPasswordUseCase>(
      () => _i56.ResetPasswordUseCase(gh<_i665.ForgetPasswordRepoContract>()),
    );
    gh.factory<_i798.VerifyResetCodeUseCase>(
      () =>
          _i798.VerifyResetCodeUseCase(gh<_i665.ForgetPasswordRepoContract>()),
    );
    gh.factory<_i427.ResetPasswordViewModel>(
      () => _i427.ResetPasswordViewModel(gh<_i56.ResetPasswordUseCase>()),
    );
    gh.factory<_i482.ForgetPasswordViewModel>(
      () => _i482.ForgetPasswordViewModel(gh<_i437.ForgetPasswordUseCase>()),
    );
    gh.factory<_i420.LoginUseCase>(
      () => _i420.LoginUseCase(gh<_i180.LoginRepoContract>()),
    );
    gh.factory<_i0.VerifyPasswordViewModel>(
      () => _i0.VerifyPasswordViewModel(gh<_i798.VerifyResetCodeUseCase>()),
    );
    gh.factory<_i225.LoginViewModel>(
      () => _i225.LoginViewModel(gh<_i420.LoginUseCase>()),
    );
    return this;
  }
}

class _$Module extends _i77.Module {}
