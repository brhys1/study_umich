import 'package:flutter/material.dart';
import 'package:umich_study/screens/home_screen.dart';
import 'package:umich_study/location_class/Location.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'firebase_options.dart';



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FutureBuilder<List<Location>>(
        future: locationBuilder(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Center(child: Text("Error: ${snapshot.error}"));
            }
            return MyHomePage(locations: snapshot.data ?? []);
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}



Future<List<Location>> locationBuilder() async {
  FirebaseFirestore db = FirebaseFirestore.instance;
  List<Location> locations = <Location> [];

  Location l = Location();
  await db.collection("Study_Spots").get().then((event) {
    for (var doc in event.docs) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      l.name = data['Name'].toString();
      print(l.name);
    }
  });

  for (var i = 0; i < 100; i++){
    locations.add(Location());
  }
  return locations;
}

