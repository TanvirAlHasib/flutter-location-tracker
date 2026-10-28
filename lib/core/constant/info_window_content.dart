import 'package:google_maps_flutter/google_maps_flutter.dart';

class InfoWindowContent {
  static final String title = "My current location";
  static String snippet(LatLng currentPosition) => "Lat: ${currentPosition.latitude.toStringAsFixed(6)}, "
      "Lng: ${currentPosition.longitude.toStringAsFixed(6)}";
}