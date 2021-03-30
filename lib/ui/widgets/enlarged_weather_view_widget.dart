import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:weather/core/viewmodels/weather_view_model.dart';
import 'package:weather/ui/shared/app_colors.dart';

import 'helper_weather_view_functions.dart';
import 'large_details_box.dart';
import 'weather_image.dart';

class EnlargedWeatherViewWidget extends StatefulWidget {
  final WeatherViewModel _viewModel;

  EnlargedWeatherViewWidget(this._viewModel);

  @override
  _EnlargedWeatherViewWidgetState createState() =>
      _EnlargedWeatherViewWidgetState(_viewModel);
}

class _EnlargedWeatherViewWidgetState extends State<EnlargedWeatherViewWidget> {
  WeatherViewModel _viewModel;

  _EnlargedWeatherViewWidgetState(this._viewModel);

  int _currentIndex = 0;

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    List cardList = [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
        child: LargeDetailsBox(
            "FEELS LIKE",
            largeDescriptionContent(
                "${_viewModel.feelsLike.round()}°C", darkModePrimaryColor),
            170,
            true),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
        child: LargeDetailsBox(
            "HUMIDITY",
            largeDescriptionContent(
                "${_viewModel.humidity.round()}%", darkModePrimaryColor),
            170,
            true),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
        child: LargeDetailsBox(
            "PRESSURE",
            largeDescriptionContent(
                "${_viewModel.pressure.round()}", darkModePrimaryColor),
            170,
            true),
      ),
    ];

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 0.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                  child: Row(
                    children: [
                      cityLabel(_viewModel.city, darkModePrimaryColor),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                        padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
                        margin: EdgeInsets.all(6.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white),
                        child: getWeatherImage(
                            _viewModel.condition, _viewModel.isDaytime, 120))
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      LargeDetailsBox(
                          "Temperature",
                          largeDescriptionContent(
                              "${_viewModel.temp.round()}°C",
                              darkModePrimaryColor),
                          170,
                          true)
                    ],
                  ),
                ),
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    CarouselSlider(
                      options: CarouselOptions(
                        height: 200.0,
                        viewportFraction: 1,
                        autoPlay: true,
                        autoPlayInterval: Duration(seconds: 6),
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        pauseAutoPlayOnTouch: true,
                        aspectRatio: 2.0,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _currentIndex = index;
                          });
                        },
                      ),
                      items: cardList.map((card) {
                        return Builder(builder: (BuildContext context) {
                          return card;
                        });
                      }).toList(),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: map<Widget>(cardList, (index, url) {
                        return Container(
                          width: 10.0,
                          height: 10.0,
                          margin: EdgeInsets.fromLTRB(2.0, 0, 2.0, 15.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _currentIndex == index
                                ? darkModePrimaryColor
                                : Color(0xffcccccc),
                          ),
                        );
                      }),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
