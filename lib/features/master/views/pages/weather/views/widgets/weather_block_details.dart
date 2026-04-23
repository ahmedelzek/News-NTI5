import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_nti5/features/master/views/pages/weather/views/widgets/weather_item.dart';

import '../../../../../../../core/resources/app_assets.dart';

class WeatherBlockDetails extends StatelessWidget {
  const WeatherBlockDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            WeatherItem(
              icon: AppIcons.temperatureIcon,
              title: "70°",
              detail: "Fahrenheit",
            ),
            SizedBox(height: 50.h),
            WeatherItem(
              icon: AppIcons.uvIcon,
              title: "0.2",
              detail: "UV Index",
            ),
          ],
        ),
        Spacer(),
        Column(
          children: [
            WeatherItem(
              icon: AppIcons.pressureIcon,
              title: "134mp/h",
              detail: "Pressure",
            ),
            SizedBox(height: 50.h),
            WeatherItem(
              icon: AppIcons.cloudIcon,
              title: "48%",
              detail: "Humidity",
            ),
          ],
        ),
      ],
    );
  }
}
