import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_nti5/core/cache/cache_helper.dart';
import 'package:news_nti5/core/cache/cache_keys.dart';
import 'package:news_nti5/features/master/views/pages/weather/cubit/weather_state.dart';
import 'package:news_nti5/features/master/views/pages/weather/data/repos/weather_repo.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherInitialState());

  static WeatherCubit get(context) => BlocProvider.of(context);
  WeatherRepo repo = WeatherRepo();

  double lat = CacheHelper.getValue(CacheKeys.lat);
  double lng = CacheHelper.getValue(CacheKeys.lng);

  getWeather() async {
    emit(WeatherLoadingState());
    var result = await repo.getWeatherRepo(lat: lat, lng: lng);

    result.fold(
      (error) => emit(WeatherErrorState(error: error)),
      (success) => emit(WeatherSuccessState(weatherModelResponse: success)),
    );
  }
}
