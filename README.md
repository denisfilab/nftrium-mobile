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


# Tugas 8
## Apa kegunaan const di Flutter? Jelaskan apa keuntungan ketika menggunakan const pada kode Flutter. Kapan sebaiknya kita menggunakan const, dan kapan sebaiknya tidak digunakan?
`const` pada Flutter digunakan untuk membuat widget atau nilai konstan,  artinya tidak akan berubah selama runtime. Keuntungan menggunakan `const` adalah:
- Meningkatkan performa aplikasi, karena widget yang menggunakan `const` hanya perlu build sekali dan tidak perlu build ulang ketika ada perubahan state.
Gunakan `const` pada widget atau nilai yang tidak berubah saat aplikasi berjalan, seperti teks atau gambar statis.
Jangan gunakan `const` pada widget yang akan sering berubah selama aplikasi berjalan, seperti widget yang bergantung pada suatu state

## Jelaskan dan bandingkan penggunaan Column dan Row pada Flutter. Berikan contoh implementasi dari masing-masing layout widget ini!
- **Column**: Menyusun widget dalam layout vertikal. Berguna untuk tampilan seperti daftar atau konten yang disusun ke bawah.
- **Row**: Menyusun widget dalam layout horizontal. Cocok untuk elemen yang perlu disusun dari kiri ke kanan, seperti menu horizontal.

**Contoh Implementasi Column:**
```dart
Column(
  children: [
    Text('Item 1'),
    Text('Item 2'),
    Text('Item 3'),
  ],
)
```
**Contoh Implementasi Row:** 
```dart
Row(
  children: [
    Icon(Icons.star),
    Text('Rating'),
  ],
)
```
## Sebutkan apa saja elemen input yang kamu gunakan pada halaman form yang kamu buat pada tugas kali ini. Apakah terdapat elemen input Flutter lain yang tidak kamu gunakan pada tugas ini? Jelaskan!
### Elemen Input yang Digunakan pada Halaman Form NFTrium
1. **TextFormField** untuk `Nama NFT`: 
   - Meminta input teks untuk nama NFT, dengan validasi agar tidak boleh kosong.

2. **TextFormField** untuk `Jumlah NFT`: 
   - Meminta input angka untuk jumlah NFT, dengan validasi untuk memastikan input berupa angka, tidak kosong, dan lebih dari 0.

3. **TextFormField** untuk `Deskripsi NFT`: 
   - Meminta input teks deskripsi NFT, dapat menampung beberapa baris dan divalidasi agar tidak kosong.

4. **ElevatedButton** sebagai tombol `Save`: 
   - Berfungsi untuk menyimpan data yang diisi di form.

### Elemen Input Flutter Lain yang Tidak Digunakan
Ya, ada beberapa elemen input Flutter lain yang tidak digunakan pada tugas ini, seperti:
- **DropdownButton**: Berguna untuk memilih satu opsi dari daftar pilihan.
- **Checkbox**: Cocok untuk input boolean (ya/tidak)

### Bagaimana cara kamu mengatur tema (theme) dalam aplikasi Flutter agar aplikasi yang dibuat konsisten? Apakah kamu mengimplementasikan tema pada aplikasi yang kamu buat?
Dalam aplikasi Flutter yang saya buat, saya mengatur tema dengan menggunakan warna utama purple, yaitu `Colors.purple`. Untuk menyesuaikan tingkat kepekatan warna ungu, saya menggunakan variasi intensitas, seperti `Colors.purple[300]` atau `Colors.purple[700]`

Saya juga menerapkan `Theme.of(context).colorScheme.secondary` sebagai warna sekunder.

Untuk teks, saya memastikan konsistensi ukuran dan ketebalan dengan mengatur `textTheme` menggunakan `GoogleFonts.poppinsTextTheme`. Berikut adalah contoh pengaturan untuk tema teks:

```dart
textTheme: GoogleFonts.poppinsTextTheme(
  Theme.of(context).textTheme,
),
```

### Bagaimana cara kamu menangani navigasi dalam aplikasi dengan banyak halaman pada Flutter?
Dalam aplikasi ini, saya menggunakan dua metode navigasi: `Navigator.push` dan `Navigator.pushReplacement`.
- **Navigator.push** digunakan untuk navigasi ke halaman formulir, yaitu `NftEntryFormPage`. Navigasi ini ditambahkan pada **Left Drawer** dan tombol dengan teks "Tambah NFT".
```dart
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => const NftEntryFormPage(),
    ),
  );
```

- **Navigator.pushReplacement** digunakan untuk navigasi kembali ke halaman utama, MyHomePage. Metode ini menggantikan halaman saat ini, jadi ketika pengguna kembali ke halaman utama, halaman formulir tidak lagi berada di stack navigation.

```dart
Navigator.pushReplacement(
  context,
  MaterialPageRoute(
    builder: (context) => const MyHomePage(),
  ),
);
```