# 7.5 Format Respons

## 7.5.1 Respons JSON

- Semua respons dari API harus berformat JSON. Struktur respons harus konsisten dan jelas. Misalnya:

    ```json
    { "status": "success", "data": {...}, "message": "Operation completed successfully" }
    ```
    
    ```json 
    {"data1": {...}, "data2": "value2", "data3": "value3"}
    ```


## 7.5.2 Kode Status HTTP

- Wajib menggunakan kode status HTTP yang tepat. Kode status HTTP harus sesuai ketentuan.
- Kode status HTTP sangat penting untuk memberi tahu klien tentang status permintaan mereka. Beberapa kode status umum yang harus digunakan adalah:
    - `200 OK` untuk permintaan yang berhasil.
    - `201 Created` ketika data baru berhasil dibuat.
    - `400 Bad Request` jika permintaan tidak valid.
    - `404 Not Found` jika resource tidak ditemukan.
    - `401 Unauthorized` jika permintaan membutuhakn autentikasi tetapi klient tidak mengirimkan kredensial yang sah.
    - `409 Confict` jika permintaan tidak bisa di proses karena adanya konflik dengan status sumber daya.
    - `422 Unprocessable Entity` jika data yang dikirim klient gagal divalidasi oleh server.
    - `500 Internal Server Error` untuk kesalahan di server.