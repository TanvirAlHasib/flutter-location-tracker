import 'dart:async';
import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ostad_map/core/constant/map_constant.dart';
import 'package:ostad_map/core/theme/app_color.dart';
import 'package:ostad_map/core/utils/location_permission.dart';

class LocationProvider extends ChangeNotifier{
  Polyline? _polyline;
  List<LatLng>? _listOfLatLng;
  LatLng? _currentPosition;
  Polyline? get getPolyline => _polyline;
  List<LatLng>? get getListLatLng => _listOfLatLng;
  LatLng? get getCurrentPosition => _currentPosition;
  late LocationSettings locationSettings;

  Future<void> getUserLocation() async{
    final bool isPermitted = await requestForLocation();
    if(isPermitted){
      if (defaultTargetPlatform == TargetPlatform.android) {
        locationSettings = AndroidSettings(
            accuracy: LocationAccuracy.high,
            distanceFilter: 10,
            forceLocationManager: true,
            intervalDuration: const Duration(seconds: 10),
            //(Optional) Set foreground notification config to keep the app alive
            //when going to the background
            foregroundNotificationConfig: const ForegroundNotificationConfig(
              notificationText:
              "Example app will continue to receive your location even when you aren't using it",
              notificationTitle: "Running in Background",
              enableWakeLock: true,
            )
        );
      } else {
        locationSettings = LocationSettings(
          accuracy: LocationAccuracy.high,
          distanceFilter: 10,
        );
      }

      // supply location settings to getPositionStream
      _listOfLatLng?.clear();
      Geolocator.getPositionStream(locationSettings: locationSettings).listen((Position? position) {
        if(position != null){
          _currentPosition = LatLng(position.latitude, position.longitude);
          _listOfLatLng?.add(_currentPosition!);
          _polyline = Polyline(
            polylineId: PolylineId(MapConstant.polyLineID),
            color: Color(AppColor.primaryButtonColor),
            points: _listOfLatLng!,
            visible: true
          );
        }
      });
    }
  }
}