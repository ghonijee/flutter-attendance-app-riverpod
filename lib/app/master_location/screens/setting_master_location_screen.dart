import 'package:attendance_app/app/master_location/providers/master_location_provider.dart';
import 'package:attendance_app/app/master_location/state/master_location_state.dart';
import 'package:attendance_app/shared/providers/location_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:latlong2/latlong.dart';

class SettingMasterlocationScreen extends HookConsumerWidget {
  const SettingMasterlocationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    ref.listen(masterLocationProvider, (previous, next) {
      if (next is MasterLocationSuccess) {
        var snackBar = SnackBar(
          content: Text(next.message),
        );

        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    });

    final screen = MediaQuery.of(context).size;
    var state = ref.watch(masterLocationProvider);

    var mapController = useState(MapController());

    return Scaffold(
      appBar: AppBar(title: const Text("Master Location")),
      body: state.maybeWhen(inital: () {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }, loading: () {
        return Container(
            height: screen.height,
            width: screen.width,
            child: Stack(
              children: [
                Container(
                  height: screen.height,
                  width: screen.width,
                  child: FlutterMap(
                    mapController: mapController.value,
                    options: MapOptions(
                        center: null,
                        zoom: 13,
                        onTap: (tapPosition, latLng) {
                          ref.watch(masterLocationProvider.notifier).changePosition(latLng);
                        }),
                    children: [
                      TileLayer(
                        urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
                        userAgentPackageName: 'dev.fleaflet.flutter_map.example',
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    height: 220,
                    width: screen.width,
                    color: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Setting Master Location",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const Text("Silakan pilih lokasi untuk dijadikam master lokasi!"),
                        const SizedBox(
                          height: 16,
                        ),
                        Text("Loading..."),
                        const SizedBox(
                          height: 16,
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size.fromHeight(45),
                            ),
                            onPressed: null,
                            child: const SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            ))
                      ],
                    ),
                  ),
                ),
              ],
            ));
      }, loaded: (model) {
        mapController.value.move(model.position, 15);
        return Container(
            height: screen.height,
            width: screen.width,
            child: Stack(
              children: [
                Container(
                  height: screen.height,
                  width: screen.width,
                  child: FlutterMap(
                    mapController: mapController.value,
                    options: MapOptions(
                        center: model.position,
                        zoom: 13,
                        onTap: (tapPosition, latLng) async {
                          await ref.watch(masterLocationProvider.notifier).changePosition(latLng);
                        }),
                    children: [
                      TileLayer(
                        urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
                        userAgentPackageName: 'dev.fleaflet.flutter_map.example',
                      ),
                      MarkerLayer(
                        markers: [
                          Marker(
                            point: model.position,
                            width: 80,
                            height: 80,
                            builder: (context) => Image.asset("assets/marker.png"),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: FloatingActionButton(
                            child: Icon(Icons.gps_fixed),
                            onPressed: () {
                              ref.watch(masterLocationProvider.notifier).init();

                              print("init");
                            }),
                      ),
                      Container(
                        height: 220,
                        width: screen.width,
                        color: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Setting Master Location",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            const Text("Silakan pilih lokasi untuk dijadikam master lokasi!"),
                            const SizedBox(
                              height: 16,
                            ),
                            Text(model.name ?? "-"),
                            const SizedBox(
                              height: 16,
                            ),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  minimumSize: const Size.fromHeight(45),
                                ),
                                onPressed: () {
                                  ref.watch(masterLocationProvider.notifier).saveLocation();
                                },
                                child: const Text("Simpan Master Lokasi"))
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ));
      }, orElse: () {
        return Text("else not");
      }),
    );
  }
}
