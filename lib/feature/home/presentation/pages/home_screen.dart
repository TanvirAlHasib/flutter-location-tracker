import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ostad_map/core/theme/app_color.dart';
import 'package:ostad_map/feature/home/widget/home_app_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(AppColor.backGroundColor),
      appBar: HomeAppBar(),
      body: GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: CameraPosition(
          target: LatLng(37.42796133580664, -122.085749655962),
          zoom: 18,
        ),
        markers: {
          Marker(
            markerId: MarkerId("init"),
            position: LatLng(37.42796133580664, -122.085749655962),
            icon: BitmapDescriptor.defaultMarker,
          )
        },
      ),
    );
  }
}
