import 'package:attendance_app/app/master_location/models/master_location.dart';
import 'package:attendance_app/app/user_attendance/data/attendance_source_local.dart';
import 'package:attendance_app/app/user_attendance/models/attendance_model.dart';
import 'package:attendance_app/app/user_attendance/provider/user_attendance_provider.dart';
import 'package:attendance_app/app/user_attendance/screens/attendance_screen.dart';
import 'package:attendance_app/app/user_attendance/state/user_attendance_state.dart';
import 'package:attendance_app/shared/constant/local_storage_key.dart';
import 'package:attendance_app/shared/providers/location_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mockito/mockito.dart';

import '../../../helpers/widget_wrap_material.dart';
import '../../master_location/providers/master_location_provider_test.dart';
import '../../master_location/providers/master_location_provider_test.mocks.dart';
import '../../master_location/providers/mock_geocoding_platform.mock.dart';
import '../provider/user_attendance_provider_test.mocks.dart';

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
    MasterLocationModel masterLocationModel = MasterLocationModel(
      lat: mockPosition.latitude,
      long: mockPosition.longitude,
      name: "test-address",
    );
    localStorage.write(LocalStorageKey.masterLocation, masterLocationModel.toJson());

    locationNotifier = MockLocationNotifier();
    sourceLocal = MockAttendanceSourceLocal();

    GeocodingPlatform.instance = MockGeocodingPlatform();
  });
  testWidgets('Init Button is CheckIn when user attendance not yet', (tester) async {
    final testerWidget = ProviderScope(
      overrides: [
        userAttendanceProvider.overrideWithProvider(
          StateNotifierProvider.autoDispose<UserAttendanceNotifier, UserAttendanceState>((ref) {
            return UserAttendanceNotifier(localStorage, sourceLocal, locationNotifier);
          }),
        ),
      ],
      child: const AttendanceScreen(),
    );
    // Start Pump
    await tester.pumpWidget(startWidget(testerWidget));
    await tester.pump();
    expect(find.text("Check In"), findsOneWidget);
  });

  testWidgets('Button text is changed to CheckOut after user tap check in', (tester) async {
    when(locationNotifier.getContinuousLocation()).thenAnswer((_) async => mockPosition);
    var attendanceModel = AttendanceModel(
      checkInLat: mockPosition.latitude,
      checkInLong: mockPosition.longitude,
      checkInAt: DateTime.now(),
    );
    // when(sourceLocal.whereDate(any)).thenAnswer((_) async => attendanceModel);

    final testerWidget = ProviderScope(
      overrides: [
        userAttendanceProvider.overrideWithProvider(
          StateNotifierProvider.autoDispose<UserAttendanceNotifier, UserAttendanceState>((ref) {
            return UserAttendanceNotifier(localStorage, sourceLocal, locationNotifier);
          }),
        ),
      ],
      child: const AttendanceScreen(),
    );
    // Start Pump
    await tester.pumpWidget(startWidget(testerWidget));
    await tester.pump();
    await tester.ensureVisible(find.text("Check In"));
    await tester.tap(find.text("Check In"));
    await tester.pump();
    expect(find.text("Check Out"), findsOneWidget);
  });

  testWidgets('Button text is changed to Selesai after user tap check out', (tester) async {
    when(locationNotifier.getContinuousLocation()).thenAnswer((_) async => mockPosition);
    var attendanceModel = AttendanceModel(
      checkInLat: mockPosition.latitude,
      checkInLong: mockPosition.longitude,
      checkInAt: DateTime.now(),
    );
    when(sourceLocal.whereDate(any)).thenAnswer((_) async => attendanceModel);

    final testerWidget = ProviderScope(
      overrides: [
        userAttendanceProvider.overrideWithProvider(
          StateNotifierProvider.autoDispose<UserAttendanceNotifier, UserAttendanceState>((ref) {
            return UserAttendanceNotifier(localStorage, sourceLocal, locationNotifier);
          }),
        ),
      ],
      child: const AttendanceScreen(),
    );
    // Start Pump
    await tester.pumpWidget(startWidget(testerWidget));
    await tester.pump();
    await tester.ensureVisible(find.text("Check Out"));
    await tester.tap(find.text("Check Out"));
    await tester.pump();
    expect(find.text("Selesai"), findsOneWidget);
  });
}
