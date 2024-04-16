import 'package:flutter/material.dart';
import 'package:umich_study/screens/home_screen.dart';
import 'package:umich_study/location_class/Location.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final List<Location> locationsList = locationBuilder();

    return MaterialApp(
      home: MyHomePage(locations: locationsList),
    );
  }
}



locationBuilder() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  List<Location> locations = <Location> [];
  for (var i = 0; i < 100; i++){
    locations.add(const Location());
  }
  return locations;
}