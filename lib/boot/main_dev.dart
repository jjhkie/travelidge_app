import 'package:flavor/flavor.dart';
import 'package:flutter/material.dart';
import 'package:travelidge/main.dart';

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