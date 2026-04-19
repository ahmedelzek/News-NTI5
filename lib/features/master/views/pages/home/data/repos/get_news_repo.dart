import 'package:dartz/dartz.dart';

import '../../../../../../../core/network/api_helper.dart';
import '../../../../../../../core/network/api_response.dart';
import '../../../../../../../core/network/end_points.dart';
import '../models/article_response.dart';

class NewsRepo{

  var apiHelper = NewsAPIHelper();

  Future<Either<String, ArticlesResponseModel>> fetchArticles() async
  {
    try{
      var result = await apiHelper.getRequest(endPoint: EndPoints.everything);
      if(result.status){
        var responseModel = ArticlesResponseModel.fromJson(result.data as Map<String, dynamic>);
        return Right(responseModel);

      }
      else{
        return left(result.message);
      }

    }
    catch(e){
      return left(ApiResponse.fromError(e).message);
    }
  }


  Future<Either<String, ArticlesResponseModel>> fetchTopHeadlines() async
  {
    try{
      var result = await apiHelper.getRequest(endPoint: EndPoints.topHeadlines);
      if(result.status){
        var responseModel = ArticlesResponseModel.fromJson(result.data as Map<String, dynamic>);
        return Right(responseModel);

      }
      else{
        return left(result.message);
      }

    }
    catch(e){
      return left(ApiResponse.fromError(e).message);
    }
  }
}