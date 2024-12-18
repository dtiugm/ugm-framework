# 13.1.5 Command Injection

1. **Penjelasan singkat**
    
    *Command Injection* terjadi ketika penyerang menyuntikkan perintah sistem operasi ke dalam *input* yang dieksekusi oleh aplikasi.
    
2. **Dampak**
    - Eksekusi perintah arbitrer di server.
    - Pengambilan kendali server.
    - Akses data sensitif.
3. **Pencegahan**
    - **Hindari Eksekusi Perintah Sistem:** Sebisa mungkin, hindari eksekusi perintah sistem secara langsung.
    - **Input Validation:** Validasi *input* dengan sangat ketat.
    - **subprocess.run dengan Argumen Terpisah:** Jika eksekusi perintah sistem diperlukan, gunakan `subprocess.run` dengan argumen yang dipisahkan sebagai *list*, bukan sebagai *string*. Hindari `os.system` dan `os.popen`.