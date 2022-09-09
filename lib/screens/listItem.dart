import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:geocoding/geocoding.dart';
import 'package:gps_request/models/position.dart';

class ListItemVehicle extends StatefulWidget {
  final Position position;

  const ListItemVehicle(this.position);

  @override
  _ListItemVehicleState createState() => _ListItemVehicleState();
}

class _ListItemVehicleState extends State<ListItemVehicle> {
  TextStyle style15dp = const TextStyle(fontSize: 15);
  TextStyle style27dp = const TextStyle(fontSize: 27);
  Placemark? placemark;

  @override
  void initState() {
    super.initState();
    getAddress();
  }

  getAddress() async {
    List<Placemark> listPlacemarks = await placemarkFromCoordinates(
        widget.position.lat, widget.position.lng);

    setState(() {
      placemark = listPlacemarks[0];
    });
  }

  String getFormattedAddress() {
    return "${placemark?.subAdministrativeArea}, ${placemark?.administrativeArea}";
  }

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (BuildContext context) {  },
            flex: 2,
            backgroundColor: Colors.lightBlue,
            foregroundColor: Colors.white,
            icon: Icons.archive,
            label: 'Comandos', 
          ),
        ],
      ),
      child: InkWell(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.position.veiculo_placa.trim(),
                        style: style27dp),
                    Text(widget.position.condutor_nome,
                        style: style15dp),
                    Text(
                      placemark == null
                          ? "Buscando endereço..."
                          : getFormattedAddress(),
                      style: style15dp,
                      softWrap: false,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              const Icon(Icons.keyboard_arrow_right)
            ],
          ),
        ),
        onTap: () {
          Navigator.pushNamed(context, "/mapa", arguments: widget.position);
        },
      ),
    );
  }
}
