
import 'package:flavor/flavor.dart';
import 'package:travelidge/main.dart';

void main() {
  Flavor.create(
    Environment.production,
    properties: {
      Keys.apiUrl: 'https://api.company.com',
    },
  );
  setupApp();
}