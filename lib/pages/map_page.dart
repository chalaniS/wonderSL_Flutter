import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class TravelMap extends StatefulWidget {
  const TravelMap({super.key});

  @override
  State<TravelMap> createState() => _TravelMapState();
}

class _TravelMapState extends State<TravelMap> {
  final Completer<GoogleMapController> _controller = Completer();

  static const LatLng sourceLocation = LatLng(37.33500926, -122.03272188);
  static const LatLng destination = LatLng(37.33429383, -122.06600055);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Google Map",
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),
        ),
        body: const GoogleMap(
            initialCameraPosition: CameraPosition(
          target: sourceLocation,
          zoom: 14.5,
        )));
  }
}
