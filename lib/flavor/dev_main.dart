import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:login_ui_aicycle_seta/network/network.dart';

void main() {
  FlavorConfig(variables: {
    "env": "dev",
    "mode": "collection",
    "appName": "AICycle Insurance Data",
    'url': NetworkConstants.devBaseUrl,
  });
  main();
}
