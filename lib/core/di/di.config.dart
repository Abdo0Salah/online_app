// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../api/api_client.dart' as _i502;
import '../../features/login/data/datasources/remote/login_remote_datasource_contract.dart'
    as _i502;
import '../../features/login/data/datasources/remote/login_remote_datasource_impl.dart'
    as _i1069;
import '../../features/login/data/repo/login_repo_impl.dart' as _i176;
import '../../features/login/domain/repo/login_repo_contract.dart' as _i180;
import '../../features/login/domain/usecases/login_usecase.dart' as _i420;
import '../../features/login/presentation/view_model/login_cubit.dart' as _i696;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.factory<_i696.LoginCubit>(
      () => _i696.LoginCubit(gh<_i420.LoginUseCase>()),
    );
    gh.factory<_i502.LoginRemoteDatasourceContract>(
      () => _i1069.LoginRemoteDatasourceImpl(gh<_i502.ApiClient>()),
    );
    gh.factory<_i180.LoginRepoContract>(
      () => _i176.LoginRepoImpl(gh<_i502.LoginRemoteDatasourceContract>()),
    );
    return this;
  }
}
