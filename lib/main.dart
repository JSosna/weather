import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/locator.dart';
import 'package:weather/ui/views/choose_location_view.dart';
import 'core/viewmodels/choose_location_view_model.dart';
import 'core/viewmodels/weather_view_model.dart';
import 'ui/router.dart' as Rt;
// import 'package:location/location.dart';

void main() {
  setupLocator();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<ChooseLocationViewModel>(
        create: (_) => ChooseLocationViewModel(),
      ),
      ChangeNotifierProvider<WeatherViewModel>(
        create: (_) => WeatherViewModel(),
      )
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChooseLocationView(),
      onGenerateRoute: Rt.Router.generateRoute,
    );
  }
}
