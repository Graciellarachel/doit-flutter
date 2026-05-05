// lib/widgets/task_card.dart
// widget buat nampilin satu kartu tugas di dashboard
// dipisah ke file sendiri biar kode dashboard ga panjang banget
// nanti di dashboard, widget ini dipanggil berulang sebanyak jumlah tugas

import 'package:flutter/material.dart';

// import TaskModel karena TaskCard butuh data tugas dari model
// tanpa ini Flutter ga tau TaskModel itu apa dan bakal error
import '../models/task_model.dart';

// StatelessWidget dipilih karena widget ini cuma nampilin data
// dia ga perlu nyimpen state apapun, tugasnya cuma display doang
// kalau ada yang perlu berubah misal tap untuk toggle, baru pakai StatefulWidget
class TaskCard extends StatelessWidget {
  // task adalah data yang "dikirim" dari dashboard ke sini
  // final karena begitu datanya masuk, ga akan berubah lagi
  final TaskModel task;

  // constructor — cara Flutter bikin satu TaskCard
  // required artinya siapapun yang mau pakai TaskCard wajib kasih data task-nya
  // kalau ga dikasih, Flutter langsung error sebelum app jalan
  const TaskCard({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    // warna orange disimpen di variable biar gampang diganti nanti
    // kalau mau ganti warna, cukup ubah di sini aja, ga perlu cari satu-satu
    const orangeColor = Color(0xFFFF6B00);

    // statusIcon dan statusColor ditentuin dari nilai isDone
    // ini namanya ternary operator — cara singkat nulis if-else
    // format: kondisi ? kalau true : kalau false
    // kalau isDone true  → icon centang hijau
    // kalau isDone false → icon lingkaran kosong abu-abu
    final statusIcon = task.isDone
        ? Icons.check_circle
        : Icons.radio_button_unchecked;
    final statusColor = task.isDone ? Colors.green : Colors.grey;

    // Card adalah widget yang udah punya styling bawaan
    // elevation = ketebalan bayangan di bawah card
    // semakin besar nilainya, semakin tebal bayangannya
    return Card(
      elevation: 3,

      // shape untuk bikin sudut card jadi melengkung
      // BorderRadius.circular(12) = semua sudut melengkung 12 pixel
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),

      // margin = jarak card sama widget di luarnya
      // horizontal = kiri kanan, vertical = atas bawah
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),

      child: Padding(
        // padding = jarak konten di dalam card sama tepi card-nya
        // bedanya sama margin — margin ke luar, padding ke dalam
        padding: const EdgeInsets.all(14),

        // Row karena isi card disusun horizontal
        // icon di kiri, teks di kanan
        child: Row(
          // crossAxisAlignment start = icon dan teks rata atas
          // kalau ga ditambah, icon bakal nempel di tengah secara vertikal
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // icon status tugas di paling kiri
            // Padding top 2 biar iconnya ga terlalu nempel di atas
            Padding(
              padding: const EdgeInsets.only(top: 2),
              child: Icon(statusIcon, color: statusColor, size: 26),
            ),

            // SizedBox = widget kosong khusus buat kasih jarak
            // width 12 = jarak 12 pixel antara icon dan teks
            const SizedBox(width: 12),

            // Expanded supaya kolom teks ngisi sisa ruang yang ada
            // tanpa Expanded, teksnya bisa meluber keluar layar
            // bayangin Expanded kayak "isi sisanya" setelah icon dapat tempat
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // judul tugas — paling besar dan agak bold
                  // task.title = ngambil data title dari TaskModel
                  // w600 = semi bold, lebih halus dari bold penuh
                  Text(
                    task.title,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 3),

                  // nama mata kuliah — lebih kecil dan abu-abu
                  // grey[500] = abu-abu medium biar keliatan beda sama judul
                  Text(
                    task.subject,
                    style: TextStyle(fontSize: 12, color: Colors.grey[500]),
                  ),
                  const SizedBox(height: 6),

                  // deadline pakai Row karena ada icon + teks sejajar
                  // warna orange biar keliatan dan konsisten sama tema app
                  Row(
                    children: [
                      // icon jam kecil di sebelah kiri teks deadline
                      // access_time lebih cocok buat deadline daripada kalender
                      const Icon(
                        Icons.access_time_rounded,
                        size: 13,
                        color: orangeColor,
                      ),
                      const SizedBox(width: 4),

                      // teks deadline
                      // task.deadline = ngambil data deadline dari TaskModel
                      Text(
                        task.deadline,
                        style: const TextStyle(
                          fontSize: 11,
                          color: orangeColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
