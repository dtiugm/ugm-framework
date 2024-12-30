# 9.1 Penamaan Basis Data

## 9.1.1 Klaster

Penamaan basis data berdasarkan klaster:

| No | Klaster | Format | Contoh |
| --- | --- | --- | --- |
| 1 | Student | `student_[nama basis data]` | `staff_rekrutmen` |
| 2 | Finance | `fin_[nama basis data]` | `student_sia` |
| 3 | Staff | `staff_[nama basis data]` | `fin_pajak` |

---

## 9.1.2 Aplikasi SIMASTER

Penulisan dengan awalan `simaster` diikuti nama basis data:

- Format: `simaster_[nama basis data]`
- Contoh: `simaster_surat`

---

## 9.1.3 Master (Deprecated)

Penulisan dengan awalan `master` diikuti nama klaster:

- Format: `master_[nama klaster]`
- Contoh: `master_staff`

---

## 9.1.4 Aplikasi Non-SIMASTER (Deprecated)

Penulisan dengan awalan `ugm` diikuti nama basis data:

- Format: `ugm_[nama basis data]`
- Contoh: `ugm_email`

---

## 9.1.5 Aplikasi dengan Pihak Luar

Penulisan dengan awalan `mitra` diikuti nama basis data:

- Format: `mitra_[nama basis data]`
- Contoh: `mitra_portal`

### Catatan:

1. **Dilarang** menggunakan nama unit kerja setelah awalan.
2. **Gunakan** Bahasa Indonesia sesuai EYD.