import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ostad_map/core/constant/info_window_content.dart';
import 'package:ostad_map/core/constant/map_constant.dart';
import 'package:ostad_map/core/theme/app_color.dart';
import 'package:ostad_map/feature/home/presentation/provider/location_provider.dart';
import 'package:ostad_map/feature/home/widget/home_app_bar.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();

    context.read<LocationProvider>().getUserLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(AppColor.backGroundColor),
      appBar: const HomeAppBar(),
      body: Consumer<LocationProvider>(
        builder: (context, provider, child) {
          final currentPosition = provider.getCurrentPosition;
          final polyline = provider.getPolyline;
          final initialPosition = provider.getInitialPosition;

          if (currentPosition == null || initialPosition == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return GoogleMap(
            mapType: MapType.hybrid,

            initialCameraPosition: CameraPosition(
              target: currentPosition,
              zoom: 18,
            ),

            onMapCreated: (controller) {
              provider.setMapController(controller);
            },

            markers: {
              Marker(
                markerId: MarkerId(
                  MapConstant.initialMarkerID,
                ),
                position: initialPosition!,
                icon: BitmapDescriptor.defaultMarker,

                infoWindow: InfoWindow(
                  title: InfoWindowContent.title,
                  snippet: InfoWindowContent.snippet(currentPosition),
                ),
              ),
            },

            polylines: {
              if (polyline != null) polyline,
            },

            myLocationEnabled: true,
            myLocationButtonEnabled: true,
            zoomControlsEnabled: false,
          );
        },
      ),
    );
  }
}