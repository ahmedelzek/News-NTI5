import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:news_nti5/core/app_router/app_router_keys.dart';
import 'package:news_nti5/core/customized_widgets/customized_button.dart';
import 'package:news_nti5/core/resources/app_assets.dart';
import 'package:news_nti5/core/weather_helper.dart';
import 'package:news_nti5/features/master/views/pages/weather/cubit/weather_cubit.dart';
import 'package:news_nti5/features/master/views/pages/weather/cubit/weather_state.dart';
import 'package:news_nti5/features/master/views/pages/weather/views/widgets/weather_block.dart';
import 'package:news_nti5/features/master/views/pages/weather/views/widgets/weather_item.dart';
import 'package:news_nti5/features/master/views/widgets/customized_app_bar.dart';

import '../../../../../../core/resources/app_colors.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherCubit()..getWeather(),
      child: BlocBuilder<WeatherCubit, WeatherState>(
        builder: (context, state) {
          final cubit = WeatherCubit.get(context);
          if (state is WeatherLoadingState) {
            return Center(child: CircularProgressIndicator(color: AppColors.blue));
          } else if (state is WeatherErrorState) {
            return Center(
              child: Text(
                state.error,
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
              ),
            );
          } else if (state is WeatherSuccessState) {
            final weatherState = state.weatherModelResponse.weather?[0];
            final mainState = state.weatherModelResponse.main;
            return Scaffold(
              body: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 59.h,
                    color: AppColors.white,
                  ),
                  CustomizedAppBar(
                    title: weatherState?.main ?? "",
                    degree: WeatherHelper.kelvinToCelsius(mainState?.temp ?? 00),
                  ),
                  SizedBox(height: 16.h),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 32.w),
                    child: WeatherBlock(
                      country: state.weatherModelResponse.sys?.country,
                      town: state.weatherModelResponse.name,
                      weatherTitle: weatherState?.main,
                      weatherDescription: weatherState?.description,
                      degree: WeatherHelper.kelvinToCelsius(mainState?.temp ?? 00),
                      filsLike: WeatherHelper.kelvinToCelsius(mainState?.feelsLike ?? 00),
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 45.w),
                    child: Row(
                      children: [
                        WeatherItem(
                          icon: AppIcons.temperatureIcon,
                          title: WeatherHelper.kelvinToFahrenheit(mainState?.temp ?? 00),
                          detail: "Fahrenheit",
                        ),
                        Spacer(),
                        WeatherItem(
                          icon: AppIcons.pressureIcon,
                          title: "${mainState?.pressure}",
                          detail: "Pressure",
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 50.h),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 45.w),
                    child: Row(
                      children: [
                        WeatherItem(
                          icon: AppIcons.cloudIcon,
                          title: "${state.weatherModelResponse.clouds?.all}",
                          detail: "Clouds",
                        ),
                        Spacer(),
                        WeatherItem(
                          icon: AppIcons.uvIcon,
                          title:
                              "${state.weatherModelResponse.main?.humidity}%",
                          detail: "humidity",
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 82.h),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 62.w),
                    child: CustomizedButton(
                      text: "Change Location",
                      icon: AppIcons.locationIcon,
                      onTap: () async{
                        cubit.getWeather();
                        await context.push(AppRouterPaths.map);
                      },
                    ),
                  ),
                ],
              ),
            );
          }
          return SizedBox();
        },
      ),
    );
  }

}
