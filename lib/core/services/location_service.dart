import 'package:location/location.dart' as LocationPackage;
import 'package:weather/core/models/location.dart';

class LocationService {
  Future<Location> getLocation() async {
    var location = new LocationPackage.Location();

    bool _serviceEnabled;
    LocationPackage.PermissionStatus _permissionGranted;
    LocationPackage.LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return null;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == LocationPackage.PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != LocationPackage.PermissionStatus.granted) {
        return null;
      }
    }

    _locationData = await location.getLocation();

    return Location(
        latitude: _locationData.latitude, longitude: _locationData.longitude);
  }
}
