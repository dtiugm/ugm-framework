# 12.13 **ReDoc**

**ReDoc** adalah alat dokumentasi API yang dihasilkan secara otomatis berdasarkan **OpenAPI Specification** (OAS). ReDoc menawarkan tampilan dokumentasi API yang bersih dan terstruktur dengan baik, memungkinkan pengembang dan pengguna untuk memahami API dengan mudah. Dibandingkan dengan Swagger UI, ReDoc lebih fokus pada penyajian dokumentasi API dengan desain yang lebih minimalis dan fungsional.

## **12.12.1 Fitur Utama ReDoc**

1. **Desain Responsif**
    
    ReDoc dirancang untuk memberikan pengalaman pengguna yang baik di berbagai perangkat, mulai dari desktop hingga perangkat mobile. Desainnya yang responsif memastikan bahwa dokumentasi API dapat diakses dengan nyaman di berbagai layar.
    
2. **Pengalaman Pengguna yang Bersih dan Terstruktur**
    
    Antarmuka ReDoc mengutamakan kemudahan navigasi dan kejelasan, dengan tampilan yang rapi dan fokus pada penyajian informasi API yang jelas dan mudah dipahami.
    
3. **Pencarian API yang Cepat**
    
    ReDoc menyediakan fitur pencarian yang memudahkan pengguna untuk menemukan endpoint, parameter, atau informasi tertentu di dokumentasi API.
    
4. **Penyajian Dokumentasi Berdasarkan Standar OpenAPI**
    
    ReDoc sepenuhnya mendukung **OpenAPI Specification** (OAS), yang memungkinkan dokumentasi API dibuat secara otomatis berdasarkan file spesifikasi OAS.
    
5. **Dukungan untuk Berbagai Jenis Data**
    
    ReDoc mendukung berbagai format data dan metode HTTP yang digunakan oleh API, serta memberikan penjelasan yang jelas mengenai respons dan parameter API dalam format yang mudah dipahami.
    
6. **Dukungan Autentikasi**
    
    ReDoc memungkinkan integrasi dengan berbagai mekanisme autentikasi, seperti OAuth 2.0 dan API key, yang memungkinkan pengembang untuk mendokumentasikan cara penggunaan API yang aman.
    
7. **Pemrograman Dinamis**
    
    Dokumentasi API yang dihasilkan dengan ReDoc bersifat dinamis dan dapat diperbarui secara langsung sesuai dengan perubahan yang dilakukan pada spesifikasi OpenAPI.

## **12.12.2 Keunggulan ReDoc**

ReDoc beberapa memiliki keunggulan antara lain:

1. **Desain yang Lebih Minimalis**
    
    Dibandingkan dengan Swagger UI, ReDoc memiliki desain yang lebih minimalis dan tidak terlalu banyak elemen visual, membuat dokumentasi API terlihat lebih bersih dan mudah dinavigasi.
    
2. **Pengalaman Pengguna yang Lebih Fokus**
    
    Dengan fokus pada penyajian informasi yang terstruktur dengan baik, ReDoc memberikan pengalaman pengguna yang lebih terfokus pada pemahaman API dan mengurangi gangguan visual.
    
3. **Pencarian yang Efisien**
    
    Fitur pencarian yang tersedia memungkinkan pengguna untuk menemukan informasi tentang API dengan lebih cepat, yang sangat berguna ketika dokumentasi API cukup besar dan kompleks.
    
4. **Dokumentasi Otomatis Berdasarkan OpenAPI**
    
    Seperti Swagger, ReDoc memungkinkan pembuatan dokumentasi API yang sepenuhnya otomatis berdasarkan file spesifikasi **OpenAPI Specification** yang dapat digunakan oleh pengembang untuk mempercepat pengembangan dan integrasi API.
    
5. **Kemudahan Integrasi**
    
    ReDoc mudah diintegrasikan dengan berbagai framework API yang mendukung OpenAPI, seperti **FastAPI**, dan dapat digunakan untuk menghasilkan dokumentasi API yang terstruktur dan mudah dipahami tanpa konfigurasi yang rumit.

## **12.12.3 Kekurangan ReDoc**

Kekurangan ReDoc adalah:

1. **Fitur Interaktivitas Terbatas**
    
    Dibandingkan dengan Swagger UI, ReDoc tidak menyediakan interaktivitas penuh dalam pengujian API. ReDoc lebih fokus pada penyajian dokumentasi, sementara Swagger UI memungkinkan pengujian API secara langsung dari antarmuka.
    
2. **Tidak Sebanyak Fitur Pengujian**
    
    ReDoc lebih berfokus pada dokumentasi dan presentasi data daripada menyediakan alat pengujian interaktif seperti yang ada di Swagger UI.
    
3. **Kurang Fleksibel untuk Kustomisasi**
    
    Meskipun ReDoc menyediakan beberapa opsi kustomisasi, pengembang yang membutuhkan kontrol penuh atas tampilan dan interaksi dokumentasi mungkin merasa lebih terbatas dibandingkan dengan Swagger UI.

## **12.12.4 Lisensi dan Versi ReDoc**

1. **Versi Open Source**
    
    ReDoc tersedia sebagai alat **open-source**, yang dapat diunduh dan digunakan secara gratis. Pengguna dapat memodifikasi dan mengonfigurasi ReDoc sesuai kebutuhan mereka, dengan keterbatasan fungsionalitas yang lebih sedikit dibandingkan dengan versi berbayar.
    
2. **ReDoc Pro**
    
    Untuk fitur tambahan dan dukungan premium, ReDoc juga menawarkan **ReDoc Pro** yang memungkinkan pengguna untuk menyesuaikan lebih lanjut dokumentasi mereka dan mendapatkan dukungan langsung dari tim ReDoc.

## **12.12.5 ReDoc dan FastAPI**

Salah satu fitur unggulan FastAPI adalah kemampuannya untuk menghasilkan dokumentasi API otomatis menggunakan **Swagger UI** dan **ReDoc**. ReDoc terintegrasi secara langsung dengan FastAPI, sehingga dokumentasi API akan dihasilkan secara otomatis tanpa memerlukan konfigurasi tambahan.

Beberapa kelebihannya adalah sebagai berikut:

1. **Penghasilan Dokumentasi Otomatis**
    
    Ketika aplikasi FastAPI dijalankan, dokumentasi API dapat diakses melalui ReDoc tanpa perlu pengaturan manual. Hal ini memungkinkan pengembang untuk dengan cepat mendapatkan dokumentasi API yang dapat dipahami dengan mudah oleh pihak lain.
    
2. **Antarmuka Pengguna ReDoc di FastAPI**
    
    ReDoc dapat diakses melalui antarmuka web FastAPI di endpoint `/redoc` secara default. Hal ini memberi pengembang dua pilihan dokumentasi API yang dihasilkan otomatis, yaitu melalui Swagger UI dan ReDoc.
    
3. **Desain yang Mudah Dinavigasi**
    
    ReDoc menyediakan antarmuka yang sangat bersih dan terstruktur, memudahkan pengguna untuk menavigasi dan memahami API. Ini sangat berguna bagi pengembang dan pemangku kepentingan lainnya yang membutuhkan pemahaman mendalam tentang cara API berfungsi.
    
4. **Mendukung Spesifikasi OpenAPI**
    
    Seperti Swagger, ReDoc sepenuhnya mendukung **OpenAPI Specification**, yang memungkinkan pengembang untuk mendokumentasikan API secara konsisten dengan standar industri.