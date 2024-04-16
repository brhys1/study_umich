import 'package:flutter/material.dart';
import 'package:umich_study/location_class/location_outline.dart';
import 'package:umich_study/location_class/Location.dart';
import 'package:umich_study/screens/location_src.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.locations});

  final List<Location> locations;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Text(
              'Study Umich',
              style: TextStyle(fontSize: 45),
            ),
            ElevatedButton(
              child: const Text('Find a Spot'),
              onPressed: () {
                // Navigate to second route when tapped.
              },
            ),
            ElevatedButton(
              child: const Text('Surprise Me'),
              onPressed: () {
                Navigator.push (
                  context, MaterialPageRoute(builder: (context) => LocationScreen(location: widget.locations[0])),
                );
              },
            ),
            Flexible (
              child : ListView.builder(
                itemCount: widget.locations.length,
                itemBuilder: (context, index){
                  return ListTile (
                    title: Text(widget.locations[index].name),
                  );
                },
              ),
            ),
          ]
        ),
      ),
    );
  }
}

