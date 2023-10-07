# Assets, Dialog Bottom Sheet & Navigation #

## Assets ##
### Apa itu assets ? ###
aset adalah file yang dibundel dan diterapkan dengan aplikasi, dan dapat diakses pada waktu proses. Jenis aset yang umum mencakup data statis (misalnya, file JSON), file konfigurasi, ikon, dan gambar (JPEG, WebP, GIF, animasi WebP / GIF, PNG, BMP, dan WBMP).

Aset Flutter dapat disimpan di dalam folder assets di root proyek. Untuk menambahkan aset ke proyek Flutter, Anda dapat menambahkan file ke folder assets atau menambahkannya ke file pubspec.yaml.

Menambahkan aset ke folder assets

Untuk menambahkan aset ke folder assets, cukup pindahkan file ke folder tersebut. Misalnya, untuk menambahkan gambar myimage.png, Anda dapat memindahkan file tersebut ke folder assets.

Menambahkan aset ke file pubspec.yaml

Untuk menambahkan aset ke file pubspec.yaml, tambahkan entri assets ke file tersebut. Misalnya, untuk menambahkan gambar myimage.png, Anda dapat menambahkan entri berikut ke file pubspec.yaml:
``` javascript
 assets:
  - assets/myimage.png
```

Menampilkan aset di aplikasi Flutter

Setelah menambahkan aset ke proyek Flutter, Anda dapat menampilkannya di aplikasi Anda menggunakan widget Image. Misalnya, untuk menampilkan gambar myimage.png, Anda dapat menggunakan kode berikut:

Dart

```javascript
 Image(
  image: AssetImage('assets/myimage.png'),
)
```

Jenis-jenis aset Flutter

Aset Flutter dapat dibagi menjadi beberapa jenis, yaitu:

- Gambar
- Suara
- Font
- Video
- Data statis
- File konfigurasi


## Buttom Sheets
### Apa itu Dialog Bottom Sheets ?? ###
Dialog bottom sheets pada Flutter adalah sebuah dialog yang ditampilkan di bagian bawah layar. Dialog ini bersifat modal, artinya dialog ini akan menutup semua tampilan lain di layar saat ditampilkan.

Dialog bottom sheets dapat digunakan untuk berbagai keperluan, seperti:
- Menampilkan menu
- Menampilkan dialog pilihan
- Menampilkan informasi
- Menerima input dari penggun

Dialog bottom sheets pada Flutter adalah sebuah dialog yang ditampilkan di bagian bawah layar. Dialog ini bersifat modal, artinya dialog ini akan menutup semua tampilan lain di layar saat ditampilkan.

Dialog bottom sheets dapat digunakan untuk berbagai keperluan, seperti:

- Menampilkan menu
- Menampilkan dialog pilihan
- Menampilkan informasi
- Menerima input dari pengguna

Cara menggunakan dialog bottom sheets

Untuk menggunakan dialog bottom sheets pada Flutter, Anda dapat menggunakan widget showModalBottomSheet(). Widget ini menerima beberapa parameter, yaitu:

- context: konteks dari widget yang memanggil dialog
- builder: fungsi yang digunakan untuk membangun widget dialog
- isScrollControlled: apakah dialog dapat digeser
- animation: animasi yang digunakan saat dialog ditampilkan
- transitionAnimation: animasi yang digunakan saat dialog ditransisi

## Navigation ## 
### Apa itu Navigation ###

Navigasi pada Flutter adalah proses berpindah dari satu halaman ke halaman lainnya dalam aplikasi. Halaman-halaman ini disebut sebagai "route".

Navigasi pada Flutter menggunakan widget Navigator. Widget ini menyediakan berbagai metode untuk berpindah antar route, seperti push(), pop(), pushReplacement(), dan pushAndRemoveUntil().

- Metode push()
Metode push() digunakan untuk berpindah ke route baru dan menambahkannya ke tumpukan route. Tumpukan route adalah daftar route yang sedang aktif dalam aplikasi.
- Metode pop()
Metode pop() digunakan untuk kembali ke route sebelumnya di tumpukan route.
- Metode pushReplacement()
Metode pushReplacement() digunakan untuk berpindah ke route baru dan menghapus route sebelumnya di tumpukan route.
- Metode pushAndRemoveUntil()
Metode pushAndRemoveUntil() digunakan untuk berpindah ke route baru dan menghapus semua route di tumpukan route sampai route yang memenuhi kondisi tercapai.
