import 'app_lat_long.dart';

abstract class AppLocation {
  Future<MapPoint> getCurrentLocation();

  Future<bool> requestPermission();

  Future<bool> checkPermission();
}