import 'package:flutter/material.dart';
import 'package:gps_request/screens/listTrucks.dart';
import 'package:gps_request/screens/map.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
 Widget build(BuildContext context) {
   return MaterialApp(
     theme: ThemeData(
         primaryColor: Colors.deepOrange
     ),
     debugShowCheckedModeBanner: false,
     initialRoute: '/',
     routes: {
       '/': (context) => const ListTruck(),
       '/mapa': (context) => const Mapa(),
     },
   );
 }

}