import 'package:flutter/material.dart';
import 'package:movies_app/core/api/api_manager.dart';

import 'my_app.dart';

void main() {
  ApiManager.init();
  runApp(const MyApp());
}
