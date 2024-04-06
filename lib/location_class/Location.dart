
class Location {
  final String name;
  final String pngname;
  final double latitude;
  final double longitude;
  final double noise;
  final double comfort;
  final String lighting;
  final double collaboration;
  final double crowdedness;
  final bool foodAccess;

  const Location({
    this.name = "ideahub",
    this.pngname = "ideahub",
    this.latitude = 0,
    this.longitude = 0,
    this.noise = 0,
    this.comfort = 0,
    this.lighting = "lighting",
    this.collaboration = 0,
    this.crowdedness = 0,
    this.foodAccess = true,
  });
}