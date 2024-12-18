# 13.1.7 Sensitive Data Exposure

1. **Penjelasan singkat**
    
    *Sensitive Data Exposure* terjadi ketika aplikasi mengungkapkan data sensitif, seperti kata sandi, nomor kartu kredit, informasi pribadi, atau kunci API, kepada pihak yang tidak berhak. 
    
2. **Dampak**
    - Pencurian identitas.
    - Kerugian finansial.
    - Kerusakan reputasi.
    - Pelanggaran privasi.
3. **Pencegahan**
    - **HTTPS:** Selalu gunakan HTTPS untuk mengenkripsi komunikasi.
    - **Enkripsi Data at Rest:** Enkripsi data sensitif yang disimpan di database.
    - **Hashing Password:** Jangan pernah menyimpan kata sandi dalam bentuk *plain text*. Gunakan *hashing algorithm* yang kuat seperti bcrypt atau Argon2.
    - **HTTP Security Headers:** Gunakan *header* keamanan HTTP seperti HSTS, X-Frame-Options, dan Content-Security-Policy.
    - **Logging yang Hati-hati:** Hindari mencatat data sensitif dalam *log*.