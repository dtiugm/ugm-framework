# 9.3 Penamaan Field

## 9.3.1 Aturan Penamaan

1. Nama field diawali dengan nama tabel tanpa akhiran.
    - Contoh:
        - Nama tabel: `mahasiswa`
        - Nama field: `mahasiswa_id`, `mahasiswa_nama`
2. Menggunakan huruf kecil (lower case).
3. Jika ada lebih dari satu referensi dalam satu tabel, gunakan label (ekstensi) tambahan.
    - Contoh: `kab_id_lahir`, `kab_id_alamat`
4. Jika lebih dari dua kata, gunakan underscore (`_`) atau snake case.
    - Contoh: `jadwal_kuliah`, `dosen_nama`
5. Panjang maksimal nama field adalah 30 karakter (koordinasi dengan Tim Analisis Data jika melebihi).
6. Gunakan Bahasa Indonesia sesuai EYD.
7. Tipe data boolean menggunakan `tinyint(1)` dengan nilai `0` (tidak) dan `1` (ya).
     - Contoh: `is_admin`, `is_aktif`

| No | Nama Field | No | Nama Field | No | Nama Field |
| -- | --- | --- | --- | --- | --- |
| 1 | `is_admin` | 11 | `is_kirim` | 21 | `is_refresh` |
| 2 | `is_agenda` | 12 | `is_lock` | 22 | `is_sync` |
| 3 | `is_aktif` | 13 | `is_notif` | 23 | `is_tampil` |
| 4 | `is_approve` | 14 | `is_paraf` | 24 | `is_tim` |
| 5 | `is_default` | 15 | `is_pdf` | 25 | `is_ttd` |
| 6 | `is_delete` | 16 | `is_private` | 26 | `is_ugm` |
| 7 | `is_disposisi` | 17 | `is_proses` | 27 | `is_update` |
| 8 | `is_favorit` | 18 | `is_public` | 28 | `is_use` |
| 9 | `is_finish` | 19 | `is_publish` | 29 | `is_valid` |
| 10 | `is_image` | 20 | `is_post` | 30 | `is_verified` |

Keterangan tabel:

1. Wajib menyertakan komentar (comment) untuk field.
2. Isian default tergantung kebutuhan.

---

## 9.3.2 Field Wajib pada Tabel

Berikut ini field wajib pada tabel:

| **No** | **Field Wajib** | **Tipe Data** |
| --- | --- | --- |
| 1 | `created_by`  | varchar(50) |
| 2 | `created_time` | datetime |
| 3 | `updated_by`  | varchar(50) |
| 4 | `updated_time`  | datetime |
| 5 | `timestamp_server`  | timestamp, dengan default `current_timestamp` |

Contoh penulisan nama field umum digunakan:

| No  | Nama Panjang          | Singkatan           |
|-----|-----------------------|---------------------|
| 1   | mahasiswa            | mhs *(deprecated)* |
| 2   | program studi        | prodi              |
| 3   | mata kuliah          | mk                 |
| 4   | staff                | staff              |
| 5   | dosen                | dosen              |
| 6   | tenaga kependidikan  | tendik             |
| 7   | indonesia            | ind                |
| 8   | inggris              | eng                |
| 9   | fakultas             | fak                |
| 10  | biodata              | biodata            |
| 11  | akademik             | akd                |
| 12  | universitas          | univ               |
| 13  | registrasi           | reg                |
| 14  | kabupaten            | kab                |
| 15  | kecamatan            | kec                |
| 16  | kelurahan            | kel                |
| 17  | provinsi             | prov               |
| 18  | tanggal ...          | tgl_               |
| 19  | evaluasi dosen       | eval_dosen         |
| 20  | deskripsi            | deskripsi          |
| 21  | keterangan           | keterangan         |
| 22  | semester             | semester           |
| 23  | periode              | periode            |
| 24  | sesi                 | sesi               |
| 25  | jenjang              | jenjang            |
| 26  | status               | status             |
| 27  | jenis                | jenis              |
| 28  | jenis kelamin        | jenis_kelamin      |
| 29  | tanggal lahir        | tgl_lahir          |
| 30  | kategori             | kategori           |
| 31  | kategori             | kategori           |
| 32  | tipe                 | tipe               |
| 33  | kelompok             | kelompok           |
| 34  | grup                 | grup               |
| 35  | jadwal kuliah        | jadwal_kuliah      |
| 36  | jadwal ujian         | jadwal_ujian       |
| 37  | unit kerja           | unit_kerja         |
| 38  | satuan kerja         | satker             |
| 39  | nomor telepon        | no_telp            |
| 40  | nomor handphone      | no_hp              |
| 41  | nomor rumah          | no_rumah           |
| 42  | nomor kantor         | no_kantor          |
| 43  | nomor rekening       | no_rekening        |
| 44  | informasi            | info               |
| 45  | tanda tangan         | ttd                |
| 46  | nomor peserta        | no_peserta         |
| 47  | tes                  | ujian              |
| 48  | exam                 | ujian              |
| 49  | orang tua            | ortu               |
| 50  | ujian terbuka        | ujian_terbuka      |
| 51  | tugas akhir          | tugas_akhir        |
| 52  | tahun anggaran       | thn_anggaran       |
| 53  | bulan ...            | bln_... *(default tidak disingkat)* |
| 54  | tahun ...            | thn_... *(default tidak disingkat)* |
| 55  | angkatan             | angkatan           |
| 56  | jumlah               | jml                |
| 57  | laporan ...          | lap_...            |
| 58  | pembayaran           | pembayaran         |
| 59  | tagihan              | tagihan            |
| 60  | pembayaran tagihan   | pembayaran_tagihan |

---

## 9.3.3 Penamaan Field Berkas

Berikut ini penamaan field berkas:

| No | Format | Contoh |
| --- | --- | --- |
| 1 | `[nama tabel]_file_fullpath` | `staff_kp_sk_fullpath` |
| 2 | `[nama tabel]_file_filename` | `staff_rekening_file_filename` |
| 3 | `[nama tabel]_file_path` | `staff_kgb_sk_file_fullpath` |

---

## 9.3.4 Field Mapping dari Database Lain

1. Gunakan nama database asal sebagai prefix.
    - Format: `[nama_database_asal]_[nama_field_asal]`
    - Contoh: `ugm_hris_pkrjnId`
2. Tambahkan komentar berisi referensi asal field.
    - Contoh: "ugm_hris.pub_ref_pekerjaan"

### Catatan Tambahan

1. Nama kolom untuk akun UGM cukup dengan `username`.
2. Untuk akun lain, tambahkan penjelas pada nama field.
    - Contoh: `mitra_instagram_username`

### Penamaan Index dan Foreign Key

Sesuaikan dengan standar penamaan pada aplikasi SQLyog atau kebutuhan lain.

---

## 9.3.5 Tabel Referensi Utama

- **`master.student_master`**:
    
    Tabel ini digunakan sebagai data pokok bersama dengan tim lain (aplikasi lain).
    
    - Contoh penggunaan:
        - Forlap: `id_reg_pd`, `nipd`
        - Sister: `ankt_mhs`
        - Tracer: `tracer_mhs_id`
    - Jika ada penambahan/pengurangan field, harus didiskusikan terlebih dahulu dengan tim terkait.
- **`master_student.student_detail`**:
    
    Digunakan untuk kebutuhan klaster student seperti *STATUS mhs* (keluar) dan *tanggal keluar*.
    
---

## 9.3.6 Field dari Aplikasi Lain

Field yang berasal dari aplikasi eksternal diberikan prefiks nama aplikasi asal.

**Contoh**:

- **Forlap/PDDIKTI**: `forlap_`
    - Contoh: `forlap_nipd`, `forlap_id_sms`
- **SISTER**: `sister_`
    - Contoh: `sister_sdm`

---

## 9.3.7 Penggunaan Field `is_`

Field dengan awalan `is_` menggunakan tipe data `TINYINT(1)` dengan tanda/flag `unsigned`.

- **Contoh**: `is_aktif` (`0: tidak aktif`, `1: aktif`).

---

## 9.3.8 Pengambilan/Migrasi Data dari Aplikasi Lain

1. Jika data diambil **secara penuh** (terdapat relasi di dalamnya):
    - Nama database mengikuti database asal ditambah **suffix `_public`**.
    - **Contoh**: `sister_public_pdrd`
2. Jika data diambil **tanpa relasi**:
    - Nama database ditambah **suffix `_public_data`**.
    - **Contoh**: `sister_public_pdrd_data`

---

## 9.3.9 Prefiks Penamaan Database

1. **`simaster_`**:
Digunakan untuk database yang digunakan di semua klaster.
    - **Contoh**: `simaster_survey`, `simaster_presensi`
2. **`master_`**:
Digunakan hanya untuk referensi di klaster tertentu.
    - **Contoh**: `master_staff`, `master_student`, `master_finance`

### Catatan Khusus

1. Database `event` → **seharusnya**: `simaster_event`
2. Database `grafik_dashboard` → **seharusnya**: `simaster_statistik_grafik`
3. Database yang sudah ada diubah secara bertahap sesuai konvensi dengan koordinasi terlebih dahulu.

---