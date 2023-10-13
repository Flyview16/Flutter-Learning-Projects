import 'package:geolocator/geolocator.dart';

class Location{
  late double longitude, latitude;

  Future getcurrentLocation() async{
    LocationPermission permission;
    permission = await Geolocator.requestPermission();
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      latitude = position.latitude;
      longitude = position.longitude;
    }
    catch (exception) {
      print(exception);
    }
  }
}