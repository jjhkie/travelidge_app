import 'package:flutter/material.dart';

import 'main.dart';
import 'package:flavor/flavor.dart';

void main() {
  Flavor.create(
    Environment.dev,
    color: Colors.green,
    name: 'PREVIEW',
    properties: {
      Keys.apiUrl: 'http://118.67.131.249',
      Keys.apiKey: 'jksdhfkjhs83rjkh324kj23h4',
      logLevelKey: 100,
    },
  );
  setupApp();
}