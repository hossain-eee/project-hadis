import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hadis_application/application/state_holder_binder.dart';
import 'package:hadis_application/presentation/ui/screens/home_screen.dart';

class HadithApp extends StatelessWidget {
  const HadithApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: StatHolderBinder(),
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(255, 17, 140, 111),
        appBarTheme: const AppBarTheme(
          backgroundColor: /* const Color.fromARGB(255, 26, 164, 131), */
              Color.fromARGB(255, 17, 140, 111),
          // backgroundColor: Color(0xFF46B891),
          elevation: 0,
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 26, 164, 131),
          // seedColor: Colors.white,
          // seedColor: const Color(0xFF46B891)
        ),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
