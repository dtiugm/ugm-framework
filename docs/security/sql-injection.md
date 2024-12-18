# 13.1.1 SQL Injection

1. **Penjelasan singkat**
    
    SQL Injection terjadi ketika penyerang menyuntikkan kode SQL berbahaya ke dalam input yang digunakan dalam query database. Ini memungkinkan penyerang untuk memanipulasi query, mengakses data yang tidak sah, atau bahkan memodifikasi atau menghapus data.
    
2. **Dampak**
    - Akses data sensitif yang tidak sah.
    - Modifikasi atau penghapusan data.
    - Pengambilan kendali server database.
    - Bypass proses otentikasi
3. **Pencegahan**
    - **Parameterized Queries/Prepared Statements:** Selalu gunakan *parameterized queries* atau *prepared statements*. Ini akan memperlakukan *input* pengguna sebagai data, bukan bagian dari perintah SQL.
    - **ORM (Object-Relational Mapper):** Gunakan ORM seperti SQLAlchemy yang umumnya menyediakan mekanisme untuk mencegah SQL Injection secara otomatis.
    - **Input Validation:** Validasi *input* pengguna dan pastikan sesuai dengan format yang diharapkan.