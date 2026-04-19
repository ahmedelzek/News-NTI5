import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:news_nti5/core/app_router/app_router_keys.dart';
import 'package:news_nti5/core/customized_widgets/customized_button.dart';
import 'package:news_nti5/core/resources/app_colors.dart';
import 'package:news_nti5/features/map/views/widgets/customized_name_contanier.dart';

import '../../../core/cache/cache_helper.dart';
import '../../../core/location_helper/geolocator_helper.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController mapController;
  Set<Marker> markers = {};
  LatLng? currentPosition;

  final LatLng egyptCenter = const LatLng(26.8206, 30.8025);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: AppColors.white),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 34.w),
            child: CustomizedNameContainer(),
          ),
          SizedBox(height: 15.h),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 50.w),
            child: CustomizedButton(
              text: "Use Current Location",
              onTap: _useCurrentLocation,
            ),
          ),
          SizedBox(height: 15.h),
          Expanded(
            child: Stack(
              children: [
                GoogleMap(
                  onMapCreated: _onMapCreated,
                  initialCameraPosition: CameraPosition(
                    target: egyptCenter,
                    zoom: 12,
                  ),
                  mapType: MapType.normal,
                  markers: markers,
                  onTap: _onMapTapped,
                ),
                Positioned(
                  bottom: 80.h,
                  left: 0,
                  right: 0,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 132.w),
                    child: CustomizedButton(
                      text: "Get Start",
                      onTap: () {
                        context.go(AppRouterPaths.home);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _useCurrentLocation() async {
    try {
      Position position = await GeolocatorHelper.determinePosition();

      setState(() {
        currentPosition = LatLng(position.latitude, position.longitude);
        markers = {
          Marker(
            markerId: const MarkerId('current_location'),
            position: currentPosition!,
            infoWindow: const InfoWindow(title: 'My Location'),
          ),
        };
      });

      mapController.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: currentPosition!, zoom: 15),
        ),
      );
      _savePosition(currentPosition!);
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  void _onMapTapped(LatLng tappedPoint) {
    setState(() {
      currentPosition = tappedPoint;
      markers = {
        Marker(
          markerId: const MarkerId('selected_location'),
          position: tappedPoint,
          infoWindow: const InfoWindow(
            title: 'Selected Location',
            snippet: 'Tap anywhere to move the marker',
          ),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
        ),
      };
      _savePosition(tappedPoint);
    });
  }
  void _savePosition(LatLng position) {
    CacheHelper.setValue('lat', position.latitude);
    CacheHelper.setValue('lng', position.longitude);
  }
}
