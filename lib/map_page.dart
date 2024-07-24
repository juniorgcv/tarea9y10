import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  MapPageState createState() => MapPageState();
}

class MapPageState extends State<MapPage> {
  late GoogleMapController mapController;
  late String nombre;
  late String apellido;
  late double latitud;
  late double longitud;
  String address = '';

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    nombre = args['nombre'];
    apellido = args['apellido'];
    latitud = args['latitud'];
    longitud = args['longitud'];
    _getAddress(latitud, longitud);
  }

  void _getAddress(double lat, double lng) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(lat, lng);
    setState(() {
      String locality = placemarks.first.locality ?? 'Unknown locality';
      String country = placemarks.first.country ?? 'Unknown country';
      address = '$locality, $country';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mapa'),
      ),
      body: GoogleMap(
        onMapCreated: (GoogleMapController controller) {
          mapController = controller;
        },
        initialCameraPosition: CameraPosition(
          target: LatLng(latitud, longitud),
          zoom: 15,
        ),
        markers: {
          Marker(
            markerId: const MarkerId('marker'),
            position: LatLng(latitud, longitud),
            infoWindow: InfoWindow(
              title: '$nombre $apellido',
              snippet: address,
            ),
          ),
        },
      ),
    );
  }
}
