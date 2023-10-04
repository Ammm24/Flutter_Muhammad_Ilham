# Assets, Dialog Bottom Sheet & Navigation #

## Assets ##
### Apa itu assets ? ###
aset adalah file yang dibundel dan diterapkan dengan aplikasi, dan dapat diakses pada waktu proses. Jenis aset yang umum mencakup data statis (misalnya, file JSON), file konfigurasi, ikon, dan gambar (JPEG, WebP, GIF, animasi WebP / GIF, PNG, BMP, dan WBMP).

Aset Flutter dapat disimpan di dalam folder assets di root proyek. Untuk menambahkan aset ke proyek Flutter, Anda dapat menambahkan file ke folder assets atau menambahkannya ke file pubspec.yaml.

Menambahkan aset ke folder assets

Untuk menambahkan aset ke folder assets, cukup pindahkan file ke folder tersebut. Misalnya, untuk menambahkan gambar myimage.png, Anda dapat memindahkan file tersebut ke folder assets.

Menambahkan aset ke file pubspec.yaml

Untuk menambahkan aset ke file pubspec.yaml, tambahkan entri assets ke file tersebut. Misalnya, untuk menambahkan gambar myimage.png, Anda dapat menambahkan entri berikut ke file pubspec.yaml:
` assets:
  - assets/myimage.png `

Menampilkan aset di aplikasi Flutter

Setelah menambahkan aset ke proyek Flutter, Anda dapat menampilkannya di aplikasi Anda menggunakan widget Image. Misalnya, untuk menampilkan gambar myimage.png, Anda dapat menggunakan kode berikut:

Dart
` Image(
  image: AssetImage('assets/myimage.png'),
) `

Jenis-jenis aset Flutter

Aset Flutter dapat dibagi menjadi beberapa jenis, yaitu:

- Gambar
- Suara
- Font
- Video
- Data statis
- File konfigurasi
