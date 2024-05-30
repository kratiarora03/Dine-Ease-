import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fooddelivery/models/restaurant.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:fooddelivery/consts.dart';
import 'package:location/location.dart';
import 'package:fooddelivery/Cafe.dart';

class MapPage extends StatefulWidget {
  final Cafe cafe;

  const MapPage({Key? key, required this.cafe, required Restaurant restaurant})
      : super(key: key);

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final Location _locationController = Location();
  final Completer<GoogleMapController> _mapController =
      Completer<GoogleMapController>();

  late LatLng _cafeCoordinates;
  LatLng? _currentLocation;

  Map<PolylineId, Polyline> _polylines = {};

  @override
  void initState() {
    super.initState();
    _cafeCoordinates = LatLng(widget.cafe.latitude, widget.cafe.longitude);
    _getLocationUpdates();
    _getPolylinePoints();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.cafe.name), // Display cafe name in app bar
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: Text('Name: ${widget.cafe.name}'),
            subtitle: Text('Address: ${widget.cafe.address}'),
          ),
          Expanded(
            child: SizedBox(
              width: double.infinity,
              child: _currentLocation == null
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : GoogleMap(
                      onMapCreated: (GoogleMapController controller) {
                        _mapController.complete(controller);
                      },
                      initialCameraPosition: CameraPosition(
                        target: _cafeCoordinates,
                        zoom: 13,
                      ),
                      markers: {
                        Marker(
                          markerId: const MarkerId("_cafeLocation"),
                          icon: BitmapDescriptor.defaultMarkerWithHue(
                              BitmapDescriptor.hueRed),
                          position: _cafeCoordinates,
                        ),
                        if (_currentLocation != null)
                          Marker(
                            markerId: const MarkerId("_currentLocation"),
                            icon: BitmapDescriptor.defaultMarkerWithHue(
                                BitmapDescriptor.hueRed),
                            position: _currentLocation!,
                          ),
                      },
                      polylines: Set<Polyline>.of(_polylines.values),
                    ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context); // Navigate back to the previous screen
        },
        child: const Icon(Icons.arrow_back),
      ),
    );
  }

  Future<void> _getLocationUpdates() async {
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await _locationController.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await _locationController.requestService();
    }

    _permissionGranted = await _locationController.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await _locationController.requestPermission();
    }

    _locationController.onLocationChanged
        .listen((LocationData currentLocation) {
      if (currentLocation.latitude != null &&
          currentLocation.longitude != null) {
        setState(() {
          _currentLocation =
              LatLng(currentLocation.latitude!, currentLocation.longitude!);
        });
      }
    });
  }

  Future<void> _getPolylinePoints() async {
    List<LatLng> polylineCoordinates = [];
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      GOOGLE_MAPS_API_KEY,
      PointLatLng(_cafeCoordinates.latitude, _cafeCoordinates.longitude),
      PointLatLng(_cafeCoordinates.latitude, _cafeCoordinates.longitude),
      travelMode: TravelMode.driving,
    );
    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    } else {
      print(result.errorMessage);
    }
    _generatePolylineFromPoints(polylineCoordinates);
  }

  void _generatePolylineFromPoints(List<LatLng> polylineCoordinates) {
    final PolylineId id = const PolylineId("poly");
    final Polyline polyline = Polyline(
      polylineId: id,
      color: Colors.black,
      points: polylineCoordinates,
      width: 8,
    );
    setState(() {
      _polylines[id] = polyline;
    });
  }
}
