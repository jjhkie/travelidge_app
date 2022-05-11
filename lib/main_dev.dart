import 'package:flutter/material.dart';
import 'package:flavor/flavor.dart';
import 'package:travelidge/screens/nav/bottom_navi.dart';

void main() {
  Flavor.create(
    Environment.dev,
    color: Colors.green,
    name: 'PREVIEW',
    properties: {
      Keys.apiUrl: 'http://118.67.131.249',
    },
  );
  setupApp();
}