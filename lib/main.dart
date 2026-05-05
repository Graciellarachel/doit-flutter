import 'package:flutter/material.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Doit',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFFF6B00)),
        useMaterial3: true,
      ),
      // diCenterin + SizedBox diatur biar tampilannya kayak ukuran HP
      home: Center(
        child: SizedBox(
          width: 390, // lebar iPhone
          height: 844, // tinggi iPhone
          child: ClipRect(child: const LoginScreen()),
        ),
      ),
    );
  }
}
