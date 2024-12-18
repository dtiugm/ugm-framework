# BAB 4 Konsistensi Teknologi

Dalam pengembangan sistem informasi di lingkungan UGM harus menggunakan teknologi yang konsisten untuk menghindari perbedaan teknologi yang digunakan. Ini akan mempermudah proses pengembangan dan perawatan sistem informasi. Berikut adalah teknologi yang direkomendasikan oleh DTI.

## 4.1 Framework dan Bahasa Pemrograman

### 4.1.1 Hypertext Preprocessor (PHP) 8

Saat ini pengembangan sistem informasi di lingkungan UGM menggunakan bahasa Hypertext Preprocessor atau PHP. Pengembangan sistem informasi wajib menggunakan PHP versi 8 atau versi stabil yang terbaru. Berikut beberapa framework yang bisa digunakan dan sudah support PHP 8.

1. CodeIgniter 3 versi ^3.13
   CodeIgniter 3 adalah framework yang paling banyak digunakan. Framework ini sangat direkomendasikan karena sudah banyak sistem informasi yang dikembangkan menggunakan framework ini di lingkungan UGM. Namun wajib diperhatikan harus menggunakan versi 3.13 yang sudah support PHP 8.
2. CodeIgniter 4 versi ^4.5
   CodeIgniter 4 masih sangat jarang digunakan di lingkungan UGM. Namun ini adalah pilihan terbaik ke dua karena masih mendekati CodeIgniter 3 dan sudah support PHP 8.
3. Laravel ^11
   Laravel 11 juga masih sangat jarang digunakan di lingkungan UGM. Untuk menggunakan framework ini silakan berkonsultasi lebih dulu ke DTI.

### 4.1.2 Python 3

DTI mulai menggunakan python dalam pengembangan sistem informasi. Python yang digunakan adalah Python versi 3. Bahasa python ini digunakan khusus untuk membuat API dan pengolahan data. Terdapat satu framework yang sangat direkomendasikan untuk mengembangkan API secara cepat dan efisien. Framework tersebut adalah FastAPI. FastAPI memiliki beberapa fitur unggulan dibanding framework lain, diantaranya:

1. Cepat performa sangat tinggi, setara dengan NodeJS dan Go.
2. Cepat dalam pengembangan.
3. Lebih sedikit bug.
4. Intuitif dengan dukungan editor yang baik, otomatisasi kode dimana-mana dan lebih sedikit waktu untuk debugging.
5. Mudah karena python adalah high-level language yang mendekati bahasa manusia.
6. Ringkas meminimalkan pengulangan kode.
7. Tangguh dengan menghasilkan kode siap produksi.
8. Berbasis standar pengembangan API misal OpenAPI
9. Otomatis bisa menggenerate dokumentasi API dalam bentuk swagger dan redoc.

### 4.1.3 Dart

DTI mulai menggunakan dart untuk membuat aplikasi yang berjalan di berbagai platform (multiplatform). Dart dipilih karena selain multiplatform, dart juga memiliki performa tinggi. Sintaks dart juga mirip dengan C-style (java atau javascript). Dengan menggunakan dart, dapat sekaligus mengembangkan aplikasi yang berjalan di mobile android, ios, website bahkan desktop. Terdapat satu framework yang sangat direkomendasikan DTI yaitu Flutter. Flutter adalah framework yang dirancang untuk membuat antarmuka pengguna yang indah dan cepat di berbagai platform dalam satu basis kode. Flutter memiliki beberapa kelebihan, diantaranya:

1. Pengembangan multiplatform dalam satu basis kode
2. Kinerja tinggi karena menggunakan mesin rendering sendiri dan dikompilasi ke kode asli.
3. Desain UI yang menarik dan konsisten.
4. Hot reload mempercepat pengembangan.
5. Ekosistem yang berkembang sehingga banyak pustaka dan support dari komunitas.

## 4.2 Database

Berikut beberapa database yang direkomendasikan DTI untuk pengembangan sistem informasi di lingkungan UGM.

### 4.2.1 MySQL 8

Database mysql adalah open-source sistem manajemen basisdata relasional (RDBMS) yang sangat direkomendasikan DTI. Saat ini pengembangan sistem di lingkungan UGM rata-rata masih menggunakan mysql. Karena itu database ini sangat mudah dipelajari dan sangat cepat untuk pembuatan database. Memang database mysql masih dibawah RDBMS lainnya seperti PostgreSQL. Namun dengan tunning yang baik, kemampuan mysql tidak bisa diragukan dan cukup untuk melayani kebutuhan sistem informasi di UGM. Oleh karena itu database mysql masih sangat direkomendasikan. Selain itu juga wajib menggunakan versi terbaru dari mysql.

### 4.2.2 MariaDB 11

Database mariadb adalah cabang sistem manajemen basis data relasional (RDBMS) MySQL yang dikembangkan oleh komunitas dan dipimpin oleh beberapa pengembang asli MySQL. Mariadb masih mirip seperti mysql karena mempertahankan kompatibilitas tinggi dengan MySQL. Karena mariadb masih mirip dengan mysql, maka dari itu mariadb juga database yang direkomendasikan untuk pengembangan sistem informasi di lingkungan UGM. Apabila akan menggunakannya, maka gunakan mariadb versi terbaru untuk mengembangkan sistem informasi di lingkungan UGM.

### 4.2.3 Elasticsearch 8

Elasticsearch adalah database untuk mesin pencarian dan analitik terdistribusi, penyimpanan data yang dapat diskalakan, serta basis data vektor yang dioptimalkan untuk kecepatan dan relevansi pada beban kerja skala produksi. Database ini biasanya digunakan untuk menyimpan kumpulan data besar dan kemudian digunakan untuk melakukan pencarian di data tersebut. Misal dalam sistem informasi yang dikembangkan memiliki jumlah data yang sangat besar dan terdapat fitur pencarian di dalamnya. Maka DTI merekomendasikan penggunaan elasticsearch yang mendampingi RDBMS sebelumnya. Penggunakan elasticsearch ini akan meningkatkan pengalaman pengguna dalam menggunakan sistem informasi. Karena kecepatan dalam melakukan pencarian, pengguna tidak akan menunggu lama ketika melakukan sebuah pencarian. Selain pencarian, elasticsearch juga direkomendasikan untuk penyimpanan log dari sistem informasi. Misal log error dan log akses disimpan di elasticsearch, ini akan memudahkan pengembang dan monitoring sistem dalam pencarian kesalahan sistem. Pastikan untuk menggunakan elasticsearch versi terbaru untuk pengembangan sistem informasi di lingkungan UGM.

### 4.2.4 Redis

Redis adalah basis data dalam memori yang tersimpan di dalam disk. Model datanya adalah kunci dan nilai. Redis memiliki banyak jenis nilai yang didukung seperti String, Lists, Sets, Sorted Sets, Hashes, Streams, Hyperlog Logs, Bitmaps. Redis sering difungsikan sebagai database penyimpanan sesi dan penyimpanan cache. Dengan menggunakan redis, maka sesi pengguna akan mudah disimpan dan diambil. Selain itu redis juga bisa difungsikan sebagai database cache. Jika sistem informasi menerapkan mekanisme cache data, maka ini akan mempengaruhi pengalaman pengguna dan mengurangi beban database. Data yang jarang berubah dan diakses oleh banyak user jika disimpan di redis sebagai cache akan sangat cepat diakses oleh pengguna. Hal ini akan meringankan database karena tidak perlu query berkali-kali ke database untuk data yang sama dan tentu akan meningkatkan pengalaman pengguna. Gunakan redis versi terbaru untuk pengembangan sistem informasi di lingkungan UGM.

## 4.3 Git Repository

Git repository adalah tempat untuk menyimpan dan mengelola kode sumber dalam pengembangan perangkat lunak. Di lingkungan UGM, sistem pengelolaan kode sumber dilakukan menggunakan GitLab Community Editio**n** yang dibedakan menjadi dua repository berdasarkan peruntukannya:

1. git.dev.ugm.ac.id

   Repository ini digunakan pada sistem yang dikembangkan oleh tim internal DTI. Semua proyek yang dikembangkan oleh tim internal, termasuk aplikasi dan sistem informasi yang berkaitan dengan kebutuhan UGM wajib menggunakan repository ini.

2. put.dev.ugm.ac.id

   Repository ini digunakan pada sistem yang dikembangkan oleh pihak luar atau vendor yang bekerja sama dengan DTI. Semua sistem yang melibatkan kolaborasi dengan pihak luar UGM wajib menggunakan repository ini.


Penggunaan GitLab Community Edition di lingkungan UGM bertujuan untuk memberikan kontrol yang lebih baik terhadap pengelolaan kode, serta memudahkan kolaborasi antar pengembang dan tim di UGM. Semua sistem yang dikembangkan di lingkungan UGM wajib menggunakan salah satu dari dua repository ini, untuk memastikan konsistensi, keamanan, dan integrasi yang baik antar proyek yang ada.

## 4.4 Docker Container

Docker adalah platform yang memungkinkan pengembang untuk membuat, mengirim, dan menjalankan aplikasi dalam container. Container adalah wadah yang mengisolasi aplikasi dari sistem operasi, memungkinkan aplikasi berjalan dengan konsisten di berbagai lingkungan. UGM saat ini beralih ke arsitektur berbasis container, yang memungkinkan pengelolaan aplikasi yang lebih efisien dan skalabel. Sistem baru yang dikembangkan di UGM sudah menggunakan pendekatan container-based.

## 4.5 API Gateway

API Gateway adalah lapisan yang bertindak sebagai titik masuk untuk semua permintaan API yang diterima oleh sistem. API Gateway mengelola dan mendistribusikan permintaan ke layanan-layanan yang sesuai di belakangnya. Di UGM, kami menggunakan Krakend sebagai API Gateway. Krakend adalah solusi API Gateway yang dirancang untuk menyediakan kecepatan tinggi dan pengelolaan API yang efisien. Dengan Krakend, UGM dapat mengelola banyak API dan layanan dengan mudah, serta meningkatkan performa dan keamanan aplikasi.

Krakend memiliki beberapa fitur utama:

1. Integrasi yang mudah dengan berbagai backend.
2. Skalabilitas tinggi yaitu mampu menangani beban lalu lintas yang besar.
3. Pengelolaan API dengan fitur seperti rate limiting, caching, dan monitoring.