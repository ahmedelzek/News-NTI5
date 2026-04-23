import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_nti5/features/master/views/pages/weather/data/models/weather_model_response.dart';
import 'package:news_nti5/features/master/views/pages/weather/data/repos/weather_repo.dart';

import '../../../../../../core/cache/cache_helper.dart';
import '../../../../../../core/cache/cache_keys.dart';
import '../data/models/article_response.dart';
import '../data/repos/get_news_repo.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);

  NewsRepo repo = NewsRepo();
  WeatherRepo weatherRepo = WeatherRepo();

  double lat = CacheHelper.getValue(CacheKeys.lat);
  double lng = CacheHelper.getValue(CacheKeys.lng);

  ArticlesResponseModel? news;
  ArticlesResponseModel? topHeadlines;
  WeatherModelResponse? weatherModelResponse;

  getHomeData() async {
    emit(HomeLoadingState());

    var newsResult = await repo.fetchArticles();
    var headlinesResult = await repo.fetchTopHeadlines();

    newsResult.fold((error) => emit(HomeErrorState(error: error)), (
      newsResponse,
    ) {
      news = newsResponse;

      headlinesResult.fold((error) => emit(HomeErrorState(error: error)), (
        headlinesResponse,
      ) {
        topHeadlines = headlinesResponse;
        emit(HomeSuccessState());
      });
    });
  }

  getWeather() async {
    var result = await weatherRepo.getWeatherRepo(lat: lat, lng: lng);
    result.fold((error) => emit(HomeErrorState(error: error)), (success) {
      weatherModelResponse = success;
      emit(HomeSuccessState());
    });
  }
}
