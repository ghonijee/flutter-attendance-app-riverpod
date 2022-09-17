import 'dart:io';
import 'dart:math';

import 'package:attendance_app/app/master_location/providers/master_location_provider.dart';
import 'package:attendance_app/app/master_location/screens/setting_master_location_screen.dart';
import 'package:attendance_app/app/master_location/state/master_location_state.dart';
import 'package:attendance_app/shared/providers/local_storage_provider.dart';
import 'package:attendance_app/shared/providers/location_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mockito/mockito.dart';

import '../../../helpers/widget_wrap_material.dart';
import '../providers/master_location_provider_test.mocks.dart';
import '../providers/mock_geocoding_platform.mock.dart';
import 'flatten_maps_view.mocks.dart';

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

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late ProviderContainer container;
  late LocationNotifier locationNotifier;
  late GetStorage localStorage;

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

    locationNotifier = MockLocationNotifier();
    GeocodingPlatform.instance = MockGeocodingPlatform();
    when(locationNotifier.getContinuousLocation()).thenAnswer((_) async => mockPosition);
  });

  testWidgets('Show initial location by GPS Location', (tester) async {
    // Setup Behavior
    HttpOverrides.global = MockHttpOverrides();
    final testerWidget = ProviderScope(
      overrides: [
        localStorageProvider.overrideWithValue(localStorage),
        locationServiceProvider.overrideWithValue(locationNotifier),
        masterLocationProvider.overrideWithProvider(StateNotifierProvider.autoDispose<MasterLocationNotifier, MasterLocationState>((ref) {
          return MasterLocationNotifier(ref.read);
        })),
      ],
      child: const SettingMasterlocationScreen(),
    );
    // Start Pump
    await tester.pumpWidget(startWidget(testerWidget));
    expect(find.byType(TileLayer), findsOneWidget);
    await tester.pump();
    expect(find.byType(MarkerLayer), findsOneWidget);
    expect(find.byIcon(Icons.gps_fixed), findsOneWidget);
    expect(find.text("Setting Master Location"), findsOneWidget);
  });

  testWidgets('Change marker position by tap on map view', (tester) async {
    // Setup Behavior
    HttpOverrides.global = MockHttpOverrides();
    final testerWidget = ProviderScope(
      overrides: [
        localStorageProvider.overrideWithValue(localStorage),
        locationServiceProvider.overrideWithValue(locationNotifier),
        masterLocationProvider.overrideWithProvider(StateNotifierProvider.autoDispose<MasterLocationNotifier, MasterLocationState>((ref) {
          return MasterLocationNotifier(ref.read);
        })),
      ],
      child: const SettingMasterlocationScreen(),
    );
    // Start Pump Initial
    await tester.pumpWidget(startWidget(testerWidget));
    expect(find.byType(TileLayer), findsOneWidget);
    await tester.pump();
    expect(find.byType(MarkerLayer), findsOneWidget);
    expect(find.byIcon(Icons.gps_fixed), findsOneWidget);
    expect(find.text("Setting Master Location"), findsOneWidget);

    // tapped on maps
    // await tester.tap(find.byType(FlutterMap));
    // await tester.tapAt(Offset(100, 200));
    // await tester.pump(Duration(seconds: 1));
    // expect(find.text("Loading..."), findsOneWidget);

    // expect((tester.widget(find.byType(CircularProgressIndicator)) as CircularProgressIndicator).color, Colors.white);
  });

  testWidgets('Save position with press button', (tester) async {
    // Setup Behavior
    HttpOverrides.global = MockHttpOverrides();
    final testerWidget = ProviderScope(
      overrides: [
        localStorageProvider.overrideWithValue(localStorage),
        locationServiceProvider.overrideWithValue(locationNotifier),
        masterLocationProvider.overrideWithProvider(StateNotifierProvider.autoDispose<MasterLocationNotifier, MasterLocationState>((ref) {
          return MasterLocationNotifier(ref.read);
        })),
      ],
      child: const SettingMasterlocationScreen(),
    );
    // Start Pump Initial
    await tester.pumpWidget(startWidget(testerWidget));
    expect(find.byType(TileLayer), findsOneWidget);
    await tester.pump();
    expect(find.byType(MarkerLayer), findsOneWidget);
    expect(find.byIcon(Icons.gps_fixed), findsOneWidget);
    expect(find.text("Setting Master Location"), findsOneWidget);

    // tapped on maps
    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();

    // Assert show message from success
    expect(find.byType(ScaffoldMessenger), findsOneWidget);
    expect(find.text("Berhasil menyimpan master lokasi"), findsOneWidget);
  });
}
