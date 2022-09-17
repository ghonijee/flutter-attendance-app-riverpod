import 'package:attendance_app/app/master_location/providers/master_location_provider.dart';
import 'package:attendance_app/app/master_location/state/master_location_state.dart';
import 'package:attendance_app/shared/constant/local_storage_key.dart';
import 'package:attendance_app/shared/providers/local_storage_provider.dart';
import 'package:attendance_app/shared/providers/location_provider.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'master_location_provider_test.mocks.dart';
import 'mock_geocoding_platform.mock.dart';

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

@GenerateNiceMocks([MockSpec<LocationNotifier>()])
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
    container = ProviderContainer(overrides: [
      localStorageProvider.overrideWithValue(localStorage),
      locationServiceProvider.overrideWithValue(locationNotifier),
      masterLocationProvider.overrideWithProvider(StateNotifierProvider.autoDispose<MasterLocationNotifier, MasterLocationState>((ref) {
        return MasterLocationNotifier(ref.read);
      })),
    ]);
  });
  test("Initial data maps by GPS location", () async {
    // Setup behavior
    var state = container.read(masterLocationProvider);
    expect(state, MasterLocationState.loading());
    Future.delayed(const Duration(seconds: 1));
    await container.read(masterLocationProvider.notifier).init();
    var newState = container.read(masterLocationProvider) as MasterLocationLoaded;
    expect(newState.model.lat, mockPosition.latitude);
  });

  test("Change position state by LatLong", () async {
    var state = container.read(masterLocationProvider);
    expect(state, MasterLocationState.loading());
    final latLng = LatLng(6.88, 11.123);
    await container.read(masterLocationProvider.notifier).changePosition(latLng);
    var newState = container.read(masterLocationProvider) as MasterLocationLoaded;
    expect(newState.model.lat, latLng.latitude);
    expect(newState.model.long, latLng.longitude);
  });

  test("Save master position state by current state", () async {
    await container.read(masterLocationProvider.notifier).init();
    var loaded = container.read(masterLocationProvider) as MasterLocationLoaded;
    container.read(masterLocationProvider.notifier).saveLocation();
    var state = container.read(masterLocationProvider);
    expect(state, MasterLocationState.succcess("Berhasil menyimpan master lokasi"));
    expect(localStorage.read(LocalStorageKey.masterLocation), loaded.model.toJson());
  });
}
