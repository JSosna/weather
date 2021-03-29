import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:weather/core/viewmodels/weather_view_model.dart';

import 'helper_weather_view_functions.dart';
import 'large_details_box.dart';
import 'small_details_box.dart';
import 'weather_image.dart';

class DefaultWeatherViewWidget extends StatelessWidget {
  final WeatherViewModel _viewModel;

  DefaultWeatherViewWidget(this._viewModel);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Row(
                  children: [
                    cityLabel(_viewModel.city),
                  ],
                ),
                SizedBox(
                  height: 2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    LargeDetailsBox(
                        "Temperature",
                        largeDescriptionContent("${_viewModel.temp.round()}°C"),
                        170)
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SmallDetailsBox(
                        "Feels Like",
                        smallDescriptionContent(
                            "${_viewModel.feelsLike.round()}°C"),
                        114),
                    SmallDetailsBox(
                        null,
                        Center(
                            child: Container(
                                child: getWeatherImage(_viewModel.condition,
                                    _viewModel.isDaytime, 100))),
                        114)
                  ],
                ),
                Row(
                  children: [
                    weatherDescription(_viewModel.description),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SmallDetailsBox(
                        "Humidity",
                        smallDescriptionContent(
                            "${_viewModel.humidity.round()}%"),
                        114),
                    SmallDetailsBox(
                        "Pressure",
                        smallDescriptionContent(
                            "${_viewModel.pressure.round()}"),
                        114)
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
