import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:wondersl/pages/welcome_page.dart.dart';
import 'firebase_options.dart'; // Import Firebase Core

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // Ensure that Flutter is initialized
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } catch (e) {
    print('Firebase initialization error: $e'); // Print the error message
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WonderSL',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: const MaterialColor(0xFF008FA0, {
          50: Color(0xFFE0F2F3),
          100: Color(0xFFB3E2E5),
          200: Color(0xFF80CFD1),
          300: Color(0xFF4DBBBD),
          400: Color(0xFF26ACA8),
          500: Color(0xFF008FA0), // This is your primary color
          600: Color(0xFF008099),
          700: Color(0xFF00718B),
          800: Color(0xFF00637E),
          900: Color(0xFF004C65),
        }),
        // textTheme: GoogleFonts.mulishTextTheme(
        //   Theme.of(context).textTheme,
        // ),
      ),
      home: const WelcomePage(),
    );
  }
}
