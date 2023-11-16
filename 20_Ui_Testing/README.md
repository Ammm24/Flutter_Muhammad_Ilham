# Unit Testing Pada Flutter Tugas 11 #

## UI Testing ## 

### Apa Itu Unit testing / Ui Testing ?? ###


Unit testing adalah jenis testing yang berfokus pada pengujian unit terkecil dari sebuah aplikasi, seperti class atau function. Tujuan dari unit testing adalah untuk memastikan bahwa unit-unit tersebut bekerja dengan benar, terlepas dari unit-unit lainnya.

Pada Flutter, unit testing dapat dilakukan menggunakan framework bernama test. Framework ini menyediakan berbagai fitur yang memudahkan kita untuk menulis unit test, seperti:

- Mocking, yaitu fitur yang memungkinkan kita untuk membuat objek palsu yang dapat digunakan untuk menggantikan objek asli. Hal ini berguna untuk mengisolasi unit yang sedang diuji dari unit-unit lainnya.
- Expectations, yaitu fitur yang memungkinkan kita untuk menentukan hasil yang diharapkan dari unit yang sedang diuji.

Unit test ini menguji fungsi add() pada class MyClass. Fungsi ini menerima dua angka sebagai input dan mengembalikan hasil penjumlahannya. Unit test ini menggunakan fitur expectations untuk menentukan bahwa fungsi add() harus mengembalikan nilai 3 jika inputnya adalah 1 dan 2, dan nilai -3 jika inputnya adalah -1 dan -2.

Unit testing memiliki banyak manfaat, antara lain:
- Meningkatkan kualitas kode
- Membantu menemukan bug lebih awal
- Mempermudah pengembangan dan pemeliharaan aplikasi
- Meningkatkan produktivitas
