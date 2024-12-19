Dalam pengembangan aplikasi berbasis web di lingkungan internal universitas, konsistensi tata letak (layout) memegang peranan penting untuk memastikan pengalaman pengguna yang seragam di seluruh sistem. Layout yang terstandar tidak hanya memudahkan pengguna untuk beradaptasi dengan berbagai sistem, tetapi juga mencerminkan identitas universitas yang profesional dan terintegrasi.

Bagian ini menyajikan pedoman tata letak utama yang harus diikuti oleh pengembang, mencakup elemen-elemen penting seperti susunan form, tabel data, navigasi, dan modal. Standarisasi ini bertujuan agar setiap aplikasi internal memiliki struktur halaman yang intuitif, estetis, dan sesuai dengan praktik desain modern. Dengan mengikuti pedoman ini, setiap pengembangan mandiri oleh fakultas atau unit dapat tetap sejalan dengan prinsip desain yang telah ditetapkan.

Tata letak yang direkomendasikan berikut juga dilengkapi dengan contoh visual untuk mempermudah implementasi oleh pengembang.

### **10.5.1 Layout Dasar Halaman**

Penempatan header, sidebar, dan konten utama

- Header
    
    Bagian header adalah kumpulan menu yang biasa digunakan pada portal simaster. Secara umum mencakup menu, notifikasi, dan info profil user. Letak dari header berada pada bagian teratas pada halaman dan akan *sticky* atau tetap terlihat meskipun pengguna melakukan *scroll down* kebawah halaman 
    
- Sidebar
    
    Sidebar ini berisi menu-menu yang akan menavigasi pengguna kepada halaman-halaman yang ada pada sistem. Sidebar ini terletak pada bagian paling kiri halaman.
    
- Konten utama
    
    Konten utama adalah pusat data yang akan ditampilkan disistem. letaknya adalah dibawah dari header dan disamping kanan dari sidebar. 
    

![image.png](../assets/image 11.png)

### 10.5.2 Struktur Formulir

Tata letak elemen input, tombol aksi, dan validasi

- Form tersusun vertikal (baris demi baris).
- Label bisa terdapat 2 tipe, selalu di atas input, atau di samping input. Penggunaan label pada input diharuskan konsisten disemua sistem yang berkaitan.
    - Label disamping kiri input
    
    ![image.png](../assets/image 12.png)
    
    - Label diatas input
    
    ![image.png](../assets/image 13.png)
    
- Tambahkan placeholder untuk penjelasan tambahan
    
    Placeholder ini adalah informasi tambahan pada saat inputan belum diisi. 
    
- Tombol submit atau simpan ada di pojok kanan bawah

### 10.5.3 Struktur Table

Desain tabel dengan filter, pagination, dan aksi baris.

![image.png](../assets/image 14.png)

- Header tabel harus dicetak tebal ***(bold)*** menggunakan huruf kapital semuanya atau capitalize (huruf besar diawal)
- Baris tabel memiliki pembatas table, pemisah antara data yang ada pada setiap baris.
- Tambahkan tombol aksi di baris kanan (lihat/edit/hapus)
    - Tombol aksi bisa berupa sebuah tombol dengan banyak aksi. 1 tombol jika di klik memilik banyak aksi sekaligus
        
        ![image.png](../assets/image 15.png)
        
    - Tombol aksi bisa langsung berupa sebuah ikon yang merepresentasikan aksi tertentu, seperti ikon tong sampah untuk menghapus, ikon pensil untuk edit, dan lain-lain
        
        ![image.png](../assets/image 16.png)
        
- **CTA Button**: Tombol yang digunakan untuk aksi berada dipojok kanan diatas table. Contoh: Tombol tambah, tombol export, dan lain-lain
- **Filter:** Sediakan filter di atas tabel, diikuti dengan tombol "Apply Filter" atau "Reset."
    - Untuk fitur filterisasi dengan banyak parameter, maka disarankan untuk menggunakan pendekatan modal untuk mengoptimalkan ruang dalam 1 halaman
        
        ![image.png](../assets/image 17.png)
        
    - Apabila parameter hanya ada 1 atau 2 maka disarankan untuk meletakkan filter tersebut langsung pada bagian *header table* agar mengoptimalkan ruang dan mempermudah akses untuk melakukan filter
        
        ![image.png](../assets/image 18.png)
        
    - Dapat juga menggunakan pendekatan untuk filter menggunakan tambahan panel disebelah kiri halaman.
        
        ![image.png](../assets/image 19.png)
        
- Search: Sediakan input search untuk mencari data yang ada dalam table
- **Pagination:** Tambahkan navigasi halaman di bawah tabel
- Tambahkan dropdown list pada pojok kanan bawah untuk mengatur isi table. Contoh: 10 data, 20, data, 50 data, dan seterusnya

### 10.5.4 Struktur Modal

Penempatan konten modal, tombol aksi, dan tata letak. Ukuran table juga dapat bervariasi sesuai kebutuhan. Small, medium, dan large.

- Small Modal (Ukuran terkecil)
    
    ![image.png](../assets/image 20.png)
    
- Medium Modal (Ukuran medium)
    
    ![image.png](../assets/image 21.png)
    
- Full Modal (Ukuran penuh)
    
    ![image.png](../assets/image 22.png)
    
- Modal selalu muncul di tengah layar dengan overlay transparan di background.
- Tambahkan judul modal di bagian atas, konten di tengah, dan tombol aksi di bagian bawah (misalnya "Simpan" dan "Batal").
- Modal harus memiliki tombol "Close" atau ikon "X"

### 10.5.6 Profil

Desain halaman khusus profil dan informasi pengguna. Struktur halaman ini dikhususkan untuk halaman untuk menampilkan profil suatu pengguna, atau dosen, atau tendik, atau bahkan mitra. Meletakkan info utama dibagian atas (hero section) dan meletakkan atribut-atribut lainnya pada bagian bawah. Apabila terdapat banyak data dengan pembagian kategori data yang banyak, maka dapat menggunakan tab untuk pemisahnya.

![image.png](../assets/image 23.png)

Untuk data statis maka menggunakan tampilan dengan struktur label disebelah kiri dan isian data disebelah kanan yang disusun rapi menyesuaikan panjang kontennya. Adapun untuk data dinamis berupa form inputan, maka disusun sebagaimana struktur form yang telah dijelaskan di poin **10.5.2 Struktur Form** diatas.

![image.png](../assets/image 24.png)

### 10.5.8 Halaman lain

Selain komponen utama seperti form, tabel, dan navigasi, sistem informasi internal universitas sering kali memerlukan halaman khusus yang dirancang untuk memenuhi kebutuhan tertentu. Halaman-halaman ini, meskipun tidak selalu berada di jalur utama alur pengguna, tetap memegang peranan penting dalam memberikan pengalaman yang lengkap, fungsional, dan konsisten.

1. Halaman login
    
    ![image.png](../assets/image 25.png)
    
2. Halaman Dashboard
    
    ![image.png](../assets/image 26.png)
    
3. Halaman Persuratan
    
    ![image.png](../assets/image 27.png)
    
4. Kalender Jadwal
    
    ![image.png](../assets/image 28.png)
    
5. Error 404, 500, dan lain-lain
    
    ![image.png](../assets/image 29.png)
    
    ![image.png](../assets/image 30.png)
    

Pedoman ini memberikan panduan visual dan fungsional untuk setiap jenis halaman, meliputi tata letak elemen, hierarki konten, dan penggunaan komponen desain yang sesuai. Dengan menerapkan standar ini, pengembang dapat memastikan bahwa setiap halaman, bahkan yang bersifat khusus, tetap harmonis dengan sistem utama.