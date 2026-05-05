// lib/models/task_model.dart
// untuk bagian taks model nih yg dmn setiap tugas yang muncul di dashboard punya struktur yang sama
// yaitu: id, judul, mata kuliah, deadline, dan status selesai/belum

class TaskModel {
  final String id; // nomor unik tiap tugas
  final String title; // judul tugasnya apa
  final String subject; // mata kuliah apa
  final String deadline; // kapan deadlinenya
  final bool isDone; // sudah selesai atau belum

  // ini namanya constructor : cara bikin satu buah tugas baru
  // required artinya wajib diisi, ga boleh dikosongkan
  TaskModel({
    required this.id,
    required this.title,
    required this.subject,
    required this.deadline,
    this.isDone = false, // kalau ga diisi, defaultnya belum selesai
  });
}
