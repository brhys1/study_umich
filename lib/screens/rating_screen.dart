import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:umich_study/location_class/Location.dart';
import 'package:umich_study/screens/home_screen.dart';
import 'package:umich_study/screens/location_src.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RatingScreen extends StatefulWidget {
  const RatingScreen({super.key, required this.locations, required this.myLocation});

  final List<Location> locations;
  final Location myLocation;

  @override
  State<RatingScreen> createState() => _MyHomePageState();
}

enum FoodAccess {yes, no}
enum Lighting {fluorescent, natural, warm, dark}
enum Collaboration {solo, smallGroup, bigGroup}


class _MyHomePageState extends State<RatingScreen> {

  Location l = Location();
  FoodAccess? foodAccess;
  Lighting? lighting;
  Collaboration? collaboration;

  final FirebaseFirestore firestore = FirebaseFirestore.instance;


  Future<bool> checkIfSpotExists(String spotName) async {
    try {
        DocumentSnapshot documentSnapshot = await firestore.collection(
            'Study_Spots').doc(spotName).get();
        if (documentSnapshot.exists) {
          print('Document exists');
          return true;
        }
        else {
          print('Document does not exist');
          return false;
        }
    }
    catch (e) {
      print('Error checking document existence: $e');
      return false;
    }
  }

  Future<void> writeReviewToDatabase() async {
    print('WRITING REVIEW TO DATABASE');
    bool spotExists = await checkIfSpotExists(l.name);

    if (spotExists) {
      await writeToExistingDocument();
    }
    else {
      await writeToNewDocument();
    }
  }

  Future<void> writeToNewDocument() async {
    firestore.collection('Study_Spots').doc(l.name).set({
      'Collaboration': [l.collaboration],
      'Comfort': [l.comfort],
      'Crowdedness': [l.crowdedness],
      'FoodAccess': [l.foodAccess],
      'Lighting': [l.lighting],
      'Noise': [l.noise],
    }).then((_) {
      print('Success adding TEST');
    }).catchError((error) {
      print('Error adding TEST: $error');
    });
  }

  Future<void> writeToExistingDocument() async {
    // Must read data for each document and then write back all data + new data
    DocumentReference docRef = firestore.collection('Study_Spots').doc(l.name);
    DocumentSnapshot docSnapshot = await docRef.get();

    // Read the current ratings array
    Map<String, dynamic> ratings = docSnapshot.data() as Map<String, dynamic>;

    // create new arrays to add new rating
    dynamic collaborationRatings = ratings['Collaboration'];
    collaborationRatings.add(l.collaboration);

    dynamic comfortRatings = ratings['Comfort'];
    comfortRatings.add(l.comfort);

    dynamic crowdednessRatings = ratings['Crowdedness'];
    crowdednessRatings.add(l.crowdedness);

    dynamic foodAccessRatings = ratings['FoodAccess'];
    foodAccessRatings.add(l.foodAccess);

    dynamic lightingRatings = ratings['Lighting'];
    lightingRatings.add(l.lighting);

    dynamic noiseRatings = ratings['Noise'];
    noiseRatings.add(l.noise);

    firestore.collection('Study_Spots').doc(l.name).set({
      'Collaboration': collaborationRatings,
      'Comfort': comfortRatings,
      'Crowdedness': crowdednessRatings,
      'FoodAccess': foodAccessRatings,
      'Lighting': lightingRatings,
      'Noise': noiseRatings,
    }).then((_) {
      print('Success adding TEST');
    }).catchError((error) {
      print('Error adding TEST: $error');
    });
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: ListView(
          children: [
            Text('Rating Screen for ${widget.myLocation.name}',
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const Text ('How crowded is the spot typically?'),
            RatingBar.builder(
                minRating: 0,
                maxRating: 5,
                itemSize: 30,
                itemCount: 5,
                itemBuilder: (context, _) =>
                const Icon(Icons.star, color: Colors.black),
                updateOnDrag: true,
                onRatingUpdate: (rating) =>
                    setState(() {
                      l.crowdedness = rating;
                    })
            ),
            const Text ('How would you rate the comfortability?'),
            RatingBar.builder(
                minRating: 0,
                maxRating: 5,
                itemSize: 30,
                itemCount: 5,
                itemBuilder: (context, _) =>
                const Icon(Icons.star, color: Colors.black),
                updateOnDrag: true,
                onRatingUpdate: (rating) =>
                    setState(() {
                      l.comfort = rating;
                    })
            ),
            const Text ('How would you rate the noise level?'),
            RatingBar.builder(
                minRating: 0,
                maxRating: 5,
                itemSize: 30,
                itemCount: 5,
                itemBuilder: (context, _) =>
                const Icon(Icons.star, color: Colors.black),
                updateOnDrag: true,
                onRatingUpdate: (rating) =>
                    setState(() {
                      l.noise = rating;
                    })
            ),
            const Text ("How big is a typical group working in this space?"),
            ListTile(
              title: const Text('Solo Work/Locking in'),
              leading: Radio<Collaboration>(
                visualDensity: VisualDensity.compact,
                value: Collaboration.solo,
                groupValue: collaboration,
                onChanged: (Collaboration? value) {
                  setState(() {
                    collaboration = value;
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('Small Group'),
              leading: Radio<Collaboration>(
                visualDensity: VisualDensity.compact,
                value: Collaboration.smallGroup,
                groupValue: collaboration,
                onChanged: (Collaboration? value) {
                  setState(() {
                    collaboration = value;
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('Big Group'),
              leading: Radio<Collaboration>(
                visualDensity: VisualDensity.compact,
                value: Collaboration.bigGroup,
                groupValue: collaboration,
                onChanged: (Collaboration? value) {
                  setState(() {
                    collaboration = value;
                  });
                },
              ),
            ),

            const Text ('Does this spot have access to food?'),
            ListTile(
              title: const Text('Yes'),
              leading: Radio<FoodAccess>(
                visualDensity: VisualDensity.compact,
                value: FoodAccess.yes,
                groupValue: foodAccess,
                onChanged: (FoodAccess? value) {
                  setState(() {
                    foodAccess = value;
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('No'),
              leading: Radio<FoodAccess>(
                visualDensity: VisualDensity.compact,
                value: FoodAccess.no,
                groupValue: foodAccess,
                onChanged: (FoodAccess? value) {
                  setState(() {
                    foodAccess = value;
                  });
                },
              ),
            ),
            const Text ('How would you describe its lighting?'),
            ListTile(
              title: const Text('Natural'),
              leading: Radio<Lighting>(
                visualDensity: VisualDensity.compact,
                value: Lighting.natural,
                groupValue: lighting,
                onChanged: (Lighting? value) {
                  setState(() {
                    lighting = value;
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('Warm'),
              leading: Radio<Lighting>(
                visualDensity: VisualDensity.compact,
                value: Lighting.warm,
                groupValue: lighting,
                onChanged: (Lighting? value) {
                  setState(() {
                    lighting = value;
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('Florescent'),
              leading: Radio<Lighting>(
                visualDensity: VisualDensity.compact,
                value: Lighting.fluorescent,
                groupValue: lighting,
                onChanged: (Lighting? value) {
                  setState(() {
                    lighting = value;
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('Dark'),
              leading: Radio<Lighting>(
                visualDensity: VisualDensity.compact,
                value: Lighting.dark,
                groupValue: lighting,
                onChanged: (Lighting? value) {
                  setState(() {
                    lighting = value;
                  });
                },
              ),
            ),
            ElevatedButton(
              child: const Text ('Submit'),
              onPressed:() {
                if (collaboration == Collaboration.solo) {l.collaboration = "solo"; }
                else if (collaboration == Collaboration.smallGroup) {l.collaboration = "smallGroup"; }
                else if (collaboration == Collaboration.bigGroup) {l.collaboration = "bigGroup"; }
                else {l.collaboration = ""; }

                if (foodAccess == FoodAccess.yes) {l.foodAccess = true; }
                else if (foodAccess == FoodAccess.no) {l.foodAccess = false; }
                else {l.foodAccess = false; }

                if (lighting == Lighting.natural) {l.lighting = "natural"; }
                else if (lighting == Lighting.warm) {l.lighting = "warm"; }
                else if (lighting == Lighting.fluorescent) {l.lighting = "fluorescent"; }
                else if (lighting == Lighting.dark) {l.lighting = "dark"; }
                else { l.lighting == ""; }

                writeReviewToDatabase();

                Navigator.of(context).pop();
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
