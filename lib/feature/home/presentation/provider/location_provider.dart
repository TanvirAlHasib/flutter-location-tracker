import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ostad_map/core/constant/map_constant.dart';
import 'package:ostad_map/core/theme/app_color.dart';
import 'package:ostad_map/core/utils/location_permission.dart';

class LocationProvider extends ChangeNotifier {
  final List<LatLng> _listOfLatLng = [];

  LatLng? _currentPosition;
  LatLng? _initialPosition;
  Polyline? _polyline;

  GoogleMapController? _mapController;

  StreamSubscription<Position>? _positionSubscription;

  LatLng? get getCurrentPosition => _currentPosition;
  LatLng? get getInitialPosition => _initialPosition;

  Polyline? get getPolyline => _polyline;

  void setMapController(GoogleMapController controller) {
    _mapController = controller;

    if (_currentPosition != null) {
      _animateCamera(_currentPosition!);
    }
  }

  Future<void> _animateCamera(LatLng position) async {
    if (_mapController == null) return;

    await _mapController!.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: position,
          zoom: 18,
        ),
      ),
    );
  }

  Future<void> getUserLocation() async {
    if (_positionSubscription != null) return;

    final bool isPermitted = await requestForLocation();

    if (!isPermitted) return;

    final LocationSettings locationSettings;

    if (defaultTargetPlatform == TargetPlatform.android) {
      locationSettings = AndroidSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 0,
        intervalDuration: const Duration(seconds: 10),
      );
    } else {
      locationSettings = const LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 0,
      );
    }

    _listOfLatLng.clear();

    _positionSubscription = Geolocator.getPositionStream(
      locationSettings: locationSettings,
    ).listen(
          (Position position) {
        final LatLng newPosition = LatLng(
          position.latitude,
          position.longitude,
        );

        // Update current location
        _currentPosition = newPosition;

        // Save location history
        _listOfLatLng.add(newPosition);
        _initialPosition = _listOfLatLng[0];

        // Update polyline
        _polyline = Polyline(
          polylineId: PolylineId(MapConstant.polyLineID),
          color: Color(AppColor.primaryButtonColor),
          width: 5,
          points: List<LatLng>.from(_listOfLatLng),
          visible: true,
        );

        // Animate camera to latest location
        _animateCamera(newPosition);

        notifyListeners();
      },
      onError: (Object error) {
        debugPrint("Location stream error: $error");
      },
    );
  }

  @override
  void dispose() {
    _positionSubscription?.cancel();
    _mapController = null;
    super.dispose();
  }
}