# State Managment BLoC #
### Apa itu State Managment BLoC ###

State management adalah proses mengelola state dari aplikasi. State adalah data yang berubah selama aplikasi berjalan.

BLoC (Business Logic Component) adalah sebuah state management pattern untuk Flutter yang menggunakan pendekatan reactive programming. Pattern ini memungkinkan Anda untuk mengelola state dari aplikasi dengan cara yang mudah, terorganisir, dan efisien.

Cara kerja BLoC

BLoC bekerja dengan cara memisahkan logika bisnis dari UI. Logika bisnis disimpan dalam sebuah class yang disebut BLoC. Class ini akan menerima event dari UI dan menanggapi event tersebut dengan mengubah state-nya.

Untuk menggunakan BLoC, Anda perlu membuat sebuah BLoC yang mengimplementasikan interface Bloc. Bloc akan menyimpan state dan method untuk mengubah state.

Setelah membuat BLoC, Anda dapat menggunakan widget BlocBuilder untuk menampilkan data dari BLoC ke UI. Widget BlocBuilder menerima dua parameter, yaitu:
- bloc: BLoC yang akan digunakan untuk mendapatkan data.
- builder: fungsi yang digunakan untuk membangun widget BlocBuilder.

Fungsi builder akan mengembalikan widget yang akan ditampilkan. Fungsi ini juga akan menerima konteks context dan state. Context adalah informasi tentang widget yang memanggil BlocBuilder. State adalah data dari BLoC.
