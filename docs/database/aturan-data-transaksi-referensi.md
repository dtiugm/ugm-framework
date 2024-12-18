## 9.6 Aturan Data Transaksional dan Referensi

1. **Data Transaksional**: Diawali subjek sesuai fungsi.
    - **Contoh**: `staff_pelatihan`, `student_riwayat`
2. **Data Referensi Khusus Satu Fungsi**: Subjek + Penjelas + Sufiks `_ref`.
    - **Contoh**: `pelatihan_jenis_ref`, `kegiatan_tipe_ref`
3. **Data Referensi Khusus Banyak Fungsi**: Format serupa.
    - **Contoh**: `agama_ref`, `pendidikan_ref`

---

## 9.7 Penamaan Model Parent-Child

Untuk data dengan relasi parent dan child, gunakan format:

- **Parent**: `[nama_tabel]_id`
- **Child**: `[nama_tabel]_parent_id`**Contoh**:
- `riwayat_id` (parent)
- `riwayat_parent_id` (child)

---

## 9.8 Konvensi Penamaan Dataset

1. **Nama Tabel**: Diawali dengan prefiks klaster (`stud_`, `staff_`, `fin_`).
2. **Nama Dataset**:
    - Awalan `dataset_`
    - Diikuti klaster
    - **Contoh**: `dataset_student_registrasi`
3. **Nama Field**: Menyesuaikan data asal.
    - **Contoh**: `stud_niu`, `stud_nama`
4. **Field Baru untuk Pengelompokan**: Tambahkan prefix dari field referensi.
    - **Contoh**:
    Jika ada `provinsi_nama` → tambahkan `provinsi_regional`.
5. **Aliran Data di Dataset**: Searah.
6. **Label Field**: Menggunakan huruf kapital maksimal 30 karakter.
7. **Konten Data**: Tidak diizinkan `NULL`; jika kosong diganti dengan `N/A`.
8. **Tipe Data**:
Untuk field bertipe tanggal yang isinya bisa kosong → gunakan `VARCHAR`.
    - **Contoh**: `tanggal_lulus`

## 9.9 Konvensi Dataset

1. Nama tabel diawali dengan prefix klaster (e.g., `stud_`, `staff_`, `fin_`).
2. Nama dataset:
    - Awalan `dataset_`.
    - Diikuti nama klaster.
    - Contoh: `dataset_student_registrasi`.
3. Nama field mengikuti data asal.
    - Contoh: `stud_niu`, `stud_nama`.
4. Hindari nilai `NULL` di dataset. Jika kosong, gunakan `N/A`.
5. Jika tipe data memungkinkan null, gunakan tipe `varchar`.

### Contoh Penulisan Data Transaksional

- `staff_kegiatan_no_sk`
- `stud_tgl_lahir`

## 9.10 Data Referensi

1. Awali dengan subjek diikuti penjelas dan suffix `_ref`.
    - Contoh: `agama_ref`, `pendidikan_ref`.
2. Untuk model parent-child, tambahkan `parent_id`.
    - Contoh: `riwayat_id` (parent), `riwayat_parent_id` (child).