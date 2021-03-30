import 'package:weather/core/enums/weather_condition.dart';

/// Stores data about weather that is used in weather views.
class Weather {
  final WeatherCondition condition;
  final String description;
  final String locationName;
  final double temp;
  final double feelLikeTemp;
  final double humidity;
  final double pressure;
  final int cloudiness;
  final DateTime date;
  final bool isDay;

  Weather(
      {this.condition,
      this.description,
      this.locationName,
      this.temp,
      this.feelLikeTemp,
      this.humidity,
      this.pressure,
      this.cloudiness,
      this.date,
      this.isDay});

  static Weather fromDailyJson(dynamic daily) {
    int cloudiness = daily['clouds']['all'].toInt();
    var weather = daily['weather'][0];

    // To find out if it is day or night app uses current date, 
    // sunrise, sunset in current location.
    var date =
        DateTime.fromMillisecondsSinceEpoch(daily['dt'] * 1000, isUtc: true);

    var sunrise = DateTime.fromMillisecondsSinceEpoch(
        daily['sys']['sunrise'] * 1000,
        isUtc: true);

    var sunset = DateTime.fromMillisecondsSinceEpoch(
        daily['sys']['sunset'] * 1000,
        isUtc: true);

    return Weather(
        condition: mapStringToWeatherCondition(weather['main'], cloudiness),
        description: weather['description'],
        locationName: daily['name'],
        cloudiness: cloudiness,
        temp: daily['main']['temp'].toDouble(),
        feelLikeTemp: daily['main']['feels_like'].toDouble(),
        humidity: daily['main']['humidity'].toDouble(),
        pressure: daily['main']['pressure'].toDouble(),
        date: DateTime.fromMillisecondsSinceEpoch(daily['dt'] * 1000,
            isUtc: true),
        isDay: date.isAfter(sunrise) && date.isBefore(sunset));
  }

  static WeatherCondition mapStringToWeatherCondition(String input, int cloudiness) {
    WeatherCondition condition;
    switch (input) {
      case 'Thunderstorm':
        condition = WeatherCondition.thunderstorm;
        break;
      case 'Drizzle':
        condition = WeatherCondition.drizzle;
        break;
      case 'Rain':
        condition = WeatherCondition.rain;
        break;
      case 'Snow':
        condition = WeatherCondition.snow;
        break;
      case 'Clear':
        condition = WeatherCondition.clear;
        break;
      case 'Clouds':
        condition = (cloudiness >= 85)
            ? WeatherCondition.heavyCloud
            : WeatherCondition.lightCloud;
        break;
      case 'Mist':
        condition = WeatherCondition.mist;
        break;
      case 'fog':
        condition = WeatherCondition.fog;
        break;
      case 'Smoke':
      case 'Haze':
      case 'Dust':
      case 'Sand':
      case 'Ash':
      case 'Squall':
      case 'Tornado':
        condition = WeatherCondition.atmosphere;
        break;
      default:
        condition = WeatherCondition.unknown;
    }

    return condition;
  }
}
