// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../core/interactor/get_all_bikes_use_case.dart' as _i5;
import '../../core/repository/BikeRepository.dart' as _i4;
import '../../domain/repository/i_bike_repository.dart' as _i3;
import '../viewmodel/bikes_view_model.dart'
    as _i6; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.lazySingleton<_i3.IBikeRepository>(() => _i4.BikeRepository());
  gh.factory<_i5.GetAllBikesUseCase>(
      () => _i5.GetAllBikesUseCase(get<_i3.IBikeRepository>()));
  gh.lazySingleton<_i6.BikesViewModel>(
      () => _i6.BikesViewModel(get<_i5.GetAllBikesUseCase>()));
  return get;
}
