import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/splash_screen.dart';


void main() {
  runApp(TiledApp());
}

class TiledApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tiled',
      theme: ThemeData(
        primaryColor: Color(0xFF3A0CA3),
        textTheme: GoogleFonts.poppinsTextTheme(),
        scaffoldBackgroundColor: Color(0xFFF1F6F9),
      ),
      home: SplashScreen(), // Make sure this class is defined
    );
  }
}
