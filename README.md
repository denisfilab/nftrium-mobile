# README.md

# Tugas 7

## 1. Stateless Widget dan Stateful Widget

**Stateless Widget** adalah widget yang tidak menyimpan atau mengelola keadaan (state) internal. Mereka bersifat immutable, artinya ketika dibuat, mereka tidak dapat berubah. Contoh penggunaannya adalah widget yang menampilkan teks atau ikon yang statis dan tidak berubah selama siklus hidup aplikasi.

**Stateful Widget** adalah widget yang dapat mengelola keadaan internalnya dan dapat berubah selama siklus hidupnya. Mereka terdiri dari dua kelas: kelas widget itu sendiri dan kelas state yang menyimpan data yang dapat berubah. Contoh penggunaannya adalah widget yang membutuhkan interaksi pengguna, seperti formulir atau tombol yang dapat diklik.

**Perbedaan Utama:**
- **Stateless Widget** tidak memiliki state internal dan tidak dapat berubah setelah dibangun.
- **Stateful Widget** memiliki state internal yang dapat berubah, memungkinkan pembaruan tampilan berdasarkan perubahan tersebut.

## 2. Widget yang Digunakan dan Fungsinya

Beberapa widget yang digunakan dalam proyek ini beserta fungsinya adalah:

- **MaterialApp:** Widget utama yang menyediakan struktur dasar aplikasi dengan tema Material Design.
- **StatelessWidget dan StatefulWidget:** Digunakan untuk membangun UI yang statis maupun dinamis.
- **Scaffold:** Menyediakan struktur dasar layout seperti AppBar, body, dan lainnya.
- **AppBar:** Menampilkan bar atas dengan judul aplikasi.
- **Container:** Container untuk background gradient.
- **Center:** Menempatkan widget anak di tengah layar.
- **SingleChildScrollView:** Menambahkan scroll jika overflow
- **Column:** Menyusun widget secara vertikal (flex-col).
- **Icon:** Menampilkan icon.
- **SizedBox:** Memberikan spasi atau margin antar widget.
- **ElevatedButton.icon:** Membuat tombol dengan ikon dan label text.
- **Text:** Menampilkan text, disini saya menggunakan font Poppins.

## 3. Fungsi setState() dan Variabel yang Terpengaruh

**Fungsi setState():** Digunakan dalam `StatefulWidget` untuk memberi tahu Flutter bahwa ada perubahan dalam state yang memerlukan pembaruan UI. Ketika `setState()` dipanggil, Flutter akan membangun ulang widget dengan state terbaru untuk memperbarui tampilan.

**Variabel yang Terpengaruh:** Variabel yang berada dalam kelas state (misalnya, `_MyHomePageState`) yang mempengaruhi tampilan UI akan terdampak. Dalam kode di atas, meskipun tidak ada variabel state yang diubah, jika ada variabel seperti daftar NFT atau status login yang diubah, pemanggilan `setState()` akan memastikan UI diperbarui sesuai dengan perubahan tersebut.

## 4. Perbedaan antara const dan final
- **const:** Menandakan bahwa nilai sebuah variabel adalah konstan dan diketahui saat compile time. Nilai yang ditandai dengan `const` tidak dapat diubah.
```dart
  const pi = 3.14; 
```
- **final:** Menandakan bahwa variabel hanya dapat diinisialisasi sekali dan nilainya tidak dapat diubah setelah diinisialisasi. Namun, nilai `final` dapat ditentukan pada runtime.

```dart
    final currentTime = DateTime.now(); 
```

**Perbedaan Utama:**
- `const` digunakan untuk nilai yang benar-benar konstan dan diketahui sebelum aplikasi dijalankan.
- `final` digunakan untuk nilai yang hanya diinisialisasi sekali tetapi mungkin baru diketahui saat aplikasi berjalan.

## 5. Implementasi Checklist pada Kode

- **Tema dan Tipografi Konsisten:** Menggunakan `ThemeData` dengan `GoogleFonts.poppinsTextTheme` untuk memastikan konsistensi tipografi di seluruh aplikasi.

Untuk menggunakan font Poppins, saya menambahkan dependensi `google_fonts` di `pubspec.yaml` dan mengimport `google_fonts` di `main.dart`. Lalu saya run `flutter pub get` untuk menginstal dependensi tersebut.


- **AppBar** AppBar dibuat dengan judul 'NFTrium' yang menggunakan font Poppins Bold dengan styling text-center.

- **BAckground Gradient** `Container` dengan `BoxDecoration` gradient digunakan untuk memberikan background dengan efek gradient

- **Button** Menggunakan `ElevatedButton.icon` untuk membuat tombol yang memiliki icon dan label

- **SnackBar untuk Feedback:** Ketika tombol ditekan, `SnackBar` atau semacam toast ditampilkan untuk memberikan feedback

- **Scroll** `SingleChildScrollView` memastikan bahwa konten dapat discroll jika melebihi ukuran layar atau sama saja dengan memberikan styling overflow pada konten.


