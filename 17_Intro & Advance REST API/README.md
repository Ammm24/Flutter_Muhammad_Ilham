# Advance RESTI API #
### Apa itu Advance RESTI API ### 
Advance REST API pada Flutter adalah fitur yang memungkinkan Anda untuk mengakses API REST yang lebih kompleks. API REST ini dapat berupa API yang menggunakan metode HTTP yang lebih kompleks, seperti PUT, PATCH, atau DELETE, atau API yang menggunakan parameter yang lebih kompleks, seperti parameter JSON atau parameter file.

Untuk menggunakan Advance REST API, Anda perlu menggunakan package http. Package ini menyediakan berbagai metode untuk mengakses API REST, seperti:

- get(): Mengakses data dari API REST menggunakan metode HTTP GET.
- post(): Mengakses data dari API REST menggunakan metode HTTP POST.
- put(): Mengakses data dari API REST menggunakan metode HTTP PUT.
- patch(): Mengakses data dari API REST menggunakan metode HTTP PATCH.
- delete(): Mengakses data dari API REST menggunakan metode HTTP DELETE.

Untuk mengakses API REST ini, kita menggunakan method get() dari package http. Method ini akan mengembalikan Future yang berisi data JSON dari API REST.

Setelah mendapatkan data JSON dari API REST, kita perlu mengonversinya menjadi model User. Model User ini akan menyimpan data pengguna, seperti nama.
