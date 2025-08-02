


import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

mixin LocationPermissionMixin {
  /// Ensures that location services and permissions are enabled and granted.
  /// Returns `true` if everything is OK, otherwise shows a snackbar and returns `false`.
  Future<bool> ensureLocationPermission() async {
    // Check if location services are enabled
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      Get.snackbar('Location Error', 'Location services are disabled.');
      return false;
    }

    // Check permission status
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.denied) {
      Get.snackbar('Permission Denied', 'Location permission denied');
      return false;
    }

    if (permission == LocationPermission.deniedForever) {
      Get.snackbar(
        'Permission Blocked',
        'Please enable location permission in settings',
        mainButton: TextButton(
          onPressed: () => openAppSettings(),
          child: const Text('Open Settings'),
        ),
      );
      return false;
    }

    return true;
  }
}
