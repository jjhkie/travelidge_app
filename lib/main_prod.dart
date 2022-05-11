
import 'package:flavor/flavor.dart';
import 'package:travelidge/screens/nav/bottom_navi.dart';

void main() {
  Flavor.create(
    Environment.production,
    properties: {
      Keys.apiUrl: 'https://api.company.com',
    },
  );
  setupApp();
}