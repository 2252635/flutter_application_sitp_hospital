import 'package:flutter/material.dart';
import 'src/routes/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: AppRoutes.dashboard,  // Set the initial route
      routes: AppRoutes.getRoutes(),
    );
  }
}