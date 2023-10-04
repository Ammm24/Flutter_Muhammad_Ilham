# Storage Pada Flutter #
### Apa itu storage pada flutter ###
Storage pada Flutter adalah fitur yang memungkinkan Anda untuk menyimpan data secara lokal di perangkat pengguna. Data ini dapat berupa data apa saja, seperti data pengguna, data aplikasi, atau data cache.

Flutter menyediakan beberapa jenis storage, yaitu:

- SharedPreferences: Penyimpanan key-value yang sederhana dan efisien.
- SQLite: Database relasional yang lebih kompleks dan kuat.
- File: Penyimpanan file yang dapat digunakan untuk menyimpan data apa saja.

### SharedPreferences ###
SharedPreferences adalah penyimpanan key-value yang sederhana dan efisien. Data yang disimpan dalam SharedPreferences disimpan dalam format JSON.

Untuk menggunakan SharedPreferences, Anda dapat menggunakan widget SharedPreferences. Widget ini menyediakan berbagai metode untuk membaca dan menulis data ke SharedPreferences, seperti:
- getString(): Membaca data string dari SharedPreferences.
- setString(): Menulis data string ke SharedPreferences.
- getInt(): Membaca data integer dari SharedPreferences.
- setInt(): Menulis data integer ke SharedPreferences.
- getBoolean(): Membaca data boolean dari SharedPreferences.
- setBoolean(): Menulis data boolean ke SharedPreferences.

### SQLite ###
SQLite adalah database relasional yang lebih kompleks dan kuat. Data yang disimpan dalam SQLite disimpan dalam format database.
Untuk menggunakan SQLite, Anda perlu membuat database dan tabel terlebih dahulu. Setelah itu, Anda dapat menggunakan widget Database untuk mengakses database.

### File ###
File adalah penyimpanan file yang dapat digunakan untuk menyimpan data apa saja. Data yang disimpan dalam file disimpan dalam format file.

Untuk menggunakan File, Anda dapat menggunakan widget File. Widget ini menyediakan berbagai metode untuk membaca dan menulis data ke file, seperti:
- readAsString(): Membaca data string dari file.
- writeAsString(): Menulis data string ke file.
- readAsBytes(): Membaca data byte dari file.
- writeAsBytes(): Menulis data byte ke file.
