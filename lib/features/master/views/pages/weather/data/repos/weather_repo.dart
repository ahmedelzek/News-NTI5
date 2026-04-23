import 'package:dartz/dartz.dart';
import 'package:news_nti5/core/network/api_helper.dart';
import 'package:news_nti5/features/master/views/pages/weather/data/models/weather_model_response.dart';

import '../../../../../../../core/network/api_response.dart';
import '../../../../../../../core/network/end_points.dart';

class WeatherRepo {
  final WeatherAPIHelper _apiHelper = WeatherAPIHelper();

  Future<Either<String, WeatherModelResponse>> getWeatherRepo({
    required double lat,
    required double lng,
  }) async {
    try {
      var result = await _apiHelper.getRequest(
        endPoint: EndPoints.weather,
        queryParams: {'lat': lat, 'lon': lng},
      );
      if (result.status) {
        var responseModel = WeatherModelResponse.fromJson(
          result.data as Map<String, dynamic>,
        );
        return Right(responseModel);
      } else {
        return left(result.message);
      }
    } catch (e) {
      return left(ApiResponse.fromError(e).message);
    }
  }
}
