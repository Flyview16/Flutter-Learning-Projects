import 'package:geolocator/geolocator.dart';

class Location {
  late double longitude, latitude;

  Future getcurrentLocation() async {
    await Geolocator.requestPermission();
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      latitude = position.latitude;
      longitude = position.longitude;
    } catch (exception) {
      //Catch exception
    }
  }
}
