import 'package:flutter/material.dart';
import 'package:umich_study/location_class/Location.dart';

class LocationOutline extends StatelessWidget {
  const LocationOutline({Key? key}) :  super(key: key);

  @override
  Widget build(BuildContext context){
    Location studySpot = Location();

     return ElevatedButton (
        child: Text(studySpot.name),
        onPressed: () {

      },
    );
  }
}
