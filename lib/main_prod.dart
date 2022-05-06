
import 'package:flavor/flavor.dart';

import 'nav/bottom_navi.dart';

void main() {
  Flavor.create(
    Environment.production,
    properties: {
      Keys.apiUrl: 'https://api.company.com',
      Keys.apiKey: 'lksdhjfkjhdsf8sdfjkhsdf896',
    },
  );
  setupApp();
}