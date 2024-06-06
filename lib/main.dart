import 'package:flutter/material.dart';
import 'package:hadis_application/application/app.dart';

void main() async {
  //db initialize
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const HadithApp());
}
