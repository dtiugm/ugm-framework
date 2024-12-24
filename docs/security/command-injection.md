# 13.1.5 Command Injection

*Command Injection* terjadi ketika penyerang menyuntikkan perintah sistem operasi ke dalam *input* yang dieksekusi oleh aplikasi.

**Dampak dari Commad Injection yaitu:**

1. Eksekusi perintah arbitrer di server.
2. Pengambilan kendali server.
3. Akses data sensitif.

**Command Injection dapat dicegah dengan:**

1. **Hindari Eksekusi Perintah Sistem:** Sebisa mungkin, hindari eksekusi perintah sistem secara langsung.
2. **Input Validation:** Validasi *input* dengan sangat ketat.
3. **subprocess.run dengan Argumen Terpisah:** Jika eksekusi perintah sistem diperlukan, gunakan `subprocess.run` dengan argumen yang dipisahkan sebagai *list*, bukan sebagai *string*. Hindari `os.system` dan `os.popen`.
