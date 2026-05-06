// lib/screens/dashboard_screen.dart
// halaman ini muncul setelah login berhasil
// isinya: sambutan, ringkasan tugas, dan daftar tugas

import 'package:flutter/material.dart';
import '../models/task_model.dart'; // butuh ini buat data tugas
import '../widgets/task_card.dart'; // butuh ini buat tampilan kartu

// StatefulWidget karena ada dialog logout
class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  // List = kumpulan data tugas
  // isDone ga ditulis = otomatis false (belum selesai)
  // isDone: true = sudah selesai
  final List<TaskModel> _tasks = [
    TaskModel(
      id: '1',
      title: 'Buat laporan praktikum',
      subject: 'Mobile Programming',
      deadline: '10 Juni 2025',
    ),
    TaskModel(
      id: '2',
      title: 'Kerjain tugas matematika',
      subject: 'Kalkulus',
      deadline: '8 Juni 2025',
      isDone: true,
    ),
    TaskModel(
      id: '3',
      title: 'Belajar buat UTS',
      subject: 'Basis Data',
      deadline: '12 Juni 2025',
    ),
    TaskModel(
      id: '4',
      title: 'Submit tugas essay',
      subject: 'Bahasa Indonesia',
      deadline: '9 Juni 2025',
      isDone: true,
    ),
    TaskModel(
      id: '5',
      title: 'Ngerjain kuis online',
      subject: 'Jaringan Komputer',
      deadline: '7 Juni 2025',
    ),
    TaskModel(
      id: '6',
      title: 'Diskusi kelompok PPT',
      subject: 'RPL',
      deadline: '11 Juni 2025',
    ),
    TaskModel(
      id: '7',
      title: 'Upload tugas ke LMS',
      subject: 'Semua Matkul',
      deadline: '6 Juni 2025',
      isDone: true,
    ),
    TaskModel(
      id: '8',
      title: 'Revisi proposal skripsi',
      subject: 'Skripsi',
      deadline: '13 Juni 2025',
    ),
    TaskModel(
      id: '9',
      title: 'Baca modul pertemuan 6',
      subject: 'Mobile Programming',
      deadline: '14 Juni 2025',
    ),
    TaskModel(
      id: '10',
      title: 'Konsultasi sama dosen PA',
      subject: 'Akademik',
      deadline: '15 Juni 2025',
    ),
  ];

  // fungsi logout — munculin dialog tanya dulu sebelum keluar
  void _handleLogout() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Logout'),
        content: const Text('Yakin mau keluar?'),
        actions: [
          // batal — tutup dialog
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Batal'),
          ),

          // logout — balik ke login
          // pushNamedAndRemoveUntil = hapus semua halaman di stack
          // jadi user ga bisa back ke dashboard setelah logout
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFFF6B00),
              foregroundColor: Colors.white,
            ),
            child: const Text('Logout'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // ambil nama 'Grace' yang dikirim dari login screen
    // kalau ga ada, defaultnya 'User'
    final String userName =
        ModalRoute.of(context)?.settings.arguments as String? ?? 'User';

    // where = filter — hitung tugas yang selesai dan yang belum
    final int selesai = _tasks.where((t) => t.isDone).length;
    final int pending = _tasks.where((t) => !t.isDone).length;

    return Scaffold(
      // appBar dengan tombol logout di kanan atas
      appBar: AppBar(
        title: const Text('Doit'),
        backgroundColor: const Color(0xFFFF6B00),
        foregroundColor: Colors.white,
        automaticallyImplyLeading: false, // ilangin tombol back
        actions: [
          IconButton(icon: const Icon(Icons.logout), onPressed: _handleLogout),
        ],
      ),

      body: Column(
        children: [
          // header orange — sambutan + 3 kotak ringkasan
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            color: const Color(0xFFFF6B00),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // sambutan pakai nama dari login
                Text(
                  'Hai, $userName! 👋',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Ini tugas-tugas kamu hari ini',
                  style: TextStyle(color: Colors.white70),
                ),
                const SizedBox(height: 16),

                // 3 kotak ringkasan sejajar
                Row(
                  children: [
                    _kotakRingkasan('Total', '${_tasks.length}'),
                    const SizedBox(width: 12),
                    _kotakRingkasan('Selesai', '$selesai'),
                    const SizedBox(width: 12),
                    _kotakRingkasan('Pending', '$pending'),
                  ],
                ),
              ],
            ),
          ),

          // judul daftar tugas
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Daftar Tugas',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),

          // ListView.builder — nampilin tugas satu per satu
          // bedanya sama ListView biasa: cuma render yang keliatan di layar
          // jadi lebih hemat memori kalau datanya banyak
          Expanded(
            child: ListView.builder(
              itemCount: _tasks.length, // jumlah item
              itemBuilder: (context, index) {
                // dipanggil berulang sebanyak jumlah tugas
                return TaskCard(task: _tasks[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  // fungsi buat bikin kotak ringkasan
  // dipisah biar kode di atas lebih pendek
  Widget _kotakRingkasan(String label, String nilai) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white24,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            Text(
              nilai,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              label,
              style: const TextStyle(color: Colors.white70, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
