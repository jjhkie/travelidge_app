
import 'package:flavor/flavor.dart';
import 'package:flutter/material.dart';

import 'main.dart';
// void main() async {
//   FlavorConfig(
//       flavor: Flavor.production,
//       values : FlavorValues(baseUrl:"")
//   );
//   runApp(initializeApp());
// }

//main() => Environment.newInstance(BuildType.prod).run();

void main() {
  Flavor.create(
    Environment.production,
    properties: {
      Keys.apiUrl: 'https://api.company.com',
      Keys.apiKey: 'lksdhjfkjhdsf8sdfjkhsdf896',
      logLevelKey: 5,
    },
  );
  setupApp();
}