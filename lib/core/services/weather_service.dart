import 'package:weather/core/api/weather_api.dart';
import 'package:weather/core/models/location.dart';
import 'package:weather/core/models/weather.dart';

class WeatherService {
  final WeatherApi weatherApi;

  WeatherService(this.weatherApi);

  Future<Weather> getWeatherFromCity(String city) async {
    final location = await weatherApi.getLocation(city);
    return await weatherApi.getWeather(location);
  }

  Future<Weather> getWeatherFromLocation(Location location) async {
    return await weatherApi.getWeather(location);
  }
}
