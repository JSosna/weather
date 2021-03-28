import 'package:flutter/material.dart';
import 'package:weather/core/models/weather.dart';
import 'package:weather/ui/views/choose_location_view.dart';
import 'package:weather/ui/views/weather_view.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => ChooseLocationView());
      case 'weather':
        var weather = settings.arguments as Weather;
        return MaterialPageRoute(builder: (_) => WeatherView(weather));
      default:
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          );
        });
    }
  }
}
