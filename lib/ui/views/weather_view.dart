import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather/core/models/weather.dart';
import 'package:weather/core/viewmodels/weather_view_model.dart';
import 'package:weather/ui/shared/app_colors.dart';
import 'package:weather/ui/widgets/default_weather_view_widget.dart';
import 'package:weather/ui/widgets/enlarged_weather_view_widget.dart';

import 'base_view.dart';

class WeatherView extends StatefulWidget {
  final Weather _weather;

  WeatherView(this._weather);

  @override
  _WeatherViewState createState() => _WeatherViewState(_weather);
}

class _WeatherViewState extends State<WeatherView> {
  bool _largerView = false;

  Weather _weather;
  
  _WeatherViewState(this._weather);

  @override
  Widget build(BuildContext context) {
    return BaseView<WeatherViewModel>(
      onModelReady: (vm) => {vm.updateModel(_weather)},
      builder: (context, vm, child) => Scaffold(
          backgroundColor: primaryColor,
          appBar: AppBar(
            actions: [
              IconButton(
                color: Colors.black,
                icon: Icon(Icons.remove_red_eye),
                onPressed: () {
                  setState(() {
                    _largerView = !_largerView;
                  });
                },
              )
            ],
            leading: BackButton(
              color: Colors.black,
              onPressed: () {
                Navigator.maybePop(context);
              },
            ),
            title: Text(
              "Weather",
              style: TextStyle(color: Colors.black),
            ),
            backgroundColor: Colors.white,
          ),
          body: _largerView
              ? EnlargedWeatherViewWidget(vm)
              : DefaultWeatherViewWidget(vm)),
    );
  }
}
