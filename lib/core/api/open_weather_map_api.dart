import "dart:convert";
import "package:http/http.dart" as http;
import 'package:weather/core/models/location.dart';
import 'package:weather/core/models/weather.dart';
import 'weather_api.dart';


class OpenWeatherMapApi extends WeatherApi {
  static const endPointUrl = 'https://api.openweathermap.org/data/2.5';
  static const apiKey = "80971f3bda84d7f49e037e9de469b388";

  var client = http.Client();

  @override
  Future<Location> getLocation(String city) async {
    final requestUrl = '$endPointUrl/weather?q=$city&APPID=$apiKey';
    final response = await client.get(Uri.parse(requestUrl));

    if (response.statusCode != 200) {
      //throw Exception(
          //'error retrieving location for city $city: ${response.statusCode}');
      return null;
    }

    return Location.fromJson(jsonDecode(response.body));
  }

  @override
  Future<Weather> getWeather(Location location) async {
    final requestUrl =
        '$endPointUrl/weather?lat=${location.latitude}&lon=${location.longitude}&APPID=$apiKey';
    final response = await client.get(Uri.parse(requestUrl));

    if (response.statusCode != 200) {
      throw Exception('error retrieving weather: ${response.statusCode}');
    }

    return Weather.fromDailyJson(jsonDecode(response.body));
  }
}
