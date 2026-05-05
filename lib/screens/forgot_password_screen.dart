// lib/screens/forgot_password_screen.dart
// halaman ini muncul waktu user klik "Lupa Password?" di login

import 'package:flutter/material.dart';
import '../utils/validators.dart'; // butuh ini buat validasi email

// StatefulWidget karena ada tombol yang berubah jadi loading
class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  // remote control buat form — dipake buat cek email valid atau ngga
  final _formKey = GlobalKey<FormState>();

  // alat baca email yang diketik user
  final _emailController = TextEditingController();

  // state loading — true waktu lagi nunggu, false waktu selesai
  bool _isLoading = false;

  // wajib dispose waktu halaman ditutup biar ga memory leak
  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  // fungsi ini jalan waktu tombol "Kirim Link Reset" ditekan
  Future<void> _kirimReset() async {
    // cek email dulu — kalau ga valid langsung berhenti
    if (!_formKey.currentState!.validate()) return;

    // ubah loading jadi true — tombol berubah jadi spinner
    setState(() => _isLoading = true);

    // pura-pura nunggu server 2 detik
    // async = fungsi ini bisa nunggu
    // await = tunggu proses ini selesai dulu baru lanjut
    await Future.delayed(const Duration(seconds: 2));

    // loading selesai — tombol balik normal
    setState(() => _isLoading = false);

    // tampilin notif di bawah layar
    // mounted dicek dulu biar ga error kalau user udah pindah halaman
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Link reset sudah dikirim!'),
          backgroundColor: Color(0xFFFF6B00),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar otomatis ada tombol back di kiri atas
      appBar: AppBar(
        title: const Text('Lupa Password'),
        backgroundColor: const Color(0xFFFF6B00),
        foregroundColor: Colors.white,
      ),

      body: Padding(
        padding: const EdgeInsets.all(24), // jarak konten dari tepi layar
        child: Form(
          key: _formKey, // sambungin formKey ke Form ini
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 24), // jarak kosong
              // judul halaman
              const Text(
                'Reset Password',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),

              // deskripsi singkat
              const Text(
                'Masukkan email kamu',
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 24),

              // field email — pakai validator dari validators.dart
              TextFormField(
                controller: _emailController,
                keyboardType:
                    TextInputType.emailAddress, // keyboard otomatis mode email
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email_outlined),
                ),
                // validator dipanggil otomatis waktu validate() dijalankan
                validator: Validators.validateEmail,
              ),
              const SizedBox(height: 24),

              // tombol kirim
              // kalau loading → null = tombol dimatiin
              // kalau ga loading → jalanin fungsi _kirimReset
              ElevatedButton(
                onPressed: _isLoading ? null : _kirimReset,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFF6B00),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                // isi tombol berubah tergantung _isLoading
                child: _isLoading
                    ? const CircularProgressIndicator(
                        color: Colors.white,
                      ) // spinner
                    : const Text('Kirim Link Reset'), // teks biasa
              ),
              const SizedBox(height: 12),

              // tombol kembali ke login
              // Navigator.pop = balik ke halaman sebelumnya
              // kebalikan dari Navigator.push yang maju ke halaman baru
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text(
                  'Kembali ke Login',
                  style: TextStyle(color: Color(0xFFFF6B00)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
