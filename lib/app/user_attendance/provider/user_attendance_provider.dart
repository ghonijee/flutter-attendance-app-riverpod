import 'dart:convert';

import 'package:attendance_app/app/master_location/models/master_location.dart';
import 'package:attendance_app/app/user_attendance/data/attendance_source_local.dart';
import 'package:attendance_app/app/user_attendance/models/attendance_model.dart';
import 'package:attendance_app/app/user_attendance/state/user_attendance_state.dart';
import 'package:attendance_app/shared/providers/local_storage_provider.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../shared/constant/local_storage_key.dart';
import '../../../shared/providers/location_provider.dart';

final userAttendanceProvider = StateNotifierProvider.autoDispose<UserAttendanceNotifier, UserAttendanceState>((ref) {
  return UserAttendanceNotifier(ref.read(localStorageProvider), AttendanceSourceLocal(), ref.read(locationServiceProvider));
});

class UserAttendanceNotifier extends StateNotifier<UserAttendanceState> {
  GetStorage storage;
  AttendanceSourceLocal sourceLocal;
  LocationNotifier locationNotifier;
  UserAttendanceNotifier(this.storage, this.sourceLocal, this.locationNotifier) : super(UserAttendanceState.inital()) {
    init();
  }

  /// Initial state, check Attendacne by Current Data
  init() async {
    await sourceLocal.init();
    DateTime value = DateTime.now();
    state = UserAttendanceState.loading();
    var data = await sourceLocal.whereDate(value) ?? AttendanceModel();

    state = UserAttendanceState.loaded(data);
  }

  /// Change day active and check on attendance by params
  changeDate(DateTime value) async {
    state = UserAttendanceState.loading();
    var data = await sourceLocal.whereDate(value) ?? AttendanceModel();
    print(data.toJson());
    state = UserAttendanceState.loaded(data);
  }

  // Check status attendance by specific date
  Future<bool> checkAttendanceStatus(DateTime value) async {
    var data = await sourceLocal.whereDate(value);
    return data != null;
  }

  /// Store data to check In
  checkIn() async {
    try {
      state = UserAttendanceState.loading();
      DateTime checkInAt = DateTime.now();
      var masterLocationModel = getMasterLocation();

      Position currentPosition = await locationNotifier.getContinuousLocation();
      String locationAt = await getMarkLocation(currentPosition);

      var distanceInMeters = Geolocator.distanceBetween(currentPosition.latitude, currentPosition.longitude, masterLocationModel.lat!, masterLocationModel.long!);
      if (distanceInMeters > 50) {
        state = UserAttendanceState.failed("Lokasi anda masih diluar area, silakan datang ke ${masterLocationModel.name}");
        return;
      }

      var model = AttendanceModel(
        checkInAt: checkInAt,
        checkInLat: currentPosition.latitude,
        checkInLong: currentPosition.longitude,
        checkInLocaationName: locationAt,
      );

      await sourceLocal.create(model);
      var data = await sourceLocal.whereDate(checkInAt) ?? AttendanceModel();

      state = UserAttendanceState.loaded(data);
    } catch (e) {
      state = UserAttendanceState.failed(e.toString());
      state = UserAttendanceState.loaded(AttendanceModel());
    }
  }

  /// Store data to check In
  checkOut() async {
    try {
      state = UserAttendanceState.loading();
      DateTime checkOutAt = DateTime.now();
      var masterLocationModel = getMasterLocation();
      var data = await sourceLocal.whereDate(checkOutAt) ?? AttendanceModel();

      Position currentPosition = await locationNotifier.getContinuousLocation();
      String locationAt = await getMarkLocation(currentPosition);

      var distanceInMeters = Geolocator.distanceBetween(currentPosition.latitude, currentPosition.longitude, masterLocationModel.lat!, masterLocationModel.long!);
      if (distanceInMeters > 50) {
        state = UserAttendanceState.failed("Lokasi anda masih diluar area, silakan datang ke ${masterLocationModel.name}");
        return;
      }
      data as AttendanceModel;
      var model = data.copyWith(
        checkOutAt: checkOutAt,
        checkOutLat: currentPosition.latitude,
        checkOutLong: currentPosition.longitude,
        checkOutLocaationName: locationAt,
      );

      await sourceLocal.update(model);

      state = UserAttendanceState.loaded(model);
    } catch (e) {
      state = UserAttendanceState.failed(e.toString());
      state = UserAttendanceState.loaded(AttendanceModel());
    }
  }

  MasterLocationModel getMasterLocation() {
    Map<String, dynamic> masterPositionJson = jsonDecode(storage.read(LocalStorageKey.masterLocation));
    MasterLocationModel masterLocationModel = MasterLocationModel.fromMap(masterPositionJson);
    return masterLocationModel;
  }

  /// Convert Position latLong to Name Location
  /// Street Nama Desa, Kecamatan Kabupaten
  Future<String> getMarkLocation(Position position) async {
    var place = await placemarkFromCoordinates(position.latitude, position.longitude, localeIdentifier: "id_ID");
    Placemark mark = place.first;
    var locationName = "${mark.street} ${mark.subLocality}, ${mark.locality} ${mark.subAdministrativeArea}";
    return locationName;
  }
}
