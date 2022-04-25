import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapSample extends StatefulWidget {
  late final String title;

  @override
  _MapSampleState createState() => _MapSampleState();
}

class _MapSampleState extends State<MapSample> {
  //Completer<GoogleMapController> _controller = Completer();
  //지도를 이동하기 위한 컨트롤러
  late GoogleMapController _controller;

  // 초기 카메라 위치
  final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.3580664, -122.655962),
    zoom: 14.4746,
  );

  final List<Marker> markers = [];

  addMarker(cordinate) {
    int id = Random().nextInt(100);

    setState((){
      markers
      .add(Marker(position:cordinate, markerId: MarkerId(id.toString())));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _kGooglePlex, // 초기 카메라 위치
        onMapCreated: (controller) {
          setState((){
            _controller = controller;
          });
        },
        markers: markers.toSet(),

        onTap: (cordinate){
          _controller.animateCamera(CameraUpdate.newLatLng(cordinate));
          addMarker(cordinate);
        },
      ),
    );
  }
}
