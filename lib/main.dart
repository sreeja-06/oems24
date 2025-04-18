import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'routes/app_routes.dart';

void main() {
  runApp(SreejaOEMSApp());
}

class SreejaOEMSApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Sreeja OEMS24',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        textTheme: GoogleFonts.robotoTextTheme(),
      ),
      initialRoute: '/',
      getPages: AppRoutes.routes,
    );
  }
}


