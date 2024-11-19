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

# Tugas 9

### 1. **Mengapa Perlu Membuat Model untuk Pengambilan atau Pengiriman Data JSON? Apakah Akan Terjadi Error Jika Tidak Membuat Model Terlebih Dahulu?**

**Pentingnya Membuat Model:**
- **Struktur Data yang Konsisten:** Model di Django mendefinisikan struktur data yang konsisten dan terstandarisasi. Ini memastikan bahwa data yang dikirim dan diterima sesuai dengan format yang diharapkan.
- **Validasi Data:** Model menyediakan mekanisme validasi otomatis untuk memastikan bahwa data yang dimasukkan memenuhi kriteria tertentu, seperti tipe data, panjang maksimum, dan aturan validasi lainnya.
- **Interaksi dengan Database:** Model berfungsi sebagai representasi tabel dalam database, memungkinkan interaksi yang efisien antara aplikasi dan database menggunakan ORM (Object-Relational Mapping).
- **Serialisasi dan Deserialisasi:** Ketika bekerja dengan JSON, model memudahkan proses serialisasi (mengubah objek menjadi format JSON) dan deserialisasi (mengubah JSON menjadi objek), memastikan data yang dipertukarkan antara frontend dan backend konsisten.

**Konsekuensi Jika Tidak Membuat Model:**
- **Ketidaksesuaian Data:** Tanpa model, sulit untuk memastikan bahwa data yang dikirim atau diterima memiliki struktur yang benar, yang dapat menyebabkan ketidaksesuaian dan error.
- **Validasi yang Tidak Konsisten:** Tanpa model, validasi data harus dilakukan secara manual, meningkatkan risiko kesalahan dan data yang tidak valid masuk ke sistem.
- **Integrasi Database yang Sulit:** Tanpa model, interaksi dengan database menjadi lebih rumit dan rentan terhadap error karena tidak ada lapisan abstraksi yang mengelola komunikasi dengan database.
- **Error pada Pengiriman/Pengambilan Data:** Jika model tidak dibuat atau tidak sesuai, saat mencoba mengirim atau mengambil data JSON, kemungkinan besar akan terjadi error seperti `TypeError`, `ValueError`, atau `IntegrityError` karena data tidak sesuai dengan ekspektasi backend.

### 2. **Fungsi dari Library `http` yang Diimplementasikan pada Tugas Ini**

Library `http` di Flutter digunakan untuk melakukan komunikasi jaringan dengan backend, dalam hal ini Django API. Fungsi utamanya meliputi:

- **Mengirim Permintaan HTTP:** `http` memungkinkan aplikasi Flutter untuk mengirim berbagai jenis permintaan HTTP seperti GET, POST, PUT, DELETE ke server.
- **Mengelola Respon dari Server:** Setelah mengirim permintaan, library ini juga menangani respon yang diterima dari server, termasuk status kode, header, dan isi data.
- **Mendukung Multipart Requests:** Dalam tugas ini, `http.MultipartRequest` digunakan untuk mengirim data multipart/form-data, yang diperlukan untuk mengunggah file seperti gambar NFT.


### 3. **Fungsi dari `CookieRequest` dan Mengapa Instance `CookieRequest` Perlu Dibagikan ke Semua Komponen di Aplikasi Flutter**

**Fungsi `CookieRequest`:**
- **Manajemen Cookie Otomatis:** `CookieRequest` menangani pengelolaan cookie secara otomatis, termasuk penyimpanan dan pengiriman cookie pada setiap request yang relevan.
- **Autentikasi Berbasis Cookie:** Dalam konteks autentikasi Django yang menggunakan sesi berbasis cookie, `CookieRequest` memastikan bahwa sesi pengguna terjaga dan diotorisasi dengan benar pada setiap interaksi dengan backend.
- **Penyederhanaan Permintaan HTTP:** Dengan `CookieRequest`, pengembang tidak perlu secara manual mengelola header `Cookie` pada setiap permintaan HTTP, karena library ini menangani hal tersebut secara otomatis.

**Mengapa Instance `CookieRequest` Perlu Dibagikan ke Semua Komponen:**
- **Konsistensi Sesi:** Dengan membagikan satu instance `CookieRequest` ke seluruh komponen aplikasi, memastikan bahwa semua permintaan HTTP menggunakan sesi yang sama, menjaga konsistensi autentikasi dan otorisasi.
- **Efisiensi Pengelolaan Sesi:** Menggunakan satu instance mencegah duplikasi cookie dan potensi konflik sesi yang bisa terjadi jika setiap komponen memiliki instance sendiri.

Dengan demikian, `CookieRequest` memainkan peran penting dalam menjaga keamanan dan konsistensi autentikasi di seluruh aplikasi Flutter.

### 4. **Mekanisme Pengiriman Data Mulai dari Input hingga Dapat Ditampilkan pada Flutter**
**Langkah-Langkah Mekanisme Pengiriman Data:**
1. **Input Data oleh Pengguna:**
   - Pengguna mengisi formulir di aplikasi Flutter, memasukkan informasi seperti nama NFT, harga, deskripsi, creator, dan memilih gambar dari perangkat.
2. **Validasi Formulir:**
   - Flutter melakukan validasi input untuk memastikan bahwa semua bidang terisi dengan benar dan sesuai dengan kriteria yang ditentukan (misalnya, harga harus angka positif).
3. **Pengolahan Data:**
   - Setelah validasi berhasil, data yang diinput oleh pengguna disimpan ke dalam variabel state di aplikasi Flutter.
   - Gambar yang dipilih diubah menjadi format base64 untuk dikirimkan sebagai bagian dari payload JSON.

4. **Pengiriman Data ke Backend:**
   - Aplikasi Flutter menggunakan library `http` dan `CookieRequest` untuk membuat permintaan POST ke endpoint Django (`/create-nft-flutter/`).
   - Data dikemas dalam format JSON, termasuk gambar dalam bentuk base64, dan dikirimkan melalui permintaan HTTP.
   - Tetapi di implementasi sekarang, data gambar tidak diunggah ke server, hanya path dari gambar yang dipilih.

5. **Proses di Backend Django:**
   - Django menerima permintaan POST, memeriksa autentikasi pengguna melalui cookie.
   - Data JSON diparsing, dan path gambar diubah kembali ke format gambar yang dapat disimpan di server.
   - Django membuat instance model `NFT` baru dengan data yang diterima dan menyimpan gambar ke direktori yang ditentukan.

6. **Respon dari Backend:**
   - Django mengirimkan respon JSON yang menandakan keberhasilan atau kegagalan pembuatan NFT.
   - Jika berhasil, respon berisi status sukses; jika gagal, berisi pesan error.

7. **Pemrosesan Respon di Flutter:**
   - Aplikasi Flutter menerima respon dari backend.
   - Jika respon sukses, aplikasi menampilkan snackbar atau dialog yang menginformasikan bahwa NFT telah berhasil disimpan, dan mungkin menampilkan detail NFT.
   - Jika terjadi error, aplikasi menampilkan pesan error kepada pengguna.

8. **Menampilkan Data di Flutter:**
   - Data yang berhasil dikirim dan disimpan di backend dapat diambil kembali melalui permintaan GET atau langsung ditampilkan berdasarkan respon yang diterima.
   - Aplikasi Flutter memperbarui UI sesuai dengan status terbaru, seperti mereset formulir atau menampilkan NFT baru dalam daftar.

### 5. **Mekanisme Autentikasi dari Login, Register, hingga Logout**

**Proses Autentikasi Lengkap:**
1. **Registrasi Pengguna:**
   - **Input Data Akun:**
     - Pengguna mengisi formulir registrasi di aplikasi Flutter dengan data seperti username, email, dan password.
   - **Pengiriman Data ke Backend:**
     - Data dikirimkan melalui permintaan POST ke endpoint Django registrasi (misalnya, `/register/`).
   - **Proses di Backend Django:**
     - Django menerima data, melakukan validasi (memeriksa keunikan username/email, kekuatan password, dll.).
     - Jika valid, Django membuat user baru dalam database dan mengirimkan respon sukses.
   - **Respon ke Flutter:**
     - Aplikasi Flutter menerima respon dan menampilkan pesan sukses atau error sesuai dengan hasil registrasi.

2. **Login Pengguna:**
   - **Input Data Login:**
     - Pengguna mengisi formulir login di aplikasi Flutter dengan username/email dan password.
   - **Pengiriman Data ke Backend:**
     - Data dikirimkan melalui permintaan POST ke endpoint Django login (misalnya, `/login/`).
   - **Proses di Backend Django:**
     - Django memeriksa kredensial, dan jika valid, mengatur sesi pengguna dengan cookie.
     - Respon dikirimkan kembali ke Flutter, menandakan status login.
   - **Respon ke Flutter:**
     - Aplikasi Flutter menerima respon, menyimpan status autentikasi melalui `CookieRequest`, dan mengarahkan pengguna ke menu utama atau halaman yang diinginkan.

3. **Akses Menu dan Fitur Terproteksi:**
   - **Penggunaan `CookieRequest`:**
     - Setiap permintaan ke endpoint terproteksi menggunakan `CookieRequest` yang menyertakan cookie sesi pengguna.
   - **Verifikasi Sesi:**
     - Backend Django memverifikasi sesi pengguna berdasarkan cookie untuk mengizinkan atau menolak akses ke fitur tertentu.

4. **Logout Pengguna:**
   - **Permintaan Logout:**
     - Pengguna memilih opsi logout di aplikasi Flutter.
   - **Pengiriman Permintaan ke Backend:**
     - Aplikasi Flutter mengirimkan permintaan POST ke endpoint Django logout (misalnya, `/logout/`).
   - **Proses di Backend Django:**
     - Django menghapus sesi pengguna dan menghapus cookie autentikasi.
     - Respon dikirimkan kembali ke Flutter menandakan bahwa pengguna telah berhasil logout.
   - **Respon ke Flutter:**
     - Aplikasi Flutter menerima respon dan mengarahkan pengguna kembali ke halaman login atau halaman awal, serta menghapus status autentikasi lokal.

## Implementasi Checklist
### Implementasi Login dan Register
1. Menambahkan view dan URL untuk register dan login di Django.
```python

@csrf_exempt
def login(request):
    username = request.POST['username']
    password = request.POST['password']
    user = authenticate(username=username, password=password)
    if user is not None:
....    

@csrf_exempt
def register(request):
    if request.method == 'POST':
        data = json.loads(request.body)
        username = data['username']
        password1 = data['password1']
        password2 = data['password2']
... 
```
```python
path('auth/login/', views.login),
path('auth/register/', views.register),
```
2. Membuaat page yang bersangkutan di Flutter dengan StatefulWidget dan Form.
3. Membuat form sesuai dengan attribute yang dibutuhkan.
4. Memanggil API 
```dart
final response = await request
  .login("http://127.0.0.1:8000/auth/login/", {
  'username': username,
  'password': password,
  });
....
final response = await request.postJson(
  "http://127.0.0.1:8000/auth/register/",
  jsonEncode({
    "username": username,
    "password1": password1,
    "password2": password2,
  }));

```
5. Menampilkan pesan error atau sukses sesuai dengan respon yang diterima.

### Implementasi Logout
1. Menambahkan view dan URL untuk logout di Django.
```python
@csrf_exempt
def logout(request):
  username = request.user.username
  try:
      auth_logout(request)
      return JsonResponse({
          "username": username,
          "status": True,
          "message": "Logout berhasil!"
      }, status=200)
  except:
      return JsonResponse({
      "status": False,
      "message": "Logout gagal."
      }, status=401)
```
```python
path('auth/logout/', views.logout),
```

2. Membuat button logout di Flutter yang memanggil API logout.
```dart
const SizedBox(height: 20),
  SizedBox(
    width: double.infinity,
    child: ElevatedButton.icon(
      onPressed: () async {
        final response = await request
            .logout("http://127.0.0.1:8000/auth/logout/");
        String message = response["message"];
        if (context.mounted) {
          if (response['status']) {
            String uname = response["username"];
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("$message Sampai jumpa, $uname."),
            ));
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => const LoginPage()),
  ......
```
3. Menampilkan pesan sukses atau error sesuai dengan respon yang diterima.

### Implementasi form untuk NFT
1. Membuat model NFT
Saya menggunakan quicktype.io untuk mengenerate model NFT dalam dart dari JSON yang diterima dari API Django.

2. Membuat view dan URL untuk membuat NFT di Django.
```python
@csrf_exempt
@login_required
def create_nft_flutter(request):
    if request.method == "POST":
        data = json.loads(request.body)
        image_path = data['image_path']
        image = Image.open(image_path)
        
        # Save the image to the media directory
        image_name = os.path.basename(image_path)
        media_path = f"media/nfts/{image_name}"
        image.save(media_path)
        print(media_path)
        media_path = media_path.replace("media/", "")
        new_nft = NFT.objects.create(
            user=request.user,
            name=data["name"],
            price=data["price"],
            description=data["description"],
            image=media_path,
            creator=data["creator"]
        )

        new_nft.save()

        return JsonResponse({"status": "success"}, status=200)
    else:
        return JsonResponse({"status": "error"}, status=401)
```

4. Membuat form di flutter
## **Implementasi Variabel:**
Variabel-variabel ini didefinisikan sebagai bagian dari state dalam `StatefulWidget` sehingga dapat diperbarui secara dinamis berdasarkan input pengguna.

```dart
class _NftEntryFormPageState extends State<NftEntryFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _name = "";
  double _price = 0.0;
  String _description = "";
  String _creator = "";
  String _imagePath = "";
  }
```
## **Mengirimkan Data ke API**
Setelah variabel-variabel dibuat dan pengguna mengisi formulir, langkah selanjutnya adalah mengirimkan data tersebut ke backend Django menggunakan metode POST. Kita akan menggunakan instance CookieRequest dari library pbp_django_auth untuk mengelola autentikasi dan pengiriman data.
1. Langkah-langkah Pengiriman Data:
Validasi Formulir: Sebelum mengirim data, pastikan bahwa semua input telah divalidasi dan memenuhi kriteria yang ditetapkan.
```dart
if (!_formKey.currentState!.validate()) {
  _showSnackbar("Silakan perbaiki kesalahan di formulir.",
      backgroundColor: Colors.red);
  return;
}
```
2. Menyimpan Data Formulir: Setelah validasi berhasil, simpan data yang diinput oleh pengguna ke dalam variabel yang telah didefinisikan.
3. Menyiapkan Payload JSON: Kumpulkan semua data yang akan dikirimkan dalam format JSON.
```dart
Map<String, dynamic> payload = {
  'name': _name,
  'price': _price,
  'description': _description,
  'creator': _creator,
  'image_path': _imagePath, // Pastikan backend dapat mengakses path ini
};
```
4. Mengirim Permintaan POST: Gunakan CookieRequest untuk mengirimkan permintaan POST ke endpoint Django yang telah dibuat.
```dart
final response = await request.postJson(
  "http://127.0.0.1:8000/create-nft-flutter",
  jsonEncode(payload),
);
```