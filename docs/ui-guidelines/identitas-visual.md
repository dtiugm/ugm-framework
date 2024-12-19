Pengembangan aplikasi berbasis web di lingkup internal sampai saat ini mengadopsi template Pixel Admin (versi lama, saat ini statusnya telah deprecated dan sudah merilis Pixel Admin yang baru).  Namun mulai saat ini dan dipengembangan berikutnya akan digunakan template baru, yaitu template dari Keenthemes, Metronics sebagai design system utama penyusunan tampilan/user interface. Untuk saat ini dokumentasi dan preview template hanya bisa didapatkan dengan melakukan permohonan permintaan langsung atau mengunjungi ke laman pembuatnya [di sini](https://preview.keenthemes.com/metronic8/demo1/). Kedepannya dokumentasi dan live preview template dapat diunggah ke publik sehingga dapat diakses langsung oleh setiap pengembang di lingkungan internal.

Adapun elemen visual yang akan ditetapkan ketentuannya meliputi:

- **Warna (Color Palette)**
    
    Menyediakan tentang definisi penggunaan warna yang akan digunakan dalam menyusun tampilan. Dalam template bisah didefinisikan nama warna, kode serta penggunaan dalam komponen UI. 
    
    | Nama Kelas | Kode |
    | --- | --- |
    | primary | #1B84FF |
    | success | #17C653 |
    | danger | #F8285A |
    | warning | #F6C000 |
    | info | #7239EA |
    | default | #F1F1F4 |
    
    ![cp-metro.png](../assets/cp-metro.png)
    
- **Tipografi**
    
    Penentuan jenis font, berat, ukuran dan gaya yang digunakan dalam pengembangan tampilan. Secara default, setiap template yang digunakan juga telah menyediakan `class` untuk tipografi. Untuk template Metronics *font family* utama yang digunakan adalah Sans-Serif.
    
    Pada redaksional aplikasi umumnya terdiri terdiri dari 3 bagian, yaitu *Heading*, *Sub-Heading*, *Description*. Pada heading dapat menggunakan tag `<h1></h1>`. Untuk sub-heading dapat menggunakan `<h4></h4>`. Dan yang terakhir untuk bagian description dapat menggunakan teks biasa. Untuk menambahkan estetika dapat ditambahkan spacing antar bagian, misal di bagian heading ditambahkan class `mb-2`, kemudian dibawah sub-heading ditambahkan class `mb-4`.  Lalu untuk styling text bisa menggunakan class `fw-bold` untuk mempertebal huruf, dan class `fst-italic` untuk mencetak miring. 
    
    Berikut merupakan hasil penataan tipografi untuk suatu konten.
    
    ![image.png](../assets/image.png)
    
- **Spacing**
    
    **Spacing** mengacu pada pengaturan jarak di antara elemen teks untuk menciptakan tampilan yang lebih rapi, mudah dibaca, dan estetis. Spacing mencakup jarak antara huruf, kata, baris, atau elemen teks secara keseluruhan. Dalam desain grafis, spacing sangat penting untuk memengaruhi **keterbacaan (readability)**, **hierarki visual**, dan **estetika desain**. Seperti pada contoh tipografi di atas, spacing diberikan pada element heading dan sub-heading dengan menambahkan class `mb-2` dan `mb-4`.
    
- **Ikonografi**
    
    Desain ikon yang digunakan untuk membantu navigasi dan menyampaikan fungsi dengan cepat. Icon yang baik adalah icon yang konsisten dan selaras dengan maksud yang hendak disampaikan sehingga pengguna dapat memahami arti dari icon tanpa kebingungan. 
    
    Dalam template Metronics sendiri sudah menggunakan paket ikon *build-in* dari pengembang yang diberi nama KeenIcons. Keenicons memberikan 3 style ikon yang berbeda, yaitu duotone, solid dan outline. Untuk pilihan style ikon itu kembali kepada keinginan ataupun kesepakatan pengembang project, tidak ada paksaan untuk menggunakan duoton, atau solid, atau outline. Namun, **disarankan untuk memilih style yang konsisten dalam 1 project**, sebagai contoh misalkan untuk pengembangan aplikasi “A” menggunakan style duotone dan aplikasi “B” menggunakan solid.
    
    Berikut merupakan contoh kode dan icon yang dihasilkan:
    
    ```css
    <i class="ki-duotone ki-chart text-primary">
        <i class="path1"></i>
        <i class="path2"></i>
    </i>
    
    <i class="ki-solid ki-chart text-warning"></i>
    
    <i class="ki-outline ki-chart text-danger"></i>
    ```
    
    ![image.png](../assets/image 1.png)
    
- **Ilustrasi**
    
    Ilustrasi merupakan karya visual yang digunakan untuk menjelaskan, memperjelas, atau memperindah suatu konsep, teks, cerita, atau ide yang hendak disampaikan. Visual ini sebaiknya mencerminkan identitas merek dan memberikan nuansa yang sesuai dengan target audiens. 
    
    Dalam template Metronics juga menyertakan beberapa gambar ilustrasi yang dapat digunakan oleh pengembang user interface. Apabila hendak menggunakan gambar ilustrasi original sendiri tentu diperbolehkan. Sangat disarankan apabila gambar ilustrasi tersebut dapat terlihat jelas pada mode terang maupun gelap. Gambar ilustrasi bawaan template Metronics terletak pada direktori `assets/media/ilustrations`.
    