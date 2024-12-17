# BAB 2 Arsitektur Sistem

Arsitektur sistem adalah kerangka kerja yang mendefinisikan bagaimana sebuah komponen atau modul dalam sebuah sistem akan berinteraksi satu sama lain. Bagaimana data mengalir antar bagian, dan bagaimana aplikasi dikelola secara keseluruhan. Pemilihan arsitektur yang tepat sangat penting karena akan mempengaruhi cara sistem dibangun, dipelihara, dan dikembangkan di masa depan. Beberapa konsep arsitektur sistem yang dapat dipilih sebagai dasar struktur sistem sebelum pengembangan dimulai, masing-masing dengan kelebihan dan kekurangan yang perlu dipertimbangkan.

## 2.1. Pertimbangan Memilih Arsitektur

Dalam memilih arsitektur sistem, biasanya mempertimbangkan beberapa faktor seperti berikut:

1. **Kompleksitas aplikasi**
    1. Apakah aplikasi ini relatif sederhana atau kompleks ?
    2. Apakah sistem akan terus berkembang ?
2. **Kebutuhan kinerja dan skalabilitas**
    1. Seberapa penting aplikasi dapat berkembang secara horizontal atau menangani lonjakan permintaan pengguna ?
    2. Apakah aplikasi akan besar dengan ribuan pengguna atau cukup untuk pengguna internal ?
3. **Kemudahan pemeliharaaan**
    1. Apakah aplikasi akan dikembangkan dan dikelola oleh tim yang kecil atau besar ?
    2. Seberapa terampil tim pengembangan ?
4. **Waktu dan biaya pengembangan**
    1. Seberapa cepat aplikasi perlu diluncurkan ?
    2. Bagaimana anggaran untuk pengembangan ?
5. **Kebutuhan fleksibilitas**
    1. Apakah aplikasi mungkin akan berkembang atau diubah fungsinya di masa depan ?
    2. Jika akan diubah, seberapa sering aplikasi perlu diperbaruhi ?
6. **Integrasi dengan sistem lain**
    1. Apakah aplikasi memerlukan integrasi dengan sistem lain ?
    2. Fitur apa saja yang akan diintegrasikan ?

## 2.2 Pilihan Arsitektur Sistem

Berikut beberapa arsitektur sistem yang populer saat ini:

### 2.2.1. Monolitik

Arsitektur monolitik merupakan arsitektur klasik dalam pengembangan aplikasi, dimana seluruh aplikasi dikembangkan dalam satu unit kode dasar yang mencakup seluruh fungsionalitas aplikasi. Antarmuka pengguna, logika bisnis, dan lapisan data digabung dalam satu kesatuan aplikasi yang dijalankan. Setiap perubahan atau pembaruan akan mempengaruhi seluruh aplikasi.

Kelebihan dari arsitektur monolitik ini adalah :

1. Mudah dikembangkan dan dideploy sehingga ideal untuk aplikasi kecil atau sederhana dan tim kecil.
2. Biaya lebih rendah karena membutuhkan lebih sedikit sumber daya dan mudah dikelola.
3. Peforma terpusat karena semua bagian jadi satu kesatuan.

Sedangkan untuk kekurangannya:

1. Kurang fleksibel, dalam hal ini kaitannya saat melakukan perubahan atau peningkatan pada sebagian aplikasi akan berpengaruh pada seluruh aplikasi.
2. Tidak cocok untuk skalabilitas horizontal, skalabilitas terbatas karena biasanya hanya dapat meningkatan kapasitas vertikal dengan meningkatkan spesifikasi server. Bisa horizontal apabila menggunakan load-balancing.
3. Pemeliharaan semakin kompleks seiring pertumbuhan aplikasi. Misalnya untuk menambah atau memperbaiki fitur akan semakin sulit ketika kode menjadi semakin besar dan rumit.

Arsitektur monolitik cocok digunakan pada:

1. Aplikasi sederhana atau Minimum Viable Product (MVP).
2. Tim kecil dan belum memiliki banyak kebutuhan integrasi eksternal.
3. Aplikasi yang tidak memerlukan skalabilitas tinggi.

### 2.2.2. Modular Monolitik

Modular monolitik merupakan variasi dari arsitektur monolitik yang mengedepankan pembagian aplikasi menjadi modul-modul terpisah. Setiap modul memiliki tanggung jawab tertentu, namun tetap berada dalam satu kesatuan aplikasi yang besar. Pendekatan ini menggabungkan kelebihan dari modularisasi (memudahkan pemeliharaan dan pengembangan) dengan kesederhanaan implementasi dalam satu aplikasi monolitik.

Modular monolitik memiliki kelebihan, diantaranya:

1. Lebih fleksibel dibandingkan monolitik biasa, karena modul-modul yang berbeda dapat dikembangkan, diuji, dan dikelola secara terpisah.
2. Mudah dideploy dan lebih mudah dikelola dalam hal koordinasi antara tim.
3. Kinerja tetap terpusat dalam satu kesatuan aplikasi.

Adapun untuk kekurangannya:

1. Meskipun lebih modular, tetap saja aplikasi akan lebih sulit untuk berkembang seiring waktu jika tidak direncanakan dengan baik.
2. Skalabilitas horizontal masih terbatas, karena seluruh aplikasi berjalan dalam satu unit besar.

Modular monolitik digunakan pada:

1. Aplikasi yang membutuhkan struktur modular namun tidak terlalu kompleks.
2. Tim pengembangan yang relatif kecil namun memiliki pembagian tugas yang jelas.
3. Sistem yang membutuhkan fleksibilitas tanpa kehilangan kesederhanaan dalam pengelolaan.

### 2.2.3. Microservices

Microservice merupakan suatu layanan kecil dan independen, yang dapat dideploy dan diubah tanpa tergantung dengan aplikasi lain. Setiap microservice memiliki tanggung jawab serta fokus pekerjaan tersendiri, dan dapat saling berkomunikasi dengan microservice lain melalui network-call.
Kumpulan dari microservices yang saling terhubung ini disebut dengan Microservices Architectures (MSA).

Kelebihan dari microservice adalah:

1. Skalabilitas yang baik
2. Fault Tolerance yang tinggi
3. Pengembangan dan penerapan yang mudah
4. Fleksibilitas
5. Kemudahan pemeliharaan

Adapun untuk kekurangannya adalah sebagai berikut:

1. Kompleksitas yang tinggi karena banyak komponen yang dikoordinasikan
2. Overhead komunikasi antar microservice dapat mempengaruhi kinerja aplikasi
3. Tantangan debugging
4. membutuhkan keahlian yang lebih tinggi untuk membangun dan mengelila aplikasi microservices

### 2.2.4. API-First atau Headless

API-First adalah sebuah pendekatan dalam pengembangan perangkat lunak yang memprioritaskan pengembangan API (Application Programming Interface) sebelum mengembangkan aplikasi atau antarmuka pengguna. Dalam pendekatan ini, API dianggap sebagai produk utama yang harus dikembangkan terlebih dahulu, kemudian aplikasi atau antarmuka pengguna dibangun di atasnya.

Ilustrasi sederhana untuk memahami API-First adalah dengan membandingkannya dengan pembangunan sebuah rumah. Dalam pendekatan tradisional, kita membangun rumah terlebih dahulu, kemudian memasang sistem listrik, air, dan lain-lain. Namun, dalam pendekatan API-First kita membangun sistem listrik, air, dan lain-lain terlebih dahulu baru kemudian membangun rumah di atasnya. Dengan demikian, kita dapat memastikan bahwa sistem yang kita bangun dapat berfungsi dengan baik dan dapat diintegrasikan dengan aplikasi atau antarmuka pengguna yang akan dibangun di atasnya.

Keuntungan utama dari pendekatan API-first adalah mempermudah integrasi antar sistem yang berbeda, baik untuk pengembangan aplikasi front-end maupun back-end. Dengan API yang sudah ada sejak awal, pengembang dapat lebih fokus pada fungsionalitas dan keamanan API serta memastikan bahwa berbagai layanan dapat berkomunikasi secara efektif tanpa adanya ketergantungan pada bagian lain dari sistem.

Selain itu, API-first juga mendukung pengembangan yang lebih cepat dan lebih efisien. Tim pengembang dapat bekerja secara paralel, tim front-end dapat mengembangkan UI sambil menggunakan API yang sudah didefinisikan sementara tim back-end dapat fokus pada implementasi dan pengelolaan server dan database. Dengan demikian, pendekatan ini meningkatkan kolaborasi antar tim dan mempercepat waktu pengembangan secara keseluruhan.

### 2.2.5. Serverless

Arsitektur serverless adalah pendekatan desain software yang memungkinkan developer membangun dan mengelola aplikasi tanpa perlu mengelola arsitektur dasarnya. Aplikasi serverless tetap berjalan di server, tetapi penyedia layanan cloud bertanggung jawab menyediakan, mengelola, dan menskalakan semua infrastruktur cloud tersebut.

**Bagaimana cara kerja arsitektur serverless?**

Arsitektur serverless dirancang untuk mengabstraksi server dan pengelola server dari tim pengembangan. “Serverless” tidak berarti tanpa server; istilah ini mengacu pada pengalaman pengembangan secara keseluruhan.

Developer hanya perlu menulis kode dan menjalankannya tanpa perlu memikirkan apa pun lainnya. Seluruh tugas penyediaan, pemeliharaan hardware, update software dan keamanan server, serta tugas pengelolaan server lainnya ditangani oleh penyedia cloud. Selain itu, arsitektur serverless secara otomatis meningkatkan atau memperkecil skala sesuai dengan traffic.

Berikut ini beberapa kasus penggunaan arsitektur serverless yang umum:

1. Tindakan berbasis pemicu atau menjalankan tugas terjadwal (misalnya laporan harian, pencadangan, logika bisnis, dll.)
2. Membangun API RESTful untuk aplikasi web dan seluler
3. Pemrosesan asinkron (misalnya transcoding video)
4. Otomatisasi proses IT, seperti menghapus akses secara otomatis, memulai pemeriksaan keamanan kepatuhan, atau mengirim persetujuan
5. Mengotomatiskan pipeline continuous integration dan continuous delivery (CI/CD) (misalnya commit kode yang memicu build, permintaan pull yang memicu pengujian otomatis)
6. Berintegrasi dengan API dan layanan pihak ketiga
7. Menjalankan tugas terjadwal (misalnya laporan harian, pencadangan, logika bisnis, dll.)
8. Pemrosesan data real-time untuk data terstruktur dan tidak terstruktur

## 2.3 Modular Monolitik dengan API-first Desain

Di UGM, pendekatan modular monolitik dengan API-first desain dipilih untuk membangun arsitektur sistem yang lebih fleksibel namun tetap sederhana untuk pengelolaan dan pengembangan aplikasi. Pendekatan ini memungkinkan aplikasi dibangun dengan struktur modular yang terpisah namun tetap dalam satu kesatuan monolitik. Setiap modul dapat berinteraksi melalui API, memungkinkan pengembangan dan pemeliharaan yang lebih efisien, serta meningkatkan kemampuan untuk mengintegrasikan sistem eksternal di masa depan.

Keunggulan pendekatan ini adalah:

1. Memungkinkan pengembangan yang lebih terstruktur dan terpisah antar modul.
2. Dapat dengan mudah diintegrasikan dengan sistem lain melalui API, memudahkan kolaborasi antar tim pengembang.
3. Skalabilitas lebih baik karena modul-modul dapat berkembang secara terpisah tanpa merusak seluruh sistem.

Untuk implementasi **vNext** di UGM, kami telah mengembangkan sistem modular dengan desain API-First yang memanfaatkan API untuk komunikasi antar modul dan layanan. Ini juga mendukung berbagai perangkat dan platform, memastikan pengembangan yang lebih cepat dan kolaborasi yang lebih lancar antara tim front-end dan back-end. Kami juga telah mengimplementasikan sistem API untuk mendukung integrasi yang lebih mudah dengan layanan eksternal dan membangun infrastruktur yang siap untuk pengembangan berkelanjutan.