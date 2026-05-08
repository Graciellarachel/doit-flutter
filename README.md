# Doit 

App to-do list buat mahasiswa yang suka lupa tugas. Dibuat pake Flutter buat ujian praktikum Mobile Programming.

---

## Cerita Singkat

Jadi idenya simpel — daripada nulis tugas di notes HP yang berantakan, mending bikin app sendiri sekalian buat nilai praktikum 😄. Isinya ada halaman login, lupa password, sama dashboard yang nampilin daftar tugas.



## Fitur

**Login**
- Validasi email dan password sebelum bisa masuk
- Ada tombol show/hide password
- Muncul pesan error kalau salah isi

**Lupa Password**
- Input email buat minta link reset
- Ada efek loading waktu tombol ditekan

**Dashboard**
- Sapaan nama user yang login
- Ringkasan tugas — berapa yang selesai, berapa yang belum
- Daftar 10 tugas kuliah lengkap sama deadlinenya
- Bisa logout dengan konfirmasi dulu


## Cara Jalanin

bash
git clone https://github.com/Graciellarachel/doit-flutter.git
cd doit-flutter
flutter pub get
flutter run


Login pake:

Email    : grace@test.com
Password : Grace123




## Struktur Folder

```
lib/
├── main.dart                        → nyambungin semua halaman
├── models/
│   └── task_model.dart              → cetakan data tugas
├── screens/
│   ├── login_screen.dart            → halaman login
│   ├── forgot_password_screen.dart  → halaman lupa password
│   └── dashboard_screen.dart        → halaman dashboard
├── widgets/
│   └── task_card.dart               → tugas yang dipake berulang
└── utils/
    └── validators.dart              → ngecek email & password valid atau ngga


## Screenshot
Login : (screenshots/login.png) 

Forgot Pasword : (screenshots/forgot.png)

Dashboar : (screenshots/dashboard.png) 


## Info

Nama : Graciella Rachel Louisse Everaldya
NIM : 2401010662
Matkul : Mobile Programming 
Dosen : Ir. Ahmad Asroni, S.Kom., M.Kom. 