import 'package:flutter/material.dart';
import 'package:gps_request/models/listPosition.dart';
import 'package:gps_request/models/position.dart';
import 'package:gps_request/screens/listItem.dart';
import 'package:gps_request/services/positionServices.dart';

class ListTruck extends StatefulWidget {
  const ListTruck({Key? key}) : super(key: key);

  @override
  State<ListTruck> createState() => _ListTruckState();
}

class _ListTruckState extends State<ListTruck> {
  ListPositions? listPositions;

  @override
  void initState() {
    super.initState();

    getPositions().then((c) {
      setState(() {
        listPositions = c;
      });
    });
  }

  Widget buildListItem(Position position) {
    return ListItemVehicle(position);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Veículos"),
        actions: [
          IconButton(
            icon: const Icon(Icons.map),
            onPressed: () {
              Navigator.pushNamed(context, "/mapa", arguments: listPositions);
            },
          ),
        ],
      ),
      body: listPositions == null
          ? const LinearProgressIndicator()
          : ListView.separated(
              itemBuilder: (context, index) =>
                  buildListItem(listPositions!.positions[index]),
              separatorBuilder: (context, index) => const Divider(height: 1),
              itemCount: listPositions?.positions == null
                  ? 0
                  : listPositions!.positions.length),
    );
  }
}
