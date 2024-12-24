# 13.1.1 SQL Injection

SQL Injection terjadi ketika penyerang menyuntikkan kode SQL berbahaya ke dalam input yang digunakan dalam query database. Ini memungkinkan penyerang untuk memanipulasi query, mengakses data yang tidak sah, atau bahkan memodifikasi atau menghapus data.

SQL Injection berdampak pada:

1. Akses data sensitif yang tidak sah.
2. Modifikasi atau penghapusan data.
3. Pengambilan kendali server database.
4. Bypass proses otentikasi

**Hal diatas dapat dicegah dengan:**

1. **Parameterized Queries/Prepared Statements:** Selalu gunakan *parameterized queries* atau *prepared statements*. Ini akan memperlakukan *input* pengguna sebagai data, bukan bagian dari perintah SQL.
2. **ORM (Object-Relational Mapper):** Gunakan ORM seperti SQLAlchemy yang umumnya menyediakan mekanisme untuk mencegah SQL Injection secara otomatis.
3. **Input Validation:** Validasi *input* pengguna dan pastikan sesuai dengan format yang diharapkan.
