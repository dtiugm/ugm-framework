# 7.4 Metode HTTP

## 7.4.1 GET

Metode GET digunakan untuk mengambil data dari server. Pada API, GET biasanya digunakan untuk mengambil daftar resource atau detail resource tertentu. Contoh penggunaan:

1. `GET /api/v1/products` untuk mengambil daftar produk.
2. `GET /api/v1/products/{id}` untuk mengambil informasi produk berdasarkan ID.

## 7.4.2 POST

Metode POST digunakan untuk membuat data baru di server. POST biasanya digunakan ketika pengguna mengirimkan data untuk disimpan pada database. 

Contohnya:`POST /api/v1/products` untuk membuat produk baru.


## 7.4.3 PUT/PATCH

PUT digunakan untuk memperbarui resource secara keseluruhan, sementara PATCH digunakan untuk pembaruan parsial. Keduanya berguna untuk mengubah data yang sudah ada di server. Contoh penggunaannya sebagai berikut:

1. `PUT /api/v1/products/{id}` untuk memperbarui data produk sepenuhnya.
2. `PATCH /api/v1/products/{id}` untuk memperbarui sebagian informasi produk.

## 7.4.4 DELETE

DELETE digunakan untuk menghapus resource dari server. 

Misalnya: `DELETE /api/v1/products/{id}` untuk menghapus produk berdasarkan ID.