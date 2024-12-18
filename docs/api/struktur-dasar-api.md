# 7.3 Struktur Dasar API

## 7.3.1 Prefix Produk

- Jika dalam satu domain terdapat lebih dari satu produk API, penggunaan prefix produk sangat dianjurkan. Hal ini bertujuan untuk menghindari kebingungan antara API yang berbeda. Prefix yang jelas memungkinkan pengembang dan pengguna API untuk membedakan endpoint-endpoint yang terkait dengan produk tertentu. Misalnya:
    - `/vnext/v1/staff`
    - `/vnext/v1/student`
    - `/datamart/v1/pegawai/`
    - `/aksi/v1/kkn/`
- Jika hanya ada satu produk dalam domain tersebut, Anda bisa menggunakan prefix standar seperti `/api/v1/`.

## 7.3.2 Versioning

- Penggunaan versioning dalam API adalah prinsip yang sangat penting, yang memungkinkan pengembang untuk merilis pembaruan tanpa mengganggu aplikasi yang sudah menggunakan versi API lama. Versi API biasanya tertera di awal endpoint, seperti `/api/v1/`. Ini memberikan fleksibilitas bagi pengembang untuk memperkenalkan fitur baru atau perbaikan tanpa memengaruhi pengguna yang telah menggunakan versi sebelumnya.

## 7.3.3 Endpoint Naming

- Penamaan endpoint API sebaiknya menggunakan kata benda (noun) dan dalam bentuk jamak (plural). Hal ini mengindikasikan bahwa endpoint tersebut mengelola koleksi data dan bukan tindakan. Penggunaan kata kerja dalam endpoint sebaiknya dihindari, karena HTTP methods (GET, POST, PUT, DELETE) sudah mengandung aksi tersebut. Misalnya:
    - `/api/v1/products` untuk koleksi produk.
    - `/api/v1/orders` untuk koleksi pesanan.