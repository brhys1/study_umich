import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:umich_study/location_class/Location.dart';
import 'package:umich_study/screens/location_src.dart';

class FindScreen extends StatefulWidget {
  const FindScreen({super.key});


  @override
  State<FindScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<FindScreen> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              child: const Text('Submit'),
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