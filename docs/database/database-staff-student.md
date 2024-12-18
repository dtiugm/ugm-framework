# 9.4 Tambahan Database Staff

1. **Data Transaksional**: Menggunakan tabel dengan prefiks `staff_`.
    - **Contoh**: `staff_kegiatan`
2. **Data Referensi**: Menggunakan format `[nama_tabel]_ref`.
    - **Contoh**: `staff_golongan_ref`

**Catatan**: Tabel yang sudah ada bertahap diubah sesuai konvensi dengan koordinasi terlebih dahulu.

---

# 9.5 Tambahan Database Student

1. **Nama Tabel dan Database**: Menggunakan awalan `student_`.
2. **Kolom**:
    - Jika disingkat:
        - `Student` → `stud`
        - `Nomor` → `no`
        - `Tanggal` → `tgl`
        - `Program Studi` → `prodi`
3. **Contoh Penulisan**:
    - `staff_kegiatan_no_sk`
    - `stud_tgl_lahir`
    - `staff_pasangan_no_sk`
    - `staff_pasangan_no_telepon_tetangga`
    - `staff_pasangan_tgl_cerai`

**Catatan**: Kata umum seperti *Indonesia* tidak perlu disingkat.

- Contoh:
    - Nama Fakultas → `fakultas_cetak` (versi Indonesia)
    - Nama Fakultas → `fakultas_cetak_english` (versi Inggris)

---