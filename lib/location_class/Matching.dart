import 'package:umich_study/location_class/Location.dart';

class Matching {
  Location? l;
  List<Location>? ls;

  Matching (Location lIn, List<Location> lsIn) {
    l = lIn;
    ls = lsIn;
  }

  findMatch() {
    int counter = 0;
    if (l!.lighting != "any") {
      for (int i = 0; i < ls!.length; i++) {
        if (ls![i].lighting == l!.lighting) {
          Location current = ls![i];
          ls!.remove(ls![i]);
          ls!.insert(counter, current);
          counter++;
        }
      }
    }
    counter = 0;
    for (int i = 0; i < ls!.length; i++){
      if (ls![i].comfort <= l!.comfort + 1 && ls![i].comfort >= l!.comfort - 1){
        Location current = ls![i];
        ls!.remove(ls![i]);
        ls!.insert(counter, current);
        counter++;
      }
    }
    for (int i = 0; i < ls!.length; i++){
      if (ls![i].crowdedness <= l!.crowdedness + 1 && ls![i].crowdedness >= l!.crowdedness - 1){
        Location current = ls![i];
        ls!.remove(ls![i]);
        ls!.insert(counter, current);
        counter++;
      }
    }
    for (int i = 0; i < ls!.length; i++){
      if (ls![i].noise <= l!.noise + .5 && ls![i].noise >= l!.noise - .5){
        Location current = ls![i];
        ls!.remove(ls![i]);
        ls!.insert(counter, current);
        counter++;
      }
    }
    counter = 0;
    if (l!.collaboration != "any") {
      for (int i = 0; i < ls!.length; i++) {
        if (ls![i].collaboration == l!.collaboration) {
          Location current = ls![i];
          ls!.remove(ls![i]);
          ls!.insert(counter, current);
          counter++;
        }
      }
    }
    counter = 0;
    for (int i = 0; i < ls!.length; i++){
      if (ls![i].foodAccess == l!.foodAccess){
        Location current = ls![i];
        ls!.remove(ls![i]);
        ls!.insert(counter, current);
        counter++;
      }
    }
  }

}