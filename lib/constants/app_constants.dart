import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;

// Optional: override at build/run time with --dart-define=API_BASE_URL=http://<host>:<port>/api
const String _envApiBaseUrl = String.fromEnvironment('API_BASE_URL');

class AppConstants {
  static const String appName = 'Espaço Geek';
  // Compute API endpoint per platform to avoid using localhost on emulators/devices
  static String get apiEndpoint {
    if (_envApiBaseUrl.isNotEmpty) return _envApiBaseUrl;

    if (kIsWeb) {
      final scheme = Uri.base.scheme.isEmpty ? 'http' : Uri.base.scheme;
      final host = Uri.base.host.isEmpty ? 'localhost' : Uri.base.host;
      // Always target backend on 8080 when running on web
      return '$scheme://$host:8080/api';
    }
    if (Platform.isAndroid) {
      // Android emulator maps host machine to 10.0.2.2
      return 'http://10.0.2.2:8080/api';
    }
    // iOS simulator/macOS/desktop: localhost points to host
    return 'http://localhost:8080/api';
  }
}
