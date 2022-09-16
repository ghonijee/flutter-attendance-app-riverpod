import 'package:attendance_app/app/master_location/state/master_location_state.dart';
import 'package:attendance_app/shared/constant/local_storage_key.dart';
import 'package:attendance_app/shared/providers/local_storage_provider.dart';
import 'package:attendance_app/shared/providers/location_provider.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:latlong2/latlong.dart';

import '../models/master_location.dart';

final masterLocationProvider = StateNotifierProvider.autoDispose<MasterLocationNotifier, MasterLocationState>((ref) {
  return MasterLocationNotifier(ref.read);
});

class MasterLocationNotifier extends StateNotifier<MasterLocationState> {
  final Reader reader;
  MasterLocationNotifier(this.reader) : super(MasterLocationState.inital()) {
    init();
  }

  init() async {
    state = MasterLocationState.loading();
    Position position = await reader(locationServiceProvider).getContinuousLocation();
    var place = await placemarkFromCoordinates(position.latitude, position.longitude, localeIdentifier: "id_ID");
    Placemark mark = place.first;
    MasterLocationModel model = MasterLocationModel(
      lat: position.latitude,
      long: position.longitude,
      name: "${mark.street} ${mark.subLocality}, ${mark.locality} ${mark.subAdministrativeArea}",
    );

    state = MasterLocationState.loaded(model);
  }

  /// Change position by LatLang
  changePosition(LatLng latLng) async {
    state = MasterLocationState.loading();
    var place = await placemarkFromCoordinates(latLng.latitude, latLng.longitude, localeIdentifier: "id_ID");
    Placemark mark = place.first;
    MasterLocationModel model = MasterLocationModel(
      lat: latLng.latitude,
      long: latLng.longitude,
      name: "${mark.street} ${mark.subLocality}, ${mark.locality} ${mark.subAdministrativeArea}",
    );
    state = MasterLocationState.loaded(model);
  }

  /// Save master location to localStorage
  saveLocation() {
    final storage = reader(localStorageProvider);
    var currentState = state as MasterLocationLoaded;
    storage.write(LocalStorageKey.masterLocation, currentState.model.toJson());
    state = MasterLocationState.succcess("Berhasil menyimpan master lokasi");
  }
}
