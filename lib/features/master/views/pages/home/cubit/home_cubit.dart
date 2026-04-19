import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/models/article_response.dart';
import '../data/repos/get_news_repo.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);

  NewsRepo repo = NewsRepo();

  ArticlesResponseModel? news;
  ArticlesResponseModel? topHeadlines;

  getHomeData() async {
    emit(HomeLoadingState());

    var newsResult = await repo.fetchArticles();
    var headlinesResult = await repo.fetchTopHeadlines();

    newsResult.fold(
          (error) => emit(HomeErrorState(error: error)),
          (newsResponse) {
        news = newsResponse;

        headlinesResult.fold(
              (error) => emit(HomeErrorState(error: error)),
              (headlinesResponse) {
            topHeadlines = headlinesResponse;
            emit(HomeSuccessState());
          },
        );
      },
    );
  }
}