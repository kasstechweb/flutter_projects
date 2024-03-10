import 'package:geolocator/geolocator.dart';

class Location {
  double? latitude;
  double? longitude;

  Future<void> checkPermission() async {
    LocationPermission checkPermission = await Geolocator.checkPermission();
    // print(checkPermission);
    if (checkPermission == LocationPermission.denied ||
        checkPermission == LocationPermission.deniedForever) {
      // print('denied');
      await Geolocator.requestPermission();
    }
  }

  Future<void> getCurrentLocation() async {
    try {
      await checkPermission();
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);

      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      print(e);
    }
  }
}
