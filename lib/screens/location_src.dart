import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:umich_study/location_class/Location.dart';
import 'package:umich_study/screens/rating_screen.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key, required this.location, required this.locations});

  final Location location;
  final List<Location> locations;

  @override
  State<LocationScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<LocationScreen> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: ListView(
          children: [
            Text(widget.location.name,
            style: const TextStyle(fontSize: 50, fontWeight: FontWeight.bold)),
            Image(image: AssetImage('assets/images/${widget.location.pngname}.jpg')),
            Text('Lighting: ${widget.location.lighting}',
                style: const TextStyle(fontSize: 30,)),
            Text('FoodAccess: ${widget.location.foodAccess}',
                style: const TextStyle(fontSize: 30,)),
            Text('Collaboration: ${widget.location.collaboration}',
                style: const TextStyle(fontSize: 30,)),
            Text('Noise: ${widget.location.noise}',
                style: const TextStyle(fontSize: 30,)),
            Text('Comfort: ${widget.location.comfort}',
                style: const TextStyle(fontSize: 30,)),
            Text('Crowdedness: ${widget.location.crowdedness}',
                style: const TextStyle(fontSize: 30,)),

            ElevatedButton(
              child: Text('Rate ${widget.location.name}'),
              onPressed: () {
                Navigator.push (context, MaterialPageRoute(builder: (context) => RatingScreen(locations: widget.locations, myLocation: widget.location)));
              },
            ),

            ElevatedButton(
              child: const Text('Back'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}