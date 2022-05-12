import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapController extends StatefulWidget {
  const MapController({Key? key}) : super(key: key);

  @override
  _MapControllerState createState() => _MapControllerState();
}

class _MapControllerState extends State<MapController> {
  late final Completer<GoogleMapController> _controller = Completer();
  final Set<Marker> _markers = {};
  final LatLng _posisiToko = LatLng(-6.199770686808422, 107.02275889552561);

  @override
  void initState() {
    _markers.add(
      Marker(
        markerId: MarkerId("Toko"),
        position: _posisiToko,
        icon: BitmapDescriptor.defaultMarker,
      ),
    );
    super.initState();
  }

  static CameraPosition get _LokasiToko => const CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(-6.199770686808422, 107.02275889552561),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lokasi Toko"),
        backgroundColor: Colors.lightGreen,
      ),
      body: GoogleMap(
        mapType: MapType.normal,
        zoomControlsEnabled: false,
        initialCameraPosition: CameraPosition(target: _posisiToko, zoom: 14.0),
        markers: _markers,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _setLokasiToko,
        label: const Text('Lokasi Toko'),
        backgroundColor: Colors.lightGreen,
        icon: const Icon(Icons.store),
      ),
    );
  }

  Future<void> _setLokasiToko() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_LokasiToko));
  }
}
