import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  Environment._(this.env);

  static Environment? _instance;

  static Environment get instance => _instance!;

  static initWithDotenv() async {
    await dotenv.load(fileName: '.env');
    _instance = Environment._(dotenv.env);
  }

  static initWithMap(Map<String, String> env) {
    _instance = Environment._(env);
  }

  bool get isIOS =>
      Platform.isIOS ||
      (kDebugMode && (env['DEBUG_ENABLE_ANDROID_KEYS'] == 'false'));
  final Map<String, String> env;

  String? get envPlaceApiKey => env['GOOGLE_PLACE_API_KEY'];
}
