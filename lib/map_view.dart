
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Map"),
        ),
        body: FlutterMap(
          options: MapOptions(
              center: LatLng(35.681, 139.767),
              zoom: 14.0
          ),
          layers: [
            TileLayerOptions(
              urlTemplate: "https://api.maptiler.com/maps/jp-mierune-streets/{z}/{x}/{y}.png?key=[APIキーを記入]"
            ),
            CircleLayerOptions(
              circles: [
                /// 仮
                CircleMarker(
                  color: Colors.indigo.withOpacity(0.9),
                  radius: 10,
                  borderColor: Colors.white.withOpacity(0.9),
                  borderStrokeWidth: 3,
                  point: LatLng(35.681, 139.760),
                ),
                // サークルマーカー2設定
                CircleMarker(
                  color: Colors.teal.withOpacity(0.5),
                  radius: 15,
                  borderColor: Colors.white.withOpacity(0.5),
                  borderStrokeWidth: 5,
                  point: LatLng(35.675, 139.770),
                ),
                // サークルマーカー3設定
                CircleMarker(
                  color: Colors.yellow.withOpacity(0.7),
                  radius: 20,
                  borderColor: Colors.white.withOpacity(0.7),
                  borderStrokeWidth: 6,
                  point: LatLng(35.687, 139.775),
                ),
              ]
            )
          ],
        )
      );
  }

}