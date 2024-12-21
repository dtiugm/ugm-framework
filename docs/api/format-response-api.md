# 7.5 Format Response

## 7.5.1 Response JSON

Semua response dari API harus berformat JSON. Struktur response harus konsisten dan jelas. Misalnya:

```json
{ "status": "success", "data": {...}, "message": "Operation completed successfully" }
{"data1": {...}, "data2": "value2", "data3": "value3"}
```


## 7.5.2 Kode Status HTTP

Dalam hal ini mewajibkan penggunaan kode status HTTP yang tepat dan harus sesuai ketentuan. Kode status HTTP sangat penting untuk memberi tahu klien tentang status permintaan mereka. Beberapa kode status umum yang harus digunakan adalah:

1. `200 OK` untuk permintaan yang berhasil.
2. `201 Created` ketika data baru berhasil dibuat.
3. `400 Bad Request` apabila permintaan tidak valid.
4. `404 Not Found` apabila resource tidak ditemukan.
5. `401 Unauthorized` apabila permintaan membutuhakn autentikasi namun klient tidak mengirimkan kredensial yang sah.
6. `409 Confict` apabila permintaan tidak bisa diproses karena adanya konflik dengan status sumber daya.
7. `422 Unprocessable Entity` apabila data yang dikirim klient gagal divalidasi oleh server.
8. `500 Internal Server Error` untuk kesalahan di server.