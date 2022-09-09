import 'package:gps_request/models/position.dart';

class ListPositions {

 	List<Position> positions;

 	ListPositions(
   		this.positions
 	);

 	ListPositions.fromJson(Map<String, dynamic> json)
     		: positions = buildListPositions(json['data']);

 	static List<Position> buildListPositions(List<dynamic> list) => list.map((item) => Position.fromJson(item)).toList();

}
