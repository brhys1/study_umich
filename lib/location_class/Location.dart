
class Location {
  late String name;
  late String pngname;
  late double latitude;
  late double longitude;
  late double noise;
  late double comfort;
  late String lighting;
  late String collaboration;
  late double crowdedness;
  late bool foodAccess;

  Location({
    this.name = "ideahub",
    this.pngname = "ideahub",
    this.latitude = 0,
    this.longitude = 0,
    this.noise = 0,
    this.comfort = 0,
    this.crowdedness = 0,
    this.lighting = "",
    this.collaboration = "",
    this.foodAccess = false,
  });
}