import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:weather/core/viewmodels/weather_view_model.dart';

import 'helper_weather_view_functions.dart';
import 'large_details_box.dart';
import 'small_details_box.dart';

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
            SizedBox(
              height: 10,
            ),
            Column(
              children: [
                Row(
                  children: [
                    cityLabel(_viewModel.city),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    LargeDetailsBox(
                        "Temperature", largeDescriptionContent("${_viewModel.temp.round()}°C"), 170)
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SmallDetailsBox(
                        "Feels Like", smallDescriptionContent("${_viewModel.feelsLike.round()}°C"), 114),
                    SmallDetailsBox("Lol", Container(), 114)
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
                        "Humidity", smallDescriptionContent("${_viewModel.humidity.round()}%"), 114),
                    SmallDetailsBox(
                        "Pressure", smallDescriptionContent("${_viewModel.pressure.round()}"), 114)
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
