import 'package:get_it/get_it.dart';
import 'package:weather/core/api/open_weather_map_api.dart';
import 'package:weather/core/viewmodels/weather_view_model.dart';
import 'core/viewmodels/choose_location_view_model.dart';
import 'core/services/weather_service.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => WeatherService(OpenWeatherMapApi()));

  locator.registerLazySingleton(() => ChooseLocationViewModel());

  locator.registerFactory(() => WeatherViewModel());
}
