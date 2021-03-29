import 'package:weather/core/api/open_weather_map_api.dart';
import 'package:weather/core/enums/weather_condition.dart';
import 'package:weather/core/models/weather.dart';
import 'package:weather/core/services/weather_service.dart';
import 'package:weather/core/utils/temperature_conversions.dart';

import 'base_view_model.dart';

class WeatherViewModel extends BaseViewModel {
  bool isRequestPending = false;
  bool isWeatherLoaded = false;
  bool isRequestError = false;

  WeatherCondition _condition;
  String _description;
  double _temp;
  double _feelsLike;
  String _city;
  double _humidity;
  double _pressure;
  bool _isDayTime;

  WeatherCondition get condition => _condition;
  String get description => _description;
  double get temp => _temp;
  double get feelsLike => _feelsLike;
  String get city => _city;
  double get humidity => _humidity;
  double get pressure => _pressure;
  bool get isDaytime => _isDayTime;

  WeatherService weatherService;

  WeatherViewModel() {
    weatherService = WeatherService(OpenWeatherMapApi());
  }

  Future<Weather> getLatestWeather(String city) async {
    setRequestPendingState(true);
    this.isRequestError = false;

    Weather latest;
    try {
      await Future.delayed(Duration(seconds: 1), () => {});

      latest = await weatherService
          .getWeatherFromCity(city)
          .catchError((onError) => this.isRequestError = true);
    } catch (e) {
      this.isRequestError = true;
    }

    this.isWeatherLoaded = true;
    updateModel(latest);
    setRequestPendingState(false);
    notifyListeners();
    return latest;
  }

  void setRequestPendingState(bool isPending) {
    this.isRequestPending = isPending;
    notifyListeners();
  }

  void updateModel(Weather weather) {
    if (isRequestError) return;

    _condition = weather.condition;
    _description = weather.description;
    _city = weather.locationName;
    _temp = TemperatureConversions.kelvinToCelsius(weather.temp);
    _feelsLike = TemperatureConversions.kelvinToCelsius(weather.feelLikeTemp);
    _humidity = weather.humidity;
    _pressure = weather.pressure;
    _isDayTime = weather.isDay;
  }
}
