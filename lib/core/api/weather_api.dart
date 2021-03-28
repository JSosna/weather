import 'package:weather/core/models/location.dart';
import 'package:weather/core/models/weather.dart';

abstract class WeatherApi {
  Future<Weather> getWeather(Location location);
  Future<Location> getLocation(String city);
}