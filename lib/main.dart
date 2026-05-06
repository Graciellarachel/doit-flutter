// lib/main.dart
// file pertama yang dijalankan Flutter waktu app dibuka
// tugasnya: daftarin semua halaman dan jalanin app

import 'package:flutter/material.dart';
import 'screens/login_screen.dart'; // halaman login
import 'screens/forgot_password_screen.dart'; // halaman lupa password
import 'screens/dashboard_screen.dart'; // halaman dashboard

void main() {
  // runApp = jalanin app, MyApp adalah widget utamanya
  runApp(const MyApp());
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

      // routes = daftar semua halaman di app
      // kayak daftar isi buku — '/' login, '/forgot-password' lupa password, dll
      routes: {
        // halaman login — halaman pertama
        '/': (context) => Center(
          child: SizedBox(
            width: 390, // lebar HP
            height: 844, // tinggi HP
            // ClipRect biar konten ga keluar dari kotak HP
            child: ClipRect(child: const LoginScreen()),
          ),
        ),

        // halaman lupa password
        // muncul waktu user klik "Lupa Password?" di login
        '/forgot-password': (context) => Center(
          child: SizedBox(
            width: 390,
            height: 844,
            child: ClipRect(child: const ForgotPasswordScreen()),
          ),
        ),

        // halaman dashboard
        // muncul waktu login berhasil
        // nama 'Grace' dikirim dari login screen lewat arguments
        '/dashboard': (context) => Center(
          child: SizedBox(
            width: 390,
            height: 844,
            child: ClipRect(child: const DashboardScreen()),
          ),
        ),
      },
    );
  }
}
