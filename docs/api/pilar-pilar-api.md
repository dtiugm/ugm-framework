# BAB 7 PEDOMAN API

API (Application Programming Interface) adalah elemen kunci dalam pengembangan sistem informasi modern. API memungkinkan aplikasi berkomunikasi dan bertukar data secara terstandar, sehingga menjadi komponen penting untuk menciptakan sistem yang terintegrasi, aman, dan handal. Pada Universitas Gadjah Mada (UGM), API berperan sebagai sarana untuk mewujudkan tata kelola sistem informasi modern melalui penerapan arsitektur berbasis layer yang mendukung skalabilitas.

UGM Framework menetapkan API sebagai penghubung antar layanan, beralih dari paradigma *full-stack* ke *layered architecture*. Pendekatan ini mendukung pemisahan tanggung jawab (*decoupling*) dan memudahkan perubahan sistem. Dengan disusunnya panduan ini, pengembang diharapkan dapat merancang API yang memenuhi standar kualitas perangkat lunak dan mendukung kebutuhan strategis UGM.

## 7.1 Pilar-Pilar Perancangan API

### 7.1.1 Implementasi REST dan JSON

REST (*Representational State Transfer*) adalah arsitektur API berbasis protokol HTTP. JSON (*JavaScript Object Notation*) adalah format data ringan yang digunakan secara luas pada API REST untuk pertukaran data. Kedua teknologi ini bersama-sama menyediakan solusi komunikasi yang sederhana, efisien, dan kompatibel lintas platform.

Berikut masing-masing keuntungan dari kedua arsitektur diatas.

### Keuntungan REST:

1. **Sederhana:** Menggunakan metode HTTP standar seperti GET, POST, PUT, DELETE.
2. **Stateless:** Setiap permintaan berisi semua informasi yang dibutuhkan.
3. **Skalabel:** Mendukung penskalaan horizontal dengan menambah atau mengurangi server.

### Keuntungan JSON:

1. **Ringan:** Format data lebih ringkas dibandingkan XML.
2. **Mudah Dibaca:** Struktur data yang sederhana dan intuitif.
3. **Kompatibel:** Didukung oleh berbagai bahasa pemrograman.

### 7.1.2 Kewajiban API Gateway dan Manajemen API

API Gateway berfungsi sebagai pintu gerbang terpusat untuk semua permintaan API, yang bertanggung jawab mengelola lalu lintas, autentikasi, dan keamanan. Manajemen API mengatur seluruh siklus hidup API mulai dari tahap pembuatan hingga pemantauan.

### Fungsi API Gateway:

1. **Routing:** Mengarahkan permintaan ke layanan yang tepat.
2. **Keamanan:** Mengelola autentikasi dan otorisasi.
3. **Pengendalian Lalu Lintas:** Menerapkan batasan permintaan untuk mencegah penyalahgunaan.

### Proses Manajemen API:

1. **Pembuatan:** Mendefinisikan endpoint dan metode API.
2. **Penerbitan:** Menyediakan API untuk penggunaan pengembang lain.
3. **Pemantauan:** Mengawasi kinerja API secara berkelanjutan.
4. **Pemeliharaan:** Menerapkan pembaruan dan perbaikan yang diperlukan.

### 7.1.3 Pemenuhan Kualitas Perangkat Lunak

Dalam perancangan sistem informasi yang baik empat pilar utama yang diperhatikan adalah:

### Keamanan

Keamanan merupakan aspek kritis dalam perancangan API. Beberapa praktik terbaik mencakup:

1. Penggunaan protokol HTTPS untuk enkripsi data dalam transfer.
2. Penerapan sistem autentikasi dan otorisasi yang kuat.
3. Penggunaan token untuk mengamankan sesi pengguna seperti token JWT (JSON Web Token).
4. Penggunaan Protokol OAuth 2.0 untuk memastikan endpoint yang memerlukan autentikasi hanya bisa diakses oleh pengguna yang telah terotentikasi.

### Skalabilitas

API harus mampu menangani peningkatan jumlah pengguna dan permintaan. Beberapa pendekatan yang efektif adalah:

1. Penerapan load balancing untuk distribusi lalu lintas yang efisien.
2. Penskalaan horizontal melalui penambahan atau pengurangan server sesuai kebutuhan.
3. Pemanfaatan sistem cache untuk mengurangi beban server.

### Ketersediaan

Ketersediaan API menjadi kunci untuk menjamin layanan yang berkelanjutan. Beberapa strategi penting sebagai berikut:

1. Replikasi data untuk menjamin ketersediaan saat terjadi kegagalan server.
2. Implementasi sistem failover untuk pengalihan lalu lintas ke server cadangan.
3. Penerapan sistem pemantauan untuk deteksi dan penanganan masalah secara dini.

### Kinerja

Kinerja API harus dioptimalkan untuk response yang cepat dan efisien. Adapun beberapa langkah optimasinya adalah:

1. Penerapan minifikasi dan kompresi data untuk transfer yang lebih cepat.
2. Optimasi kueri database untuk mempercepat pemrosesan.
3. Implementasi teknik caching untuk pengurangan beban server.

### 7.1.4 Penyelarasan dengan Microservices, SOA, dan Layered Architecture

Untuk memastikan keselarasan API dengan pengembangan berbasis microservices, Service-Oriented Architecture (SOA), dan layered architecture agar dapat memperhatikan prinsip-prinsip berikut:

### Microservices

Microservices adalah pendekatan pengembangan perangkat lunak yang membangun aplikasi sebagai kumpulan layanan kecil yang dapat di-deploy secara independen. Untuk mendukung arsitektur ini, API harus:

1. Modular: Setiap layanan memiliki API yang terpisah dan terdefinisi dengan jelas.
2. Ringan: API harus efisien dalam waktu respons dan penggunaan sumber daya.
3. Independen: Layanan dapat dikembangkan, diuji, dan di-deploy secara mandiri.

### Service-Oriented Architecture (SOA)

SOA adalah kerangka kerja desain yang memungkinkan layanan dalam jaringan berkomunikasi dan berkolaborasi. Untuk mendukung SOA, API harus:

1. Interoperable: API harus menggunakan standar umum seperti SOAP atau REST untuk menjamin kompatibilitas.
2. Reusable: Layanan dapat digunakan kembali pada berbagai konteks dan aplikasi.
3. Loose Coupling: Layanan harus dirancang dengan ketergantungan minimal satu sama lain.
### Layered Architecture

Layered architecture membagi aplikasi menjadi beberapa lapisan dengan tanggung jawab yang jelas. Untuk mendukung layered architecture, API harus:

1. Terstruktur: Setiap lapisan memiliki API yang jelas dan terdefinisi dengan baik.
2. Abstraktif: API harus menyembunyikan kompleksitas lapisan bawah dari lapisan atas.
3. Terisolasi: Perubahan pada satu lapisan tidak memengaruhi lapisan lain.

### 7.1.5 Cloud-Native API

Cloud native adalah pendekatan dalam pembangunan dan pengoperasian aplikasi yang memanfaatkan sepenuhnya kelebihan model penyimpanan cloud. Dalam perancangan API cloud native, beberapa prinsip utama harus diperhatikan adalah:

1. Scalability: API harus dapat menangani peningkatan jumlah permintaan secara dinamis tanpa mengorbankan kinerja. Implementasi Container dan Serverless dalam bentuk orkestrasi
2. Resilience: API harus dirancang untuk tetap berfungsi meskipun terjadi kegagalan pada komponen tertentu. API harus memiliki kemampuan failover dan juga ketahanan terhadap beban kerja.
3. Automation: Proses deployment dan pengelolaan API harus otomatis untuk mempermudah scaling dan updating.
4. Observability: API harus menyediakan cara untuk memonitor kinerja dan mendeteksi masalah dengan cepat.

Dengan mematuhi prinsip-prinsip ini, API dapat mendukung arsitektur microservices yang efisien dan tangguh, memungkinkan aplikasi untuk berkembang dan beradaptasi dengan cepat terhadap perubahan kebutuhan bisnis.
