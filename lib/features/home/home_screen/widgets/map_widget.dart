import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

import 'package:prj/map/app_lat_long.dart';
import 'package:prj/map/location_service.dart';


class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final mapControllerCompleter = Completer<YandexMapController>();
  late final YandexMapController _mapController;

  @override
  void initState() {
    super.initState();
    _initPermission().ignore();
  }

  @override
  void dispose() {
    _mapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        YandexMap(
          logoAlignment :const MapAlignment(horizontal: HorizontalAlignment.center, vertical: VerticalAlignment.top),
          //mapObjects: _getPlacemarkObjects(context),
          rotateGesturesEnabled: false,
          tiltGesturesEnabled: false,
          onMapCreated: (controller) async {
            _mapController = controller;
            _fetchCurrentLocation();
          },
        ),
        Align(
          alignment: const Alignment(0.85, 0.6),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16)
            ),
            child:  IconButton(
              color: Colors.grey,
              onPressed: () async {
                await _fetchCurrentLocation();
              },
              icon: const Icon(Icons.navigation_outlined), iconSize:  MediaQuery.of(context).size.width * 0.08),
          )
        )
      ],
    );
  }

  /// Проверка разрешений на доступ к геопозиции пользователя
  Future<void> _initPermission() async {
    if (!await LocationService().checkPermission()) {
      await LocationService().requestPermission();
    }
    await _fetchCurrentLocation();
  }

  /// Получение текущей геопозиции пользователя
  Future<void> _fetchCurrentLocation() async {
    MapPoint location;
    const defLocation = MoscowLocation();
    try {
      location = await LocationService().getCurrentLocation();
    } catch (_) {
      location = defLocation;
    }
    _moveToCurrentLocation(location);
  }

  /// Метод для показа текущей позиции
  Future<void> _moveToCurrentLocation(MapPoint appLatLong) async {
    await _mapController.moveCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(            
          target : Point(
            latitude: appLatLong.lat,
            longitude: appLatLong.long,
          ),
          zoom: 13,
        ),
      ),
      animation: const MapAnimation(
        type: MapAnimationType.smooth,
        duration: 1
      )
    );
  }

  /// Метод для генерации точек на карте
  // List<MapPoint> _getMapPoints() {
  // return const [
  //   MapPoint(name: 'Чгу-Г', latitude: 56.14594588, longitude: 47.22423157),
  //   MapPoint(name: 'Парк Амазония', latitude: 56.14553259, longitude: 47.21056531)
  // ];
  // }

  /// Метод для генерации объектов маркеров для отображения на карте
//   List<PlacemarkMapObject> _getPlacemarkObjects(BuildContext context) {
//   return _getMapPoints()
//       .map(
//         (point) => PlacemarkMapObject(
//           onTap: (_, __) => showModalBottomSheet(
//            context: context,
//            builder: (context) => _ModalBodyView(
//              point: point,
//            ),
//           ),
//           mapId: MapObjectId('MapObject $point'),
//           point: Point(latitude: point.latitude, longitude: point.longitude),
//           opacity: 1,
//           isDraggable: false,
//           icon: PlacemarkIcon.single(
//             PlacemarkIconStyle(
//               image: BitmapDescriptor.fromAssetImage(
//                 'lib/assets/icons/placemark_icon.png',
//               ),
//               scale: 0.2,
//             ),
//           ),
//         ),
//       )
//       .toList();
//   }
// }

/// Содержимое модального окна с информацией о точке на карте
// class _ModalBodyView extends StatelessWidget {
//  const _ModalBodyView({required this.point});

//  final MapPoint point;

//  @override
//  Widget build(BuildContext context) {
//    return Padding(
//      padding: const EdgeInsets.symmetric(vertical: 40),
//      child: Column(mainAxisSize: MainAxisSize.min, children: [
//        Text(point.name, style: const TextStyle(fontSize: 20)),
//        const SizedBox(height: 20),
//        Text(
//          '${point.latitude}, ${point.longitude}',
//          style: const TextStyle(
//            fontSize: 16,
//            color: Colors.grey,
//          ),
//        ),
//      ]),
//    );
//  }
// }
}