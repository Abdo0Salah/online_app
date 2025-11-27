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
import '../../features/auth/data/data_sources/remote/auth_data_source_remote_contract.dart'
    as _i353;
import '../../features/auth/data/data_sources/remote/auth_data_source_remote_impl.dart'
    as _i195;
import '../../features/auth/data/repo/auth_repo_impl.dart' as _i984;
import '../../features/auth/domain/repo/auth_repo_contract.dart' as _i990;
import '../../features/auth/domain/use_cases/forget_password_use_case.dart'
    as _i483;
import '../../features/auth/domain/use_cases/login_usecase.dart' as _i1012;
import '../../features/auth/domain/use_cases/reset_password_use_case.dart'
    as _i169;
import '../../features/auth/domain/use_cases/verify_reset_code_use_case.dart'
    as _i449;
import '../../features/auth/presentation/view_model/auth_view_model.dart'
    as _i1025;
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
import '../../features/profile/data/datasources/local/get_profile_data_local_data_source_contract.dart'
    as _i20;
import '../../features/profile/data/datasources/local/get_profile_data_local_data_source_impl.dart'
    as _i160;
import '../../features/profile/data/datasources/local/update_profile_data_local_data_source_contract.dart'
    as _i590;
import '../../features/profile/data/datasources/local/update_profile_data_local_data_source_impl.dart'
    as _i591;
import '../../features/profile/data/datasources/remote/get_profile_data_remote_data_source_contract.dart'
    as _i409;
import '../../features/profile/data/datasources/remote/get_profile_data_remote_data_source_impl.dart'
    as _i194;
import '../../features/profile/data/datasources/remote/update_profile_data_remote_data_source_contract.dart'
    as _i184;
import '../../features/profile/data/datasources/remote/update_profile_data_remote_data_source_impl.dart'
    as _i220;
import '../../features/profile/data/repo/get_profile_data_repo_impl.dart'
    as _i512;
import '../../features/profile/data/repo/update_profile_data_repo_impl.dart'
    as _i705;
import '../../features/profile/domain/repo/get_profile_data_repo_contract.dart'
    as _i127;
import '../../features/profile/domain/repo/update_profile_data_repo_contract.dart'
    as _i739;
import '../../features/profile/domain/use_cases/get_user_data_use_case.dart'
    as _i941;
import '../../features/profile/domain/use_cases/update_user_data_use_case.dart'
    as _i544;
import '../../features/profile/presentation/view_model/profile_viewmodel.dart'
    as _i987;
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
    gh.factory<_i590.UpdateProfileDataLocalDataSourceContract>(
      () => _i591.UpdateProfileDataLocalDataSourceImpl(),
    );
    gh.lazySingleton<_i644.SignUpLocalDataSourceContract>(
      () => _i345.SignUpLocalDataSourceImpl(),
    );
    gh.factory<_i20.GetProfileDataLocalDataSourceContract>(
      () => _i160.GetProfileDataLocalDataSourceImpl(),
    );
    gh.lazySingleton<_i502.ApiClient>(
      () => _i502.ApiClient.new(gh<_i361.Dio>()),
    );
    gh.factory<_i974.GetExamByIdLocalDsContract>(
      () => _i396.GetExamByIdLocalDsImpl(),
    );
    gh.factory<_i353.AuthDataSourceRemoteContract>(
      () => _i195.AuthDataSourceRemoteImpl(gh<_i502.ApiClient>()),
    );
    gh.factory<_i132.GetExamByIdRemoteDsContract>(
      () => _i161.GetExamByIdRemoteDsImpl(gh<_i502.ApiClient>()),
    );
    gh.factory<_i138.SignUpRemoteDataSourceContract>(
      () => _i287.SignupRemoteDatasourceImpl(gh<_i502.ApiClient>()),
    );
    gh.factory<_i184.UpdateProfileDataRemoteDataSourceContract>(
      () => _i220.UpdateProfileDataRemoteDataSourceImpl(gh<_i502.ApiClient>()),
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
    gh.factory<_i409.GetProfileDataRemoteDataSourceContract>(
      () => _i194.GetProfileDataRemoteDataSourceImpl(gh<_i502.ApiClient>()),
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
    gh.factory<_i127.GetProfileDataRepoContract>(
      () => _i512.GetProfileDataRepoImpl(
        gh<_i409.GetProfileDataRemoteDataSourceContract>(),
        gh<_i20.GetProfileDataLocalDataSourceContract>(),
      ),
    );
    gh.factory<_i560.GetExamByIdRepoContract>(
      () => _i776.GetExamByIdRepoImpl(
        gh<_i132.GetExamByIdRemoteDsContract>(),
        gh<_i974.GetExamByIdLocalDsContract>(),
      ),
    );
    gh.factory<_i990.AuthRepoContract>(
      () => _i984.AuthRepoImpl(gh<_i353.AuthDataSourceRemoteContract>()),
    );
    gh.factory<_i5.SignUpUseCase>(
      () => _i5.SignUpUseCase(gh<_i339.SignUpRepoContract>()),
    );
    gh.factory<_i739.UpdateProfileDataRepoContract>(
      () => _i705.UpdateProfileDataRepoImpl(
        gh<_i184.UpdateProfileDataRemoteDataSourceContract>(),
        gh<_i590.UpdateProfileDataLocalDataSourceContract>(),
      ),
    );
    gh.factory<_i483.ForgetPasswordUseCase>(
      () => _i483.ForgetPasswordUseCase(gh<_i990.AuthRepoContract>()),
    );
    gh.factory<_i1012.LoginUseCase>(
      () => _i1012.LoginUseCase(gh<_i990.AuthRepoContract>()),
    );
    gh.factory<_i169.ResetPasswordUseCase>(
      () => _i169.ResetPasswordUseCase(gh<_i990.AuthRepoContract>()),
    );
    gh.factory<_i449.VerifyResetCodeUseCase>(
      () => _i449.VerifyResetCodeUseCase(gh<_i990.AuthRepoContract>()),
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
    gh.factory<_i941.GetUserDataUseCase>(
      () => _i941.GetUserDataUseCase(gh<_i127.GetProfileDataRepoContract>()),
    );
    gh.factory<_i544.UpdateUserDataUseCase>(
      () => _i544.UpdateUserDataUseCase(
        gh<_i739.UpdateProfileDataRepoContract>(),
      ),
    );
    gh.factory<_i892.ExamsViewModel>(
      () => _i892.ExamsViewModel(gh<_i548.GetExamByIdUseCase>()),
    );
    gh.factory<_i987.ProfileViewModel>(
      () => _i987.ProfileViewModel(
        gh<_i941.GetUserDataUseCase>(),
        gh<_i544.UpdateUserDataUseCase>(),
      ),
    );
    gh.factory<_i1025.AuthViewModel>(
      () => _i1025.AuthViewModel(
        gh<_i1012.LoginUseCase>(),
        gh<_i483.ForgetPasswordUseCase>(),
        gh<_i449.VerifyResetCodeUseCase>(),
        gh<_i169.ResetPasswordUseCase>(),
      ),
    );
    return this;
  }
}

class _$Module extends _i77.Module {}
