import 'package:abhiyanth/widgets/map_widget.dart';
import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';

class MapPage extends StatelessWidget {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const LocationMap(
        location: LatLng(14.73774453990044, 79.0534587906741),
      ),
    );
  }
}
