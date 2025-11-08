// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

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
import '../../features/hom_screen/data/datasources/local/get_all_subjects_local_ds_conteact.dart'
    as _i693;
import '../../features/hom_screen/data/datasources/local/get_all_subjects_local_ds_impl.dart'
    as _i318;
import '../../features/hom_screen/data/datasources/remote/get_all_subjects_remote_ds_conteact.dart'
    as _i205;
import '../../features/hom_screen/data/datasources/remote/get_all_subjects_remote_ds_impl..dart'
    as _i265;
import '../../features/hom_screen/data/repo/get_all_subjects_repo_impl.dart'
    as _i721;
import '../../features/hom_screen/domain/repo/get_all_subjects_repo_contrct.dart'
    as _i51;
import '../../features/hom_screen/domain/usecases/get_all_subjects_use_cases.dart'
    as _i811;
import '../../features/hom_screen/presintation/view_model/home_viewmodel.dart'
    as _i703;
import '../../features/login/data/datasources/remote/login_remote_datasource_contract.dart'
    as _i502;
import '../../features/login/data/datasources/remote/login_remote_datasource_impl.dart'
    as _i1069;
import '../../features/login/data/repo/login_repo_impl.dart' as _i176;
import '../../features/login/domain/repo/login_repo_contract.dart' as _i180;
import '../../features/login/domain/usecases/login_usecase.dart' as _i420;
import '../../features/login/presentation/view_model/login_cubit.dart' as _i696;
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
import '../../features/sign_up/presintation/view_model/signup_viewmodel.dart'
    as _i270;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final module = _$Module();
    gh.lazySingleton<_i361.Dio>(() => module.provideDio());
    gh.factory<_i693.GetAllSubjectsLocalDsConteact>(
      () => _i318.GetAllSubjectsLocalDsImpl(),
    );
    gh.lazySingleton<_i644.SignUpLocalDataSourceContract>(
      () => _i345.SignUpLocalDataSourceImpl(),
    );
    gh.factory<_i502.ApiClient>(() => _i502.ApiClient(gh<_i361.Dio>()));
    gh.factory<_i138.SignUpRemoteDataSourceContract>(
      () => _i287.SignupRemoteDatasourceImpl(gh<_i502.ApiClient>()),
    );
    gh.factory<_i339.SignUpRepoContract>(
      () => _i821.SignUpRepoImpl(
        gh<_i644.SignUpLocalDataSourceContract>(),
        gh<_i138.SignUpRemoteDataSourceContract>(),
      ),
    );
    gh.factory<_i205.GetAllSubjectsRemoteDsConteact>(
      () => _i265.GetAllSubjectsRemoteDsImpl(gh<_i502.ApiClient>()),
    );
    gh.factory<_i502.LoginRemoteDatasourceContract>(
      () => _i1069.LoginRemoteDatasourceImpl(gh<_i502.ApiClient>()),
    );
    gh.factory<_i5.SignUpUseCase>(
      () => _i5.SignUpUseCase(gh<_i339.SignUpRepoContract>()),
    );
    gh.factory<_i51.GetAllSubjectsRepoContrct>(
      () => _i721.GetAllSubjectsRepoImpl(
        gh<_i693.GetAllSubjectsLocalDsConteact>(),
        gh<_i205.GetAllSubjectsRemoteDsConteact>(),
      ),
    );
    gh.factory<_i811.GetAllSubjectsUseCases>(
      () => _i811.GetAllSubjectsUseCases(gh<_i51.GetAllSubjectsRepoContrct>()),
    );
    gh.factory<_i180.LoginRepoContract>(
      () => _i176.LoginRepoImpl(gh<_i502.LoginRemoteDatasourceContract>()),
    );
    gh.factory<_i270.SignUpViewModel>(
      () => _i270.SignUpViewModel(gh<_i5.SignUpUseCase>()),
    );
    gh.factory<_i703.HomeViewModel>(
      () => _i703.HomeViewModel(gh<_i811.GetAllSubjectsUseCases>()),
    );
    gh.factory<_i420.LoginUseCase>(
      () => _i420.LoginUseCase(gh<_i180.LoginRepoContract>()),
    );
    gh.factory<_i696.LoginCubit>(
      () => _i696.LoginCubit(gh<_i420.LoginUseCase>()),
    );
    return this;
  }
}

class _$Module extends _i77.Module {}
