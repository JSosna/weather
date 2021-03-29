import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather/core/enums/viewstate.dart';
import 'package:weather/core/utils/toast_utils.dart';
import 'package:weather/core/viewmodels/choose_location_view_model.dart';

import 'base_view.dart';

class ChooseLocationView extends StatefulWidget {
  @override
  _ChooseLocationViewState createState() => _ChooseLocationViewState();
}

class _ChooseLocationViewState extends State<ChooseLocationView> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseView<ChooseLocationViewModel>(
      builder: (context, vm, child) => Scaffold(
        appBar: AppBar(
          title: Text(
            "Weather",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
        ),
        body: Container(
          color: Color(0xff6CCAFF),
          child: Column(
            children: [
              if (vm.state == ViewState.Busy) LinearProgressIndicator(),

              vm.state == ViewState.Busy
                  ? SizedBox(height: 46)
                  : SizedBox(height: 50),
              Text(
                "TYPE IN YOUR CITY",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: TextField(
                        controller: controller,
                        decoration: InputDecoration(
                            hintText: 'City',
                            border:
                                OutlineInputBorder(borderSide: BorderSide.none),
                            fillColor: Colors.white,
                            filled: true),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    ConstrainedBox(
                      constraints:
                          BoxConstraints.tightFor(width: 60, height: 60),
                      child: ElevatedButton(
                        onPressed: () async {
                          var weather =
                              await vm.getWeatherFromCity(controller.text);
                          if (weather != null) {
                            Navigator.pushNamed(context, 'weather',
                                arguments: weather);
                          } else {
                            controller.clear();
                            ToastUtils.showCustomToast(context, "Location not found!");
                          }
                        },
                        child: Icon(Icons.navigation, size: 28),
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Color(0xff6CB0FF))),
                      ),
                    ),
                  ],
                ),
              ),
              // Second option
              SizedBox(
                height: 50,
              ),
              Text(
                "CURRENT LOCATION",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ConstrainedBox(
                constraints: BoxConstraints.tightFor(width: 80, height: 80),
                child: ElevatedButton(
                  onPressed: () async {
                    var weather = await vm.getWeatherFromCurrentLocation();

                    if (weather != null) {
                      Navigator.pushNamed(context, 'weather',
                                arguments: weather);
                    }
                  },
                  child: Icon(
                    Icons.location_pin,
                    size: 48,
                    color: Color(0xff6CCAFF),
                  ),
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18))),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Color(0xffffffff))),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
