import 'package:attendance_app/app/master_location/models/master_location.dart';
import 'package:attendance_app/app/user_attendance/data/attendance_source_local.dart';
import 'package:attendance_app/app/user_attendance/models/attendance_model.dart';
import 'package:attendance_app/app/user_attendance/provider/user_attendance_provider.dart';
import 'package:attendance_app/app/user_attendance/state/user_attendance_state.dart';
import 'package:attendance_app/shared/constant/local_storage_key.dart';
import 'package:attendance_app/shared/providers/local_storage_provider.dart';
import 'package:attendance_app/shared/providers/location_provider.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../master_location/providers/master_location_provider_test.mocks.dart';
import '../../master_location/providers/mock_geocoding_platform.mock.dart';
import 'user_attendance_provider_test.mocks.dart';

Position mockPosition = Position(
    latitude: 52.561270,
    longitude: 5.639382,
    timestamp: DateTime.fromMillisecondsSinceEpoch(
      500,
      isUtc: true,
    ),
    altitude: 3000.0,
    accuracy: 0.0,
    heading: 0.0,
    speed: 0.0,
    speedAccuracy: 0.0);
Position secondMockPosition = Position(
    latitude: 52.561270,
    longitude: 7.639382,
    timestamp: DateTime.fromMillisecondsSinceEpoch(
      500,
      isUtc: true,
    ),
    altitude: 3000.0,
    accuracy: 0.0,
    heading: 0.0,
    speed: 0.0,
    speedAccuracy: 0.0);

@GenerateNiceMocks([MockSpec<AttendanceSourceLocal>()])
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late ProviderContainer container;
  late LocationNotifier locationNotifier;
  late GetStorage localStorage;
  late AttendanceSourceLocal sourceLocal;

  const channel = MethodChannel('plugins.flutter.io/path_provider_macos');
  void setUpMockChannels(MethodChannel channel) {
    TestDefaultBinaryMessengerBinding.instance?.defaultBinaryMessenger.setMockMethodCallHandler(
      channel,
      (MethodCall? methodCall) async {
        if (methodCall?.method == 'getApplicationDocumentsDirectory') {
          return '.';
        }
      },
    );
  }

  setUpAll(() async {
    setUpMockChannels(channel);
  });

  setUp(() async {
    await GetStorage.init();
    localStorage = GetStorage();
    await localStorage.erase();
    MasterLocationModel masterLocationModel = MasterLocationModel(lat: 52.561270, long: 5.639382, name: "test-address");
    localStorage.write(LocalStorageKey.masterLocation, masterLocationModel.toJson());

    locationNotifier = MockLocationNotifier();
    sourceLocal = MockAttendanceSourceLocal();

    GeocodingPlatform.instance = MockGeocodingPlatform();
  });

  test("Init state is model empty when find data on DB is null", () async {
    when(sourceLocal.whereDate(DateTime.now())).thenAnswer((_) async => null);
    container = ProviderContainer(overrides: [
      userAttendanceProvider.overrideWithProvider(
        StateNotifierProvider.autoDispose<UserAttendanceNotifier, UserAttendanceState>((ref) {
          return UserAttendanceNotifier(localStorage, sourceLocal, locationNotifier);
        }),
      ),
    ]);

    var listen = container.listen(userAttendanceProvider, (previous, next) => next);
    expect(listen.read(), UserAttendanceState.inital());
    var loaded;
    await Future.delayed(const Duration(seconds: 3), () {
      loaded = listen.read();
    });
    loaded as AttendanceLoaded;
    expect(loaded.model.checkInLat, isNull);
    expect(loaded.model.checkInLong, isNull);
    expect(loaded.model.checkOutLat, isNull);
    expect(loaded.model.checkOutLong, isNull);
  });
  test("Init state is model get datafrom DB", () async {
    var attendanceModel = AttendanceModel(
      checkInAt: DateTime.now(),
      checkOutAt: DateTime.now(),
    );
    when(sourceLocal.whereDate(any)).thenAnswer((_) async => attendanceModel);
    container = ProviderContainer(overrides: [
      userAttendanceProvider.overrideWithProvider(
        StateNotifierProvider.autoDispose<UserAttendanceNotifier, UserAttendanceState>((ref) {
          return UserAttendanceNotifier(localStorage, sourceLocal, locationNotifier);
        }),
      ),
    ]);

    var listen = container.listen(userAttendanceProvider, (previous, next) => next);
    expect(listen.read(), UserAttendanceState.inital());
    var loaded;
    await Future.delayed(const Duration(seconds: 3), () {
      loaded = listen.read();
    });
    loaded as AttendanceLoaded;
    expect(loaded.model.checkInAt, isA<DateTime?>());
    expect(loaded.model.checkOutAt, isA<DateTime?>());
    expect(loaded.model.checkInAt, attendanceModel.checkInAt);
    expect(loaded.model.checkOutAt, attendanceModel.checkOutAt);
  });

  test("Change date state is model empty when find data on DB is null", () async {
    var newDate = DateTime.now();
    when(sourceLocal.whereDate(newDate)).thenAnswer((_) async => null);
    container = ProviderContainer(overrides: [
      userAttendanceProvider.overrideWithProvider(
        StateNotifierProvider.autoDispose<UserAttendanceNotifier, UserAttendanceState>((ref) {
          return UserAttendanceNotifier(localStorage, sourceLocal, locationNotifier);
        }),
      ),
    ]);

    var state = container.read(userAttendanceProvider);
    expect(state, UserAttendanceState.inital());
    await Future.delayed(const Duration(seconds: 5));
    await container.read(userAttendanceProvider.notifier).changeDate(newDate);
    var loaded = container.read(userAttendanceProvider);
    loaded as AttendanceLoaded;
    expect(loaded.model.checkInLat, isNull);
    expect(loaded.model.checkInLong, isNull);
    expect(loaded.model.checkOutLat, isNull);
    expect(loaded.model.checkOutLong, isNull);
  });

  test("Change date state is model get datafrom DB", () async {
    var attendanceModel = AttendanceModel(
      checkInAt: DateTime.now(),
      checkOutAt: DateTime.now(),
    );
    when(sourceLocal.whereDate(any)).thenAnswer((_) async => attendanceModel);
    container = ProviderContainer(overrides: [
      userAttendanceProvider.overrideWithProvider(
        StateNotifierProvider.autoDispose<UserAttendanceNotifier, UserAttendanceState>((ref) {
          return UserAttendanceNotifier(localStorage, sourceLocal, locationNotifier);
        }),
      ),
    ]);

    var state = container.read(userAttendanceProvider);
    expect(state, UserAttendanceState.inital());
    await container.read(userAttendanceProvider.notifier).changeDate(attendanceModel.checkInAt!);
    var loaded = container.read(userAttendanceProvider);
    loaded as AttendanceLoaded;
    expect(loaded.model.checkInAt, isA<DateTime?>());
    expect(loaded.model.checkOutAt, isA<DateTime?>());
    expect(loaded.model.checkInAt, attendanceModel.checkInAt);
    expect(loaded.model.checkOutAt, attendanceModel.checkOutAt);
  });

  test("Check in failed when distance position from master location > 50 meters", () async {
    when(locationNotifier.getContinuousLocation()).thenAnswer((_) async => secondMockPosition);
    container = ProviderContainer(overrides: [
      userAttendanceProvider.overrideWithProvider(
        StateNotifierProvider.autoDispose<UserAttendanceNotifier, UserAttendanceState>((ref) {
          return UserAttendanceNotifier(localStorage, sourceLocal, locationNotifier);
        }),
      ),
    ]);
    var state = container.listen(userAttendanceProvider, (previous, next) => next);
    await container.read(userAttendanceProvider.notifier).checkIn();
    expect(state.read(), isA<AttendanceFailed>());
    state is AttendanceFailed;
  });
  test("Check in success when distance position from master location < 50 meters", () async {
    when(locationNotifier.getContinuousLocation()).thenAnswer((_) async => mockPosition);
    var attendanceModel = AttendanceModel(
      checkInLat: mockPosition.latitude,
      checkInLong: mockPosition.longitude,
    );
    when(sourceLocal.whereDate(any)).thenAnswer((_) async => attendanceModel);

    container = ProviderContainer(overrides: [
      userAttendanceProvider.overrideWithProvider(
        StateNotifierProvider.autoDispose<UserAttendanceNotifier, UserAttendanceState>((ref) {
          return UserAttendanceNotifier(localStorage, sourceLocal, locationNotifier);
        }),
      ),
    ]);
    var state = container.listen(userAttendanceProvider, (previous, next) => next);
    await container.read(userAttendanceProvider.notifier).checkIn();
    expect(state.read(), isA<AttendanceLoaded>());
    var result = state.read() as AttendanceLoaded;
    expect(result.model.checkInLat, mockPosition.latitude);
  });
  test("Check out failed when distance position from master location > 50 meters", () async {
    when(locationNotifier.getContinuousLocation()).thenAnswer((_) async => secondMockPosition);
    container = ProviderContainer(overrides: [
      userAttendanceProvider.overrideWithProvider(
        StateNotifierProvider.autoDispose<UserAttendanceNotifier, UserAttendanceState>((ref) {
          return UserAttendanceNotifier(localStorage, sourceLocal, locationNotifier);
        }),
      ),
    ]);
    var state = container.listen(userAttendanceProvider, (previous, next) => next);
    await container.read(userAttendanceProvider.notifier).checkOut();
    expect(state.read(), isA<AttendanceFailed>());
    state is AttendanceFailed;
  });
  test("Check out success when distance position from master location < 50 meters", () async {
    when(locationNotifier.getContinuousLocation()).thenAnswer((_) async => mockPosition);

    container = ProviderContainer(overrides: [
      userAttendanceProvider.overrideWithProvider(
        StateNotifierProvider.autoDispose<UserAttendanceNotifier, UserAttendanceState>((ref) {
          return UserAttendanceNotifier(localStorage, sourceLocal, locationNotifier);
        }),
      ),
    ]);
    var state = container.listen(userAttendanceProvider, (previous, next) => next);
    await container.read(userAttendanceProvider.notifier).checkOut();
    expect(state.read(), isA<AttendanceLoaded>());
    var result = state.read() as AttendanceLoaded;
    expect(result.model.checkOutLat, mockPosition.latitude);
  });
}
