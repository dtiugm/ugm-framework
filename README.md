# UGM Framework Guideline



## Apa itu UGM Framework ?

UGM Framework atau sering disebut UGMFW adalah framework yang dikembangkan oleh Tim Integrasi Universitas Gadjah Mada (UGM). Pengembangan UGM Framework dimulai sejak Bulan Mei tahun 2015. Awal mula pengembangannya Tim Integrasi beranggotakan 4 orang programmer dan seiring berjalannya waktu akhirnya berhasil mengembangkan UGM Framework untuk memenuhi kebutuhan sistem informasi di UGM.

UGM Framework yang telah dikembangkan adalah untuk kepentingan internal UGM berbasis framework PHP CodeIgniter (CI). Framework CI ini cukup mudah dipelajari dan mudah dikembangkan sesuai kebutuhan. Framework CI sendiri juga terkenal dengan performanya yang cepat dan ringan.

Framework CodeIgniter adalah framework yang menggunakan dasar pola pengembangan Model-View-Controller (MVC). MVC adalah pendekatan perangkat lunak yang memisahkan logika aplikasi dari presentasi. Dalam praktiknya, pendekatan ini mengizinkan halaman web berisi skrip minimal karena presentasinya terpisah dari skrip PHP. *Model* merepresentasikan struktur data. Biasanya kelas model berisi fungsi yang mengambil, menyisipkan, dan memperbarui data. *View* adalah bagian yang berisi informasi yang disajikan kepada pengguna. Dalam view ini biasanya berupa HTML, CSS maupun javascript. *Controller* berfungsi sebagai perantara antara *Model*, *View* dan sumber daya lainnya. *Controller* memproses permintaan HTTP dan menghasilkan halaman web.

UGM Framework mengadopsi pola *Hierarchical Model-View-Controller* (HMVC). HMVC adalah sebuah pola pengembangan perangkat lunak yang merupakan pengembangan dari MVC. Pola ini menambahkan hierarki ke komponen-komponen MVC, sehingga setiap modul dalam aplikasi HMVC memiliki *model*, *view* dan *controller* sendiri. HMVC disebut sebagai solusi untuk mengatasi masalah skalabilitas yang muncul dalam implementasi MVC. HMVC sendiri memiliki beberapa keuntungan, diantaranya HMVC meningkatkan modularitas karena terbagi ke modul-modul sendiri. HMVC meningkatkan kemudahan pengembangan dan perawatan terutama untuk sistem yang besar dan kompleks. HMVC juga meningkatkan kemudahan pengujian karena sifatnya modular sehingga komponen sistem dapat diuji secara terpisah.

UGM Framework versi terakhir adalah UGMFW v3.2. Versi ini menggunakan dasar framework CodeIgniter versi 3. UGMFW versi inilah yang paling banyak digunakan untuk mendukung pengembangan aplikasi internal di UGM. Namun, seiring berjalannya waktu UGMFW v3.2 mengalami stagnasi karena kurangnya pemeliharaan dan adopsi teknologi terbaru. Kondisi ini membuat banyak pengembang enggan mengadopsi UGMFW. Selain dianggap ketinggalan zaman, UGMFW juga dianggap tidak fleksibel. Untuk mengatasi masalah ini, perlu dilakukan transformasi menyeluruh yang mencakup pembaruan teknologi, penyelarasan pengembangan, dan peningkatan kualitas dokumentasi serta panduan pengembangan.

## Team Member
### Task Force UGM Framework


Kami mengucapkan terima kasih yang sebesar-besarnya kepada semua pihak yang telah berkontribusi dalam penyusunan pedoman ini. Terutama kepada:

1. Rektor Universitas Gadjah Mada.
2. Wakil Rektor Universitas Gadjah Mada.
3. Direktur Teknologi Informasi.
4. Sekretaris Direktorat Teknologi Informasi.
5. Kepala Sub Bidang Direktorat Teknologi Informasi.
6. Koordinator Fungsional Direktorat Teknologi Informasi.
7. Tim Task Force Simaster vNext, UGM Lean, dan Modernisasi Data.
8. Tim Task Force UGM Framework.
9. Semua pihak yang terlibat, baik secara langsung maupun tidak langsung.

### Made with ❤️ and ☕ by Direktorat Teknologi Informasi.
