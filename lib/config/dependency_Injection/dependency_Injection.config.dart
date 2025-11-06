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

import '../../features/hom_screen/api/api_client/api_client.dart' as _i51;
import '../../features/hom_screen/api/datasources/get_all_subjects_local_ds_impl.dart'
    as _i120;
import '../../features/hom_screen/api/datasources/get_all_subjects_remote_ds_impl..dart'
    as _i994;
import '../../features/hom_screen/data/datasources/get_all_subjects_local_ds_conteact.dart'
    as _i997;
import '../../features/hom_screen/data/datasources/get_all_subjects_remote_ds_conteact.dart'
    as _i335;
import '../../features/hom_screen/data/repo/get_all_subjects_repo_impl.dart'
    as _i721;
import '../../features/hom_screen/domain/repo/get_all_subjects_repo_contrct.dart'
    as _i51;
import '../../features/hom_screen/domain/usecases/get_all_subjects_use_cases.dart'
    as _i811;
import '../../features/hom_screen/presintation/view_model/home_viewmodel.dart'
    as _i703;
import '../../features/sign_up/api/api_client/api_client.dart' as _i1009;
import '../../features/sign_up/api/datasources/signup_local_datasource_impl.dart'
    as _i911;
import '../../features/sign_up/api/datasources/signup_remote_datasource_impl.dart'
    as _i799;
import '../../features/sign_up/data/datasources/signup_local_datasource_contract.dart'
    as _i836;
import '../../features/sign_up/data/datasources/signup_remote_datasource_contract.dart'
    as _i735;
import '../../features/sign_up/data/repo/signup_repo_impl.dart' as _i821;
import '../../features/sign_up/domain/repo/signup_repo_contract.dart' as _i339;
import '../../features/sign_up/domain/usecases/signup_usecase.dart' as _i5;
import '../../features/sign_up/presintation/view_model/signup_viewmodel.dart'
    as _i270;
import '../modules/dio_module.dart' as _i948;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    gh.singleton<_i361.Dio>(() => registerModule.dio);
    gh.factory<_i997.GetAllSubjectsLocalDsConteact>(
      () => _i120.GetAllSubjectsLocalDsImpl(),
    );
    gh.lazySingleton<_i836.SignUpLocalDataSourceContract>(
      () => _i911.SignUpLocalDataSourceImpl(),
    );
    gh.factory<_i51.GetSubjectApiClient>(
      () => _i51.GetSubjectApiClient(gh<_i361.Dio>()),
    );
    gh.factory<_i1009.SignUpApiClient>(
      () => _i1009.SignUpApiClient(gh<_i361.Dio>()),
    );
    gh.factory<_i735.SignUpRemoteDataSourceContract>(
      () => _i799.SignupRemoteDatasourceImpl(gh<_i1009.SignUpApiClient>()),
    );
    gh.factory<_i335.GetAllSubjectsRemoteDsConteact>(
      () => _i994.GetAllSubjectsRemoteDsImpl(gh<_i51.GetSubjectApiClient>()),
    );
    gh.factory<_i51.GetAllSubjectsRepoContrct>(
      () => _i721.GetAllSubjectsRepoImpl(
        gh<_i997.GetAllSubjectsLocalDsConteact>(),
        gh<_i335.GetAllSubjectsRemoteDsConteact>(),
      ),
    );
    gh.factory<_i339.SignUpRepoContract>(
      () => _i821.SignUpRepoImpl(
        gh<_i836.SignUpLocalDataSourceContract>(),
        gh<_i735.SignUpRemoteDataSourceContract>(),
      ),
    );
    gh.factory<_i811.GetAllSubjectsUseCases>(
      () => _i811.GetAllSubjectsUseCases(gh<_i51.GetAllSubjectsRepoContrct>()),
    );
    gh.factory<_i5.SignUpUseCase>(
      () => _i5.SignUpUseCase(gh<_i339.SignUpRepoContract>()),
    );
    gh.factory<_i703.HomeViewModel>(
      () => _i703.HomeViewModel(gh<_i811.GetAllSubjectsUseCases>()),
    );
    gh.factory<_i270.SignUpViewModel>(
      () => _i270.SignUpViewModel(gh<_i5.SignUpUseCase>()),
    );
    return this;
  }
}

class _$RegisterModule extends _i948.RegisterModule {}
