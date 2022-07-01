import 'package:flutter/material.dart';
import 'package:travelidge/app_config.dart';
import 'package:travelidge/main.dart';

void main() {
  var configuredApp = AppConfig(
    appName: 'Build flavors PROD',
    flavorName: 'prod',
    apiBaseUrl: 'http://118.67.131.249',
    child: FlavorApp(),
  );
  runApp(configuredApp);
}
