# State Managment Provider #
### Apa itu State Managment Provider ###
State management adalah proses mengelola state dari aplikasi. State adalah data yang berubah selama aplikasi berjalan.

Provider adalah sebuah state management package untuk Flutter yang menggunakan pendekatan dependency injection. Package ini memungkinkan Anda untuk mengelola state dari aplikasi dengan cara yang mudah dan terorganisir.

Cara kerja Provider

Provider bekerja dengan cara memberikan data ke widget yang membutuhkannya. Data ini disimpan dalam sebuah class yang disebut Model. Model ini mengimplementasikan interface ChangeNotifier.

Untuk menggunakan Provider, Anda perlu membuat sebuah Model yang mengimplementasikan interface ChangeNotifier. Model ini akan menyimpan data yang ingin Anda kelola.

Setelah membuat Model, Anda dapat menggunakan widget Provider untuk memberikan data dari Model ke widget yang membutuhkannya. Widget Provider menerima dua parameter, yaitu:

- child: widget yang akan menerima data dari Model.
- builder: fungsi yang digunakan untuk membangun widget Provider.

Fungsi builder akan mengembalikan widget yang akan ditampilkan. Fungsi ini juga akan menerima konteks context dan value. Context adalah informasi tentang widget yang memanggil Provider. Value adalah data dari Model.
