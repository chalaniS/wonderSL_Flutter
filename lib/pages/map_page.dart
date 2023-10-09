import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ionicons/ionicons.dart';
import 'package:location/location.dart';
import 'package:wondersl/pages/User/profile_page.dart';
import 'package:wondersl/pages/home_page.dart';
import 'package:geolocator/geolocator.dart';

import '../constants.dart';

class TravelMap extends StatefulWidget {
  const TravelMap({super.key});

  @override
  State<TravelMap> createState() => _TravelMapState();
}

class _TravelMapState extends State<TravelMap> {
  final Completer<GoogleMapController> _controller = Completer();

  static const LatLng sourceLocation =
      LatLng(6.931970843682031, 79.84310638367307);
  static const LatLng destination =
      LatLng(7.293736697003451, 80.64131426545106);

  List<LatLng> polylinecoordinates = [];
  LocationData? currentLocation;

  BitmapDescriptor sourceIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor destinationIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor currentLocationIcon = BitmapDescriptor.defaultMarker;

  Future<void> getCurrentLocation() async {
    Location location = Location();

    location.getLocation().then(
      (location) {
        currentLocation = location;
      },
    );

    GoogleMapController googleMapController = await _controller.future;

    location.onLocationChanged.listen((newLoc) {
      currentLocation = newLoc;

      googleMapController.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            zoom: 16.5,
            target: LatLng(newLoc!.latitude!, newLoc!.longitude!),
          ),
        ),
      );

      setState(() {});
    });
  }

  Future<void> getPolyPoints() async {
    PolylinePoints polylinePoints = PolylinePoints();

    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      google_api_key,
      PointLatLng(sourceLocation.latitude, sourceLocation.longitude),
      PointLatLng(destination.latitude, destination.longitude),
    );

    if (result.points.isNotEmpty) {
      result.points.forEach(
        (PointLatLng point) =>
            polylinecoordinates.add(LatLng(point.latitude, point.longitude)),
      );
      setState(() {});
    }
  }

  Future<double> calculateDistance() async {
    double distance = 0;

    if (currentLocation != null) {
      distance = await Geolocator.distanceBetween(
        currentLocation!.latitude!,
        currentLocation!.longitude!,
        destination.latitude,
        destination.longitude,
      );
    }

    return distance;
  }

  @override
  void initState() {
    super.initState();
    getCurrentLocation();
    setCustomMarkerIcon();
  }

  void setCustomMarkerIcon() {
    BitmapDescriptor.fromAssetImage(
      ImageConfiguration.empty,
      "assets/Pin_source.png",
    ).then(
      (icon) {
        sourceIcon = icon;
      },
    );
    BitmapDescriptor.fromAssetImage(
      ImageConfiguration.empty,
      "assets/Pin_destination.png",
    ).then(
      (icon) {
        destinationIcon = icon;
      },
    );
    BitmapDescriptor.fromAssetImage(
      ImageConfiguration.empty,
      "assets/Badge.png",
    ).then(
      (icon) {
        currentLocationIcon = icon;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Google Map",
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
      ),
      body: currentLocation == null
          ? const Center(child: Text("Loading..."))
          : Column(
              children: [
                Expanded(
                  child: GoogleMap(
                    initialCameraPosition: CameraPosition(
                      target: LatLng(currentLocation!.latitude!,
                          currentLocation!.longitude!),
                      zoom: 10.0, // Start with a lower zoom level
                    ),
                    polylines: {
                      Polyline(
                        polylineId: PolylineId("route"),
                        points: polylinecoordinates,
                        color: primaryColor,
                        width: 6,
                      ),
                    },
                    markers: {
                      Marker(
                        markerId: const MarkerId("currentLocation"),
                        icon: currentLocationIcon,
                        position: LatLng(currentLocation!.latitude!,
                            currentLocation!.longitude!),
                      ),
                      Marker(
                        markerId: MarkerId("source"),
                        icon: sourceIcon,
                        position: sourceLocation,
                      ),
                      Marker(
                        markerId: MarkerId("destination"),
                        icon: destinationIcon,
                        position: destination,
                      ),
                    },
                    onMapCreated: (mapController) {
                      _controller.complete(mapController);
                      getPolyPoints(); // Load polylines here
                    },
                  ),
                ),
                FutureBuilder<double>(
                  future: calculateDistance(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text("Distance: Error");
                    } else {
                      final distance = snapshot.data ?? 0.0;
                      return Text(
                        "Total Distance: ${distance.toStringAsFixed(2)} km",
                        style: const TextStyle(
                          fontSize: 30,
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Ionicons.home_outline),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Ionicons.location_outline),
            label: "Map",
          ),
          BottomNavigationBarItem(
            icon: Icon(Ionicons.bookmark_outline),
            label: "Bookmark",
          ),
          BottomNavigationBarItem(
            icon: Icon(Ionicons.chatbubble_ellipses_outline),
            label: "Messenger",
          ),
          BottomNavigationBarItem(
            icon: Icon(Ionicons.person_outline),
            label: "Profile",
          ),
        ],
        onTap: (int index) {
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const HomePage(),
              ),
            );
          } else if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const TravelMap(),
              ),
            );
          } else if (index == 4) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Profile(),
              ),
            );
          }
        },
      ),
    );
  }
}
