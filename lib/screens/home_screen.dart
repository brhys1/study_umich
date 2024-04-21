import 'package:flutter/material.dart';
import 'package:umich_study/location_class/Location.dart';
import 'package:umich_study/screens/location_src.dart';
import 'package:umich_study/screens/find_screen.dart';

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
                Navigator.push (context, MaterialPageRoute(builder: (context) => FindScreen(locations: widget.locations)));
              },
            ),
            Flexible (
              child : ListView.builder(
                itemCount: widget.locations.length,
                itemBuilder: (context, index){
                  return ListTile (
                    title : Text(widget.locations[index].name),
                    onTap: () {
                      Navigator.push (context, MaterialPageRoute(builder: (context) => LocationScreen(location: widget.locations[index], locations: widget.locations)));
                    },
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

