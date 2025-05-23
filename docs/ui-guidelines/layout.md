## 10.5 *Layout*

Dalam pengembangan aplikasi berbasis web di lingkungan internal universitas, konsistensi tata letak (*layout*) memegang peranan penting untuk memastikan pengalaman pengguna yang seragam di seluruh sistem. *Layout* yang terstandar tidak hanya memudahkan pengguna untuk beradaptasi dengan berbagai sistem, tetapi juga mencerminkan identitas universitas yang profesional dan terintegrasi.

Bagian ini menyajikan pedoman tata letak utama yang harus diikuti oleh pengembang, mencakup elemen-elemen penting seperti susunan *form*, tabel data, navigasi, dan *modal*. Standarisasi ini bertujuan agar setiap aplikasi internal memiliki struktur halaman yang intuitif, estetis, dan sesuai dengan praktik desain modern. Dengan mengikuti pedoman ini, setiap pengembangan mandiri oleh fakultas atau unit dapat tetap sejalan dengan prinsip desain yang telah ditetapkan.

Tata letak yang direkomendasikan berikut juga dilengkapi dengan contoh visual untuk mempermudah implementasi oleh pengembang.

### **10.5.1 Layout Dasar Halaman**

Penempatan *Header*, *Sidebar*, dan Konten Utama

- *Header*
    
    Bagian *header* merupakan kumpulan menu yang biasa digunakan pada portal Simaster. Secara umum, mencakup menu, notifikasi, dan informasi profil pengguna. Letak header berada di bagian teratas halaman dan akan *sticky* atau tetap terlihat meskipun pengguna melakukan *scroll down* kebawah halaman 
    
- *Sidebar*
    
    *Sidebar* berisi menu-menu yang akan menavigasi pengguna ke halaman-halaman yang ada pada sistem. *Sidebar* terletak di bagian paling kiri halaman.
    
- Konten utama
    
    Konten utama adalah pusat data yang akan ditampilkan di sistem. Letaknya berada di bawah header dan di sebelah kanan *sidebar*. 
    


![image.png](../assets/image 11.png)

### 10.5.2 Struktur Formulir

Tata letak elemen *input*, tombol aksi, dan validasi

- *Form* disusun secara vertikal (baris demi baris).
- Label dapat memiliki 2 tipe, yaitu selalu di atas *input*, atau di samping *input*. Penggunaan label pada *input* harus konsisten di semua sistem yang terkait.
    - Label ditempatkan di sisi kiri *input*:
    
    ![image.png](../assets/image 12.png)
    
    - Label ditempatkan di sisi atas *input*:
    
    ![image.png](../assets/image 13.png)
    
- Tambahkan *placeholder* untuk penjelasan tambahan.
    
    *Placeholder* ini berfungsi sebagai informasi tambahan yang ditampilkan ketika input belum diisi. 
    
- Tombol *Submit* atau Simpan ditempatkan di pojok kanan bawah.

### 10.5.3 Struktur Table

Desain tabel dengan filter, pagination, dan aksi baris.

![image.png](../assets/image 14.png)

- **Header tabel:** harus dicetak tebal ***(bold)*** dengan menggunakan huruf kapital seluruhnya atau *capitalize* (huruf besar diawal setiap kata).
- **Baris tabel:** harus memiliki pembatas untuk memisahkan data antara setiap baris, agar lebih jelas dan mudah dibaca.
- Tambahkan tombol aksi di sisi kanan setiap baris, seperti tombol aksi Lihat, Edit, dan Hapus.
    - Tombol aksi dapat berupa sebuah tombol yang memiliki banyak opsi. Ketika tombol tersebut diklik, akan menampilkan beberapa aksi sekaligus.
         
        ![image.png](../assets/image 15.png)
        
    - Tombol aksi juga bisa berupa ikon yang merepresentasikan aksi tertentu, seperti ikon tong sampah untuk menghapus, ikon pensil untuk mengedit, dan lainnya.
        
        ![image.png](../assets/image 16.png)
        
- **CTA Button**: Tombol aksi utama seperti Tambah, Export, dan lainnya, harus ditempatkan di pojok kanan atas tabel. Tombol ini digunakan untuk tindakan penting yang berkaitan langsung dengan tabel.
- **Filter:** Sediakan fitur filter di atas tabel, diikuti dengan tombol "*Apply Filter*" atau "Reset."
    - Untuk fitur filterisasi dengan banyak parameter, disarankan untuk menggunakan pendekatan modal guna mengoptimalkan ruang dan menjaga tampilan tetap rapi dalam satu halaman.
        
        ![image.png](../assets/image 17.png)
        
    - Apabila *parameter filter* yang tersedia hanya 1 atau 2, disarankan untuk meletakkan *filter* langsung pada bagian *header table.* Hal ini bertujuan untuk mengoptimalkan ruang dan mempermudah akses pengguna dalam melakukan *filter.*
        
        ![image.png](../assets/image 18.png)
        
    - Alternatif lain adalah dengan menggunakan pendekatan tambahan panel di sebelah kiri halaman sebagai tempat filter. Pendekatan ini dapat memberikan ruang yang lebih luas untuk menampilkan lebih banyak parameter filter jika diperlukan.
        
        ![image.png](../assets/image 19.png)
        
- **Search**: Sediakan *input search* untuk memudahkan pengguna dalam mencari data yang ada dalam tabel. Input pencarian ini harus ditempatkan di bagian atas tabel agar mudah diakses.
- **Pagination:** Tambahkan navigasi halaman di bawah tabel untuk memungkinkan pengguna berpindah antar halaman data yang lebih banyak. Navigasi ini dapat mencakup tombol *Previous*, *Next*, serta nomor halaman untuk mempermudah navigasi.
- Tambahkan dropdown list pada pojok kanan bawah tabel untuk mengatur jumlah data yang ditampilkan per halaman. Opsi yang dapat disediakan antara lain seperti 10 data, 20 data, 50 data, dan seterusnya. Hal ini memberikan fleksibilitas kepada pengguna untuk memilih jumlah data yang ingin ditampilkan sesuai dengan preferensi mereka.

### 10.5.4 Struktur Modal

Penempatan konten modal, tombol aksi, dan tata letak. 

- Ukuran modal sesuaikan kebutuhan:
    - Small Modal (Ukuran terkecil)
    
    ![image.png](../assets/image 20.png)
    
- Medium Modal (Ukuran medium)
    
    ![image.png](../assets/image 21.png)
    
- Full Modal (Ukuran penuh)
    
    ![image.png](../assets/image 22.png)
    
- Penempatan modal: modal selalu muncul di tengah layar dengan *background overlay* transparan.
- Struktur modal:
    - Judul modal ditempatkan di bagian atas modal (misalnya: “Tambah Data” atau “Edit Data”).
    - Konten modal ditempatkan di bagian tengah modal (misalnya berupa *form*, teks penjelasan atau yang lain).
    - Tombol aksi ditempatkan di bagian bawah modal (misalnya: aksi "Simpan" dan "Batal").
    - Modal harus memiliki tombol "*Close*" atau ikon "X" di sudut kanan atas untuk menutup modal, jika tidak ingin melanjutkan aksi.

### 10.5.6 Profil

Desain halaman ini khusus untuk menampilkan profil pengguna, seperti dosen, tenaga kependidikan (tendik), atau mitra. Struktur halaman menempatkan informasi utama di bagian atas (hero section) dan atribut lainnya di bagian bawah. Jika terdapat banyak data dengan kategori yang beragam, dapat menggunakan tab untuk memisahkan data.

![image.png](../assets/image 23.png)

Untuk data statis ditampilkan dengan struktur label di sebelah kiri dan isian data di sebelah kanan, disusun rapi menyesuaikan panjang kontennya. Adapun untuk data dinamis berupa *form input*, susunannya mengikuti struktur *form* sebagaimana dijelaskan di poin **10.5.2 Struktur *Form*** diatas.

![image.png](../assets/image 24.png)

### 10.5.8 Halaman lain

Selain komponen utama seperti form, tabel, dan navigasi, sistem informasi internal universitas sering kali memerlukan halaman khusus yang dirancang untuk memenuhi kebutuhan tertentu. Halaman-halaman ini, meskipun tidak selalu menjadi bagian dari alur utama pengguna, tetap memegang peranan penting dalam memberikan pengalaman yang lengkap, fungsional, dan konsisten.

1. Halaman Login

    Halaman login termasuk halaman yang penting untuk ada dalam sebuah website yang memerlukan login untuk mengakses seluruh layanan yang tersedia. Halaman ini biasanya terdiri dari *form input* untuk email atau *username* dan *password*. Terdapat juga *text link* *forgot password*, button login, dan button *create an account*.
    ![image.png](../assets/Login-SSO.png)
    ![image.png](../assets/image 25.png)
    
2. Halaman Dashboard

    Halaman dashboard dapat divisualisasikan dengan penggunaan berbagai kumpulan *card* untuk menyajikan informasi secara ringkas, terstruktur, dan menarik secara visual. *Card* memudahkan pengguna memahami data dengan cepat, seperti data statistik, data metrik, atau *status updates*, tanpa perlu membuka halaman baru. Dalam *card* juga dapat diletakkan sebuah tombol atau tautan untuk melakukan aksi atau mengarahkan pengguna ke halaman lain. Penggunaan *card* dalam dashboard dapat dilihat pada gambar di bawah ini.
    ![image.png](../assets/image 26.png)

    Berikut adalah beberapa [prinsip](https://www.telerik.com/design-system/docs/ui-templates/building-blocks/dashboard/dashboard-card/) dalam penggunaan *card*:

    - Menyesuaikan ukuran dan tata letak card dengan jenis kontennya (grafik, teks, tabel, dll.).
    - Menampilkan hanya informasi yang paling penting dan berguna agar pengguna tidak kelebihan (*overload*) dalam menerima informasi dan tidak membingungkan pengguna.
    - Setiap card lebih baik memiliki label atau *title* yang menjelaskan isi atau fungsinya.

    
3. Halaman Persuratan
   
    Halaman persuratan menampilkan daftar email yang dapat dipreview, dikelola, atau dikirim oleh pengguna. Halaman persuratan biasanya disajikan dalam bentuk tabel agar tampilan data lebih rapi, mudah dibaca, dan terstruktur. Berikut adalah struktur tabel secara umum untuk menampilkan data persuratan:

    - Kolom: Pengirim, Subjek/Judul Surat, Tanggal/Waktu, Pratinjau, Lampiran, dan Aksi (buka, balas, hapus, favorit).
    - Baris: Mewakili setiap email yang diterima.
    
    Selain itu, elemen UI pada halaman persuratan sebaiknya memiliki elemen seperti berikut:

    - Pencarian (*Search Bar*): Filter email berdasarkan pengirim, subjek, atau kata kunci.
    - Pengurutan (*Sort Options*): Pengurutan email berdasarkan kolom, seperti tanggal atau subjek.
    - Paginasi (*Pagination*): Paginasi biasanya disajikan dengan nomor halaman dan tombol "Berikutnya" dan "Sebelumnya" yang diletakkan pada bagian bawah tabel.
    - Indikator Visual: Menggunakan ikon atau warna untuk menandai email belum dibaca atau email penting.
    - Fungsi Pratinjau: Klik data pada baris atau klik ikon pratinjau untuk membuka dan membaca isi email secara lengkap.
    
    Berikut adalah contoh halaman persuratan pada Metronic:
    ![image.png](../assets/image 27.png)
    
4. Kalender Jadwal
   
    Halaman kalender jadwal berfungsi untuk menampilkan dan mengelola jadwal kegiatan secara visual dan terorganisir. Prinsip desain dalam halaman kalendar adalah sebagai berikut:

     - Navigasi Waktu: Menyediakan tombol untuk berpindah bulan, kembali ke hari ini, dan pilihan tampilan (bulan, minggu, hari).
     - Tambah Kegiatan (*Add Event*): Menggunakan tombol "Add Event" yang terlihat jelas untuk menambahkan agenda baru.
     - Kode Warna: Menggunakan warna yang berbeda untuk membedakan setiap jenis kegiatan (misalnya rapat, *repeating event*, konferensi, atau kegiatan lainnya).
     - *Preview* Kegiatan: Menampilkan informasi kegiatan secara lebih lengkap berupa modal ketika pengguna menekan setiap event atau kegiatan pada kalendar.
     - Opsi Filter: Menyediakan filter untuk menampilan kegiatan berdasarkan kategori atau *tags* tertentu dan lain-lain.

    Contoh kalender jadwal dapat dilihat pada gambar di bawah ini:
    ![image.png](../assets/image 28.png)
    
5. Halaman Error 404, 500, dan lain-lain
   
    Halaman error harus tetap menjaga pengalaman pengguna yang intuitif, informatif, dan mudah dipahami oleh pengguna. Beberapa prinsip umum untuk halaman error 404 dan 500 adalah sebagai berikut:
    
    - Menampilkan pesan yang menjelaskan situasi dan mudah dipahami oleh pengguna, misalnya “*Sorry, the page you are looking does not exist or something went wrong*”.
    - Menyediakan tombol untuk kembali ke beranda, halaman sebelumnya, atau kontak bantuan.
    - Menambahkan ilustrasi sederhana agar tampilan tidak terasa kaku dan memvisualisasikan error yang terjadi.
    - Menggunakan gaya visual yang sesuai dengan tema dan *branding* yang digunakan pada website (misalnya warna, *font*, logo).

    Berikut adalah contoh halaman error 404 dan 500:
    ![image.png](../assets/image 29.png)
    
    ![image.png](../assets/image 30.png)
    

Pedoman ini memberikan panduan visual dan fungsional untuk setiap jenis halaman, mencakup tata letak elemen, hierarki konten, dan penggunaan komponen desain yang sesuai. Dengan menerapkan standar ini, pengembang dapat memastikan bahwa setiap halaman, meskipun bersifat khusus, tetap harmonis dengan sistem utama.