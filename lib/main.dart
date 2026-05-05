// lib/main.dart
// file pertama yang dijalankan Flutter waktu app dibuka
// tugasnya: daftarin semua halaman dan jalanin app

import 'package:flutter/material.dart';
import 'screens/login_screen.dart'; // import halaman login
import 'screens/forgot_password_screen.dart'; // import halaman lupa password

void main() {
  runApp(const MyApp()); // jalanin app
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Doit',
      debugShowCheckedModeBanner: false, // ilangin tulisan "debug" di pojok
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFFF6B00), // warna utama orange
        ),
        useMaterial3: true,
      ),

      // halaman pertama yang muncul waktu app dibuka
      initialRoute: '/',

      // daftar semua halaman — kayak daftar isi buku
      // '/' = login, '/forgot-password' = lupa password
      routes: {
        // halaman login
        // dibungkus Center + SizedBox biar tampilannya kayak ukuran HP
        '/': (context) => Center(
          child: SizedBox(
            width: 390, // lebar iPhone
            height: 844, // tinggi iPhone
            child: ClipRect(child: const LoginScreen()),
          ),
        ),

        // halaman lupa password
        // sama kayak login, dibungkus biar ukurannya HP juga
        '/forgot-password': (context) => Center(
          child: SizedBox(
            width: 390,
            height: 844,
            child: ClipRect(child: const ForgotPasswordScreen()),
          ),
        ),
      },
    );
  }
}
