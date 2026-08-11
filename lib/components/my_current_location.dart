import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/restaturant.dart';
import 'package:food_delivery_app/services/location/location_service.dart';
import 'package:provider/provider.dart';

class MyCurrentLocation extends StatefulWidget {
  const MyCurrentLocation({super.key});

  @override
  State<MyCurrentLocation> createState() => _MyCurrentLocationState();
}

class _MyCurrentLocationState extends State<MyCurrentLocation> {
  final TextEditingController textController = TextEditingController();
  bool _isLoadingLocation = false;

  Future<void> _useDeviceLocation(BuildContext context) async {
    setState(() => _isLoadingLocation = true);
    try {
      final address = await LocationService.getCurrentAddress();
      if (!context.mounted) return;
      context.read<Restaurant>().updateDeliveryAddress(address);
      Navigator.pop(context);
    } catch (e) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Couldn't get location: $e")),
      );
    } finally {
      if (mounted) setState(() => _isLoadingLocation = false);
    }
  }

  void openLocationSearch(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setDialogState) => AlertDialog(
          title: Text("Your Location"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: textController,
                decoration: InputDecoration(hintText: "Enter Address..."),
              ),
              const SizedBox(height: 12),
              TextButton.icon(
                onPressed: _isLoadingLocation
                    ? null
                    : () => _useDeviceLocation(context),
                icon: _isLoadingLocation
                    ? const SizedBox(
                        width: 16,
                        height: 16,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Icon(Icons.my_location),
                label: Text(_isLoadingLocation
                    ? "Fetching location..."
                    : "Use current location"),
              ),
            ],
          ),
          actions: [
            MaterialButton(
              onPressed: () {
                Navigator.pop(context);
                textController.clear();
              },
              child: Text("Cancel"),
            ),
            MaterialButton(
              onPressed: () {
                String newAddress = textController.text;
                if (newAddress.isNotEmpty) {
                  context.read<Restaurant>().updateDeliveryAddress(newAddress);
                }
                Navigator.pop(context);
                textController.clear();
              },
              child: Text("Save"),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Deliver now", style: TextStyle(color: Theme.of(context).colorScheme.primary)),
          GestureDetector(
            onTap: () => openLocationSearch(context),
            child: Row(
              children: [
                Consumer<Restaurant>(
                  builder: (context, restaurant, child) => Text(
                    restaurant.deliveryAddress,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Icon(Icons.keyboard_arrow_down_rounded)
              ],
            ),
          )
        ],
      ),
    );
  }
}