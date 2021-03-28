enum WeatherCondition {
  thunderstorm,
  drizzle,
  rain,
  snow,
  atmosphere, // dust, ash, fog, sand etc.
  mist,
  fog,
  lightCloud,
  heavyCloud,
  clear,
  unknown
}

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

  Weather(
      {this.condition,
      this.description,
      this.locationName,
      this.temp,
      this.feelLikeTemp,
      this.humidity,
      this.pressure,
      this.cloudiness,
      this.date});

  static Weather fromDailyJson(dynamic daily) {
    var cloudiness = daily['clouds']['all'];
    var weather = daily['weather'][0];

    return Weather(
        condition: mapStringToWeatherCondition(weather['main']),
        description: weather['description'],
        locationName: daily['name'],
        cloudiness: cloudiness,
        temp: daily['main']['temp'].toDouble(),
        feelLikeTemp: daily['main']['feels_like'].toDouble(),
        humidity: daily['main']['humidity'].toDouble(),
        pressure: daily['main']['pressure'].toDouble(),
        date: DateTime.fromMillisecondsSinceEpoch(daily['dt'] * 1000,
            isUtc: true));
  }

  static WeatherCondition mapStringToWeatherCondition(String input) {
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
        condition = WeatherCondition.lightCloud;
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
