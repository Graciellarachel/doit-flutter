// lib/utils/validators.dart
// file ini tugasnya satu aja:
// ngecek apakah email dan password yang diketik user itu bener atau ngga

class Validators {
  // === VALIDASI EMAIL ===
  // Fungsi ini dipanggil otomatis sama Flutter tiap user selesai ngetik email
  // kalau fungsi ini return null → berarti emailnya valid, aman!
  // kalau return kalimat → kalimat itu yang muncul sebagai pesan error
  static String? validateEmail(String? value) {
    // cek dulu, jangan sampe kosong
    if (value == null || value.isEmpty) {
      return 'Email tidak boleh kosong';
    }

    // regex itu kayak "aturan pola" — emailnya harus ada @, ada titik, dll
    // kalau ga sesuai pola → berarti bukan email yang bener
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return 'Format email tidak valid';
    }

    // kalau sampai sini berarti emailnya lolos semua pengecekan
    return null; // null = valid
  }

  // === VALIDASI PASSWORD ===
  // sama kayak email, fungsi ini ngecek password yang diketik user
  static String? validatePassword(String? value) {
    // gaboleh kosong
    if (value == null || value.isEmpty) {
      return 'Password tidak boleh kosong';
    }

    // password harus minimal 8 karakter
    // value.length itu ngitung panjang teks yang diketik
    if (value.length < 8) {
      return 'Password minimal 8 karakter';
    }

    // harus ada hurufnya — pure angka kayak "12345678" ga boleh
    // RegExp(r'[a-zA-Z]') artinya "cari huruf apapun dari a sampai z"
    if (!value.contains(RegExp(r'[a-zA-Z]'))) {
      return 'Password harus mengandung huruf';
    }

    // harus ada angkanya juga — pure huruf kayak "abcdefgh" juga ga boleh
    // RegExp(r'[0-9]') artinya "cari angka apapun dari 0 sampai 9"
    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'Password harus mengandung angka';
    }

    // kalau sampai sini berarti passwordnya kuat dan valid
    return null; // null = valid
  }
}
