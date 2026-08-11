

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class LocationService {
  static final Geocoding _geocoding = Geocoding();
  static Future<String> getCurrentAddress() async{
    LocationPermission permission = await Geolocator.checkPermission();
    if(permission  == LocationPermission.denied){
      permission = await Geolocator.requestPermission();
      if(permission == LocationPermission.denied){
        throw Exception("Location permission needed");
      }
    }
    if(permission == LocationPermission.deniedForever){
      throw Exception("Location permission permanently denied");
    }

    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high
    );

    List<Placemark> placemarks = await _geocoding.placemarkFromCoordinates(
      position.latitude,
      position.longitude,
    );

    if(placemarks.isEmpty){
      throw Exception("could not resolve address");
    }

    final place = placemarks.first;
    return "${place.street}, ${place.subLocality}, ${place.country}";
  }
}