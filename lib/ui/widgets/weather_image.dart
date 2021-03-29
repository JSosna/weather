import 'package:flutter/material.dart';
import 'package:weather/core/enums/weather_condition.dart';

Image getWeatherImage(WeatherCondition condition, bool isDay, double height) {
  String image = "";

  switch (condition) {
    case WeatherCondition.thunderstorm:
      image = 'assets/images/11d.png';
      break;
    case WeatherCondition.heavyCloud:
      image = 'assets/images/04d.png';
      break;
    case WeatherCondition.lightCloud:
      isDay ? image = 'assets/images/02d.png' : image = 'assets/images/02n.png';
      break;
    case WeatherCondition.drizzle:
      image = 'assets/images/09d.png';
      break;
    case WeatherCondition.clear:
      isDay ? image = 'assets/images/01d.png' : image = 'assets/images/01n.png';
      break;
    case WeatherCondition.snow:
      image = 'assets/images/13d.png';
      break;
    case WeatherCondition.rain:
      image = 'assets/images/09d.png';
      break;
    case WeatherCondition.mist:
    case WeatherCondition.fog:
    case WeatherCondition.atmosphere:
      image = 'assets/images/50d.png';
      break;

    default:
      image = 'assets/images/unknown.png';
      return Image.asset('assets/images/unknown.png');
  }

  return Image.asset(image, height: height);
}
