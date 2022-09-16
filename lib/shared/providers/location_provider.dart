import 'package:geolocator/geolocator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final locationServiceProvider = Provider((ref) => LocationNotifier());

class LocationNotifier {
  Future<dynamic> getContinuousLocation() async {
    try {
      if (await checkPermission()) {
        final position = await Geolocator.getCurrentPosition();
        return position;
      }
    } on Exception catch (e, st) {
      return e;
    }
  }

  Future<bool> checkPermission() async {
    bool _serviceEnabled;
    LocationPermission _permission;

    try {
      _serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!_serviceEnabled) {
        Geolocator.openLocationSettings();
      }
      _permission = await Geolocator.checkPermission();
      if (_permission == LocationPermission.denied || _permission == LocationPermission.deniedForever) {
        _permission = await Geolocator.requestPermission();
      }
      return true;
    } on Exception catch (e) {
      rethrow;
    }
  }
}
