import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:weather/core/enums/viewstate.dart';
import 'package:weather/core/models/weather.dart';
import 'package:weather/core/services/location_service.dart';
import 'package:weather/core/services/weather_service.dart';
import 'package:weather/core/viewmodels/base_view_model.dart';
import '../../locator.dart';
import 'weather_view_model.dart';

class ChooseLocationViewModel extends BaseViewModel {
  final WeatherService _weatherService = locator<WeatherService>();

  String _city;

  ChooseLocationViewModel();

  String get city => _city;

  Future<Weather> getWeatherFromCity(String city) async {
    setState(ViewState.Busy);

    var success = await _weatherService.getWeatherFromCity(city);

    setState(ViewState.Idle);

    return success;
  }

  Future<Weather> getWeatherFromCurrentLocation() async {
    setState(ViewState.Busy);

    var location = await LocationService().getLocation();
    var success = await _weatherService.getWeatherFromLocation(location);

    setState(ViewState.Idle);

    return success;
  }

  void refreshWeather(String newCity, BuildContext context) {
    Provider.of<WeatherViewModel>(context, listen: false)
        .getLatestWeather(_city);

    notifyListeners();
  }

  void updateCity(String newCity) {
    _city = newCity;
  }
}
