class MapPoint {
 final double lat;
 final double long;

const MapPoint({
   required this.lat,
   required this.long,
 });
}

class NamedMapPoint extends MapPoint{
  final String name;

  const NamedMapPoint({
    required this.name,
    required super.lat, 
    required super.long,
  });
}

class MoscowLocation extends MapPoint {
 const MoscowLocation({
   super.lat = 55.7522200,
   super.long = 37.6155600,
 });
}