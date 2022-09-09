import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:gps_request/models/listPosition.dart';
import 'package:gps_request/models/position.dart';

class Mapa extends StatefulWidget {
  const Mapa({Key? key}) : super(key: key);

  @override
  State<Mapa> createState() => _MapaState();
}

class _MapaState extends State<Mapa> {
  Map<MarkerId, Marker> markers =
      <MarkerId, Marker>{};

  Position? position;
  ListPositions? listPositions;

  late CameraPosition _position;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (ModalRoute.of(context)!.settings.arguments is Position) {
      position = ModalRoute.of(context)!.settings.arguments as Position?;
    } else {
      listPositions =
          ModalRoute.of(context)!.settings.arguments as ListPositions?;
    }

    if (position != null) {
      _position = CameraPosition(
        target: LatLng(position!.lat, position!.lng),
        zoom: 14.4746,
      );
    } else {
      _position = CameraPosition(
        target: LatLng(
            listPositions!.positions[0].lat, listPositions!.positions[0].lng),
        zoom: 18.4746,
      );
    }

    return Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _position,
        onMapCreated: _onMapCreated,
        markers: Set<Marker>.of(markers.values),
      ),
    );
  }

  Future<void> _onMapCreated(GoogleMapController controller) async {
    if (position != null) {
      final marker = Marker(
        markerId: MarkerId(position!.veiculo_placa),
        position: LatLng(position!.lat, position!.lng),
      );
      markers[marker.markerId] = marker;
    } else {
      List<LatLng> latLngs = [];
      for (final position in listPositions!.positions) {
        LatLng latLng = LatLng(position.lat, position.lng);
        latLngs.add(latLng);
        final marker = Marker(
          markerId: MarkerId(position.veiculo_placa),
          position: latLng,
          infoWindow: InfoWindow(
            title: position.veiculo_placa,
            snippet: position.condutor_nome,
          ),
        );
        markers[marker.markerId] = marker;
      }
    }

    setState(() {});
  }
}
