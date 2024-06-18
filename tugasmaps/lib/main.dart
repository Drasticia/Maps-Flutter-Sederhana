import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MapScreen(),
    );
  }
}

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  static const _initialCameraPosition = CameraPosition(
    target: LatLng(-6.97254, 107.63150), 
    zoom: 15,
  );

  late GoogleMapController _googleMapController;
  final Set<Marker> _markers = {
    Marker(
      markerId: MarkerId('telkomUniversity'),
      position: LatLng(-6.97254, 107.63150), 
      infoWindow: InfoWindow(title: 'Telkom University'),
    ),
  };

  void _moveTouristSpot() {
    _googleMapController.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(-6.80404, 107.59086), 
          zoom: 15,
        ),
      ),
    );
    setState(() {
      _markers.add(
        Marker(
          markerId: MarkerId('touristSpot'),
          position: LatLng(-6.80404, 107.59086), 
          infoWindow: InfoWindow(title: 'Lembang Park & Zoo(Tempat Wisata Bandugn)'),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'KELOMPOK 6 (TUGAS MAPS)',
          style: TextStyle(
            fontWeight: FontWeight.bold
          ),
        ),
        backgroundColor: Color.fromARGB(255, 255, 203, 91),
      ),
      body: GoogleMap(
        initialCameraPosition: _initialCameraPosition,
        markers: _markers,
        onMapCreated: (GoogleMapController controller) {
          _googleMapController = controller;
        },
      ),
      floatingActionButton: Container(
        height: 75,
        width: 75,
        child: FloatingActionButton(
          elevation: 5,
          onPressed: _moveTouristSpot,
          child: Icon(
            Icons.location_on,
            size: 30,
          ),
          backgroundColor: Color.fromARGB(255, 255, 203, 91),
          foregroundColor: Colors.black,
          
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}