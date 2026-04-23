abstract class WeatherHelper{

  static String kelvinToFahrenheit(double kelvin) {
    double fahrenheit = (kelvin - 273.15) * 9 / 5 + 32;
    return '${fahrenheit.toStringAsFixed(1)}°';
  }

  static String kelvinToCelsius(double kelvin) {
    double celsius = (kelvin) - 273.15;
    return '${celsius.toStringAsFixed(1)}°C';
  }
}