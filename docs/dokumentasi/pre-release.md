# 16.5 Pre-release

**Pre-release** merujuk pada versi perangkat lunak yang belum sepenuhnya siap untuk rilis final atau publik. Pre-release ini biasanya berfungsi sebagai versi percobaan atau uji coba yang dirilis kepada pengguna atau pengembang tertentu untuk mendapatkan umpan balik dan mendeteksi bug sebelum rilis resmi.

## 16.5.1 Jenis Pre-release

1. **Alpha**: Versi awal yang sering kali tidak stabil dan masih banyak bug. Biasanya hanya dirilis untuk pengujian internal.
2. **Beta**: Versi yang lebih stabil dibandingkan alpha, namun masih memiliki beberapa masalah. Beta sering kali dirilis untuk pengujian publik atau untuk sekelompok pengguna tertentu yang memberikan umpan balik.
3. **Release Candidate (RC)**: Versi yang sudah sangat mendekati versi final, dengan sebagian besar bug sudah diperbaiki. Meskipun demikian, beberapa masalah kecil mungkin masih ada.

## 16.5.2 Contoh Penulisan Changelog untuk Pre-release

Pre-release dapat ditandai dengan menambahkan label seperti "beta", "alpha", atau "RC" (Release Candidate) pada nomor versi, sehingga pengguna tahu bahwa versi tersebut belum sepenuhnya stabil. Berikut adalah contoh changelog yang mencakup pre-release:

```markdown
## [2.1.0-beta1] - 2024-12-01

### Added
- Menambahkan fitur sinkronisasi antar perangkat (percakapan awal dengan pengujian terbatas).
- Menambahkan dukungan awal untuk bahasa Spanyol pada aplikasi.

### Fixed
- Memperbaiki bug crash pada aplikasi saat membuka file besar.

### Known Issues
- Beberapa pengguna melaporkan aplikasi crash saat login di perangkat dengan Android 12.

```