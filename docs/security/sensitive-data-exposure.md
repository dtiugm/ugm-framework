# 13.1.7 Sensitive Data Exposure

*Sensitive Data Exposure* terjadi ketika aplikasi mengungkapkan data sensitif, seperti kata sandi, nomor kartu kredit, informasi pribadi, atau kunci API, kepada pihak yang tidak berhak. 

**Celah keamanan diatas berdampak pada:**

1. Pencurian identitas.
2. Kerugian finansial.
3. Kerusakan reputasi.
4. Pelanggaran privasi.

**Pencegahannya yaitu dengan:**

1. **HTTPS:** Selalu gunakan HTTPS untuk mengenkripsi komunikasi.
2. **Enkripsi Data at Rest:** Enkripsi data sensitif yang disimpan di database.
3. **Hashing Password:** Jangan pernah menyimpan kata sandi dalam bentuk *plain text*. Gunakan *hashing algorithm* yang kuat seperti bcrypt atau Argon2.
4. **HTTP Security Headers:** Gunakan *header* keamanan HTTP seperti HSTS, X-Frame-Options, dan Content-Security-Policy.
5. **Logging yang Hati-hati:** Hindari mencatat data sensitif dalam *log*.