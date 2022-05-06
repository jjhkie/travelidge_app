import 'package:flutter/material.dart';

import 'nav/bottom_navi.dart';
import 'package:flavor/flavor.dart';

void main() {
  Flavor.create(
    Environment.dev,
    color: Colors.green,
    name: 'PREVIEW',
    properties: {
      Keys.apiUrl: 'http://118.67.131.249',
      Keys.apiKey: 'jksdhfkjhs83rjkh324kj23h4',
    },
  );
  setupApp();
}