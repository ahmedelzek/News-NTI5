import 'package:news_nti5/features/master/views/pages/weather/data/models/weather_model_response.dart';

abstract class WeatherState {}

class WeatherInitialState extends WeatherState {}

class WeatherLoadingState extends WeatherState {}

class WeatherErrorState extends WeatherState {
  String error;
  WeatherErrorState({required this.error});
}

class WeatherSuccessState extends WeatherState {
  WeatherModelResponse weatherModelResponse;
  WeatherSuccessState({required this.weatherModelResponse});
}