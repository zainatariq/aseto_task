import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import '../../../common /app_style.dart';
import 'package:geolocator/geolocator.dart';
import '../../../core/mixin/loc_permission.dart';

class AddressSummaryCard extends StatefulWidget {
  final String address;
  final Function(String)? onLocationFetched;

  const AddressSummaryCard({
    required this.address,
    this.onLocationFetched,
    super.key,
  });

  @override
  State<AddressSummaryCard> createState() => _AddressSummaryCardState();
}

class _AddressSummaryCardState extends State<AddressSummaryCard> with LocationPermissionMixin {
  String currentAddress = '';
  bool isLoading = false;

  @override
  void initState() {
    currentAddress = widget.address;
    super.initState();
  }

  Future<void> _getCurrentLocation() async {
    setState(() => isLoading = true);

    try {
      final allowed = await ensureLocationPermission();
      if (!allowed) {
        setState(() => isLoading = false);
        return;
      }

      Position position = await Geolocator.getCurrentPosition();
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      if (placemarks.isNotEmpty) {
        final place = placemarks.first;

        String location = [
          place.street,
          place.subLocality,
          place.locality,
          place.administrativeArea,
          place.country,
        ].where((e) => e != null && e.isNotEmpty).join(', ');

        setState(() {
          currentAddress = location;
          isLoading = false;
        });

        if (widget.onLocationFetched != null) {
          widget.onLocationFetched!(location);
        }
      } else {
        setState(() => isLoading = false);
        Get.snackbar("Error", "Failed to fetch address details");
      }
    } catch (e) {
      setState(() => isLoading = false);
      Get.snackbar('Error', 'Failed to get location: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(currentAddress, style: AppStyles.fieldStyle),
          const SizedBox(height: 10),
          Align(
            alignment: Alignment.centerRight,
            child: ElevatedButton.icon(
              onPressed: isLoading ? null : _getCurrentLocation,
              icon: const Icon(Icons.my_location, size: 18),
              label: isLoading
                  ? const SizedBox(
                width: 18,
                height: 18,
                child: CircularProgressIndicator(strokeWidth: 2),
              )
                  : const Text("Get Location"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.indigo,
                foregroundColor: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
