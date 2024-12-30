# 9.2 Penamaan Tabel, View, Procedure, Function, Trigger, dan Event

## 9.2.1 Tabel

1. Penyesuaian nama tabel:
    - Tabel referensi diakhiri dengan `_ref`. Contoh: `agama_ref`.
    - Tidak boleh ada tabel dan referensi dengan nama yang sama dalam satu basis data. Contoh: tidak diizinkan ada table `pembayaran` dan `pembayaran_ref` dalam satu database.
    - Jika lebih dari satu kata, gunakan underscore (`_`) snake case dan huruf kecil. Contoh: `tipe_user_ref`.
    - Panjang maksimal nama tabel adalah 30 karakter (koordinasi dengan Tim Analisis Data jika melebihi).
2. Penulisan tabel backup/cadangan:
    - Format: `zz_[nama tabel]_[waktu]`
    - Contoh: `zz_dosen_20200312`
3. Penulisan tabel sementara (temporary):
    - Format: `_[nama tabel]`
    - Contoh: `_mahasiswa`
4. Penulisan tabel log:
    - Format: `[nama tabel]_log`
    - Contoh: `krs_log`

### Catatan:

- Audit dilakukan setiap tahun. Tabel tidak diperlukan akan dihapus.
- Retensi data tabel log selama 3 bulan, setelah itu dipindahkan ke basis data tampungan.

---

## 9.2.2 View

Penulisan dengan awalan `v_`:

- Format: `v_[nama view]`
- Contoh: `v_mahasiswa`

---

## 9.2.3 Procedure

Penulisan dengan awalan `p_`:

- Format: `p_[nama procedure]`
- Contoh: `p_pembayaran`

---

## 9.2.4 Function

Penulisan dengan awalan `f_`:

- Format: `f_[nama function]`
- Contoh: `f_krs`

---

## 9.2.4 Event

Penulisan dengan awalan `e_`:

- Format: `e_[nama event]`
- Contoh: `e_krs`

---

## 9.2.5 Trigger

Penulisan dengan awalan `t_`:

- Format: `t_before|after_insert|update|delete_[nama tabel]`
- Contoh:
    - `t_before_kelas`
    - `t_after_insert_kelas`
    - `t_update_kelas`