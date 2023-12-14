// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:data/api/example_api.dart' as _i4;
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'data_module.dart' as _i5;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final dataModule = _$DataModule(this);
    gh.singleton<_i3.Dio>(dataModule.dio);
    gh.singleton<_i4.ExampleApi>(dataModule.exampleApi);
    return this;
  }
}

class _$DataModule extends _i5.DataModule {
  _$DataModule(this._getIt);

  final _i1.GetIt _getIt;

  @override
  _i4.ExampleApi get exampleApi => _i4.ExampleApi(_getIt<_i3.Dio>());
}
