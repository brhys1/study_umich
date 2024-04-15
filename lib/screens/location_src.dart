import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:umich_study/location_class/location_outline.dart';
import 'package:umich_study/location_class/Location.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key, required this.location});

  final Location location;

  @override
  State<LocationScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<LocationScreen> {

  @override
  Widget build(BuildContext context) {
    var pngname = widget.location.pngname;

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Text('Screen Two'),/*
            FractionallySizedBox(
              alignment: Alignment.center,
              widthFactor: .9,
              heightFactor: .3,
              child: Image.asset('assets/images/ideahub.jpg'),
            ),*/
          ],
        ),
      ),
    );
  }
}