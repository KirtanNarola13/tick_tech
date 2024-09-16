import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CurrentLocation extends StatefulWidget {
  const CurrentLocation({super.key});

  @override
  State<CurrentLocation> createState() => _CurrentLocationState();
}

class _CurrentLocationState extends State<CurrentLocation> {
  static final kInitialPosition = LatLng(-33.8567844, 151.213108);

  late GoogleMapController _controller;
  final CameraPosition _initialCameraPosition = CameraPosition(
    target: LatLng(21.2612361, 72.8492587), // Sydney, Australia as an example
    zoom: 17,
  );

  void _onMapCreated(GoogleMapController controller) {
    _controller = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select Current Location"),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () async {},
          ),
        ],
      ),
      body: GoogleMap(
        initialCameraPosition: _initialCameraPosition,
        onMapCreated: (GoogleMapController controller) {
          setState(() {
            _controller = controller;
          });
        },
        mapToolbarEnabled: true,
        mapType: MapType.normal,
      ),
    );
  }
}
