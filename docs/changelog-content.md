# Bab 16 Changelog, Pre-release, Semantic Versioning, dan Commit Message

## 16.1 Pengertian Changelog

**Changelog** adalah sebuah catatan atau dokumentasi yang mencatat semua perubahan, pembaruan, perbaikan bug, atau perubahan lainnya yang terjadi pada suatu perangkat lunak, sistem, atau produk selama pengembangannya. Changelog berfungsi sebagai referensi bagi pengembang dan pengguna untuk mengetahui fitur baru, pembaruan, dan perbaikan yang telah dilakukan pada suatu versi atau rilisan.

Changelog sering digunakan dalam proyek perangkat lunak untuk memudahkan pengguna dan pengembang dalam melacak perubahan apa saja yang telah dilakukan sejak versi sebelumnya. Ini membantu pengguna dalam mengetahui perbedaan antara versi yang mereka gunakan dengan versi yang baru dirilis.

## 16.2 Tujuan Changelog

Changelog memiliki beberapa tujuan penting, antara lain:

1. **Menyediakan riwayat perubahan**: Dengan adanya changelog, pengguna dan pengembang bisa mengetahui perubahan apa saja yang sudah dilakukan dari versi ke versi.
2. **Meningkatkan transparansi**: Changelog memberikan transparansi terhadap perkembangan suatu proyek perangkat lunak atau aplikasi, sehingga pengguna bisa memantau kemajuan dan perbaikan yang dilakukan.
3. **Membantu pengembang dalam melacak perubahan**: Pengembang bisa menggunakan changelog untuk mencatat dan melacak perbaikan atau penambahan fitur yang telah dilakukan dalam berbagai rilis.
4. **Membantu dalam perencanaan rilis selanjutnya**: Dengan mencatat perubahan yang telah dilakukan, pengembang bisa merencanakan perbaikan atau pembaruan di masa depan lebih terstruktur.

## 16.3 Struktur Umum Changelog

Umumnya, changelog disusun dengan format yang terstruktur agar mudah dipahami. Berikut adalah struktur dasar dalam sebuah changelog:

1. **Versi dan Tanggal Rilis**: Setiap entri changelog dimulai dengan nomor versi dan tanggal rilisnya. Ini penting untuk mengidentifikasi kapan suatu perubahan diterapkan.
2. **Kategori Perubahan**: Changelog biasanya mengelompokkan perubahan berdasarkan kategori tertentu, misalnya:
    - **Added**: Fitur baru yang ditambahkan.
    - **Changed**: Fitur yang diubah atau diperbarui.
    - **Fixed**: Bug yang diperbaiki.
    - **Deprecated**: Fitur yang tidak lagi didukung atau akan dihapus di versi mendatang.
    - **Removed**: Fitur yang dihapus.
    - **Security**: Pembaruan terkait dengan keamanan.
3. **Deskripsi Singkat tentang Perubahan**: Deskripsi singkat yang jelas dan ringkas mengenai setiap perubahan atau perbaikan yang dilakukan, agar pengguna bisa memahami manfaat dari pembaruan tersebut.
4. **Referensi atau Tautan (Opsional)**: Beberapa changelog menyertakan tautan atau referensi ke tiket, isu, atau permintaan penggabungan (*pull request*) di sistem pengelolaan kode sumber untuk memberi informasi lebih rinci tentang perubahan.

## 16.4 Contoh Penulisan Changelog

Berikut adalah contoh changelog yang disusun dengan mengikuti struktur di atas:

```markdown
## [2.1.0] - 2024-12-01

### Added
- Menambahkan fitur sinkronisasi antar perangkat untuk memudahkan akses data.
- Menambahkan dukungan untuk bahasa Spanyol pada aplikasi.

### Changed
- Memperbarui desain antarmuka pengaturan agar lebih responsif di perangkat mobile.
- Menyempurnakan algoritma pencarian untuk meningkatkan kecepatan.

### Fixed
- Memperbaiki bug pada login yang gagal pada perangkat iOS 14.

### Removed
- Menghapus dukungan untuk Android versi 8 ke bawah, karena tidak lagi kompatibel dengan teknologi baru.

```

---

## 16.5 Pre-release

**Pre-release** merujuk pada versi perangkat lunak yang belum sepenuhnya siap untuk rilis final atau publik. Pre-release ini biasanya berfungsi sebagai versi percobaan atau uji coba yang dirilis kepada pengguna atau pengembang tertentu untuk mendapatkan umpan balik dan mendeteksi bug sebelum rilis resmi.

### 16.5.1 Jenis Pre-release

1. **Alpha**: Versi awal yang sering kali tidak stabil dan masih banyak bug. Biasanya hanya dirilis untuk pengujian internal.
2. **Beta**: Versi yang lebih stabil dibandingkan alpha, namun masih memiliki beberapa masalah. Beta sering kali dirilis untuk pengujian publik atau untuk sekelompok pengguna tertentu yang memberikan umpan balik.
3. **Release Candidate (RC)**: Versi yang sudah sangat mendekati versi final, dengan sebagian besar bug sudah diperbaiki. Meskipun demikian, beberapa masalah kecil mungkin masih ada.

### 16.5.2 Contoh Penulisan Changelog untuk Pre-release

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

---

## 16.6 Semantic Versioning

**Semantic Versioning (SemVer)** adalah sistem penomoran versi yang digunakan untuk memberi informasi tentang perubahan yang terjadi pada perangkat lunak, sehingga pengembang dan pengguna dapat memahami apa yang telah berubah hanya dengan melihat nomor versinya.

### 16.6.1 Format Semantic Versioning

Semantic Versioning menggunakan format **MAJOR.MINOR.PATCH**, yang memiliki arti sebagai berikut:

1. **MAJOR**: Perubahan besar yang tidak kompatibel dengan versi sebelumnya.
    - Contoh: Merombak API sehingga aplikasi menjadi tidak kompatibel dengan versi sebelumnya, maka versi menjadi `2.0.0`.
2. **MINOR**: Penambahan fitur baru yang kompatibel dengan versi sebelumnya.
    - Contoh: Menambahkan fitur pencarian baru, maka versi menjadi `1.2.0`.
3. **PATCH**: Perbaikan bug atau perubahan kecil yang tidak mengubah kompatibilitas.
    - Contoh: Memperbaiki bug kecil, maka versi menjadi `1.1.1`.

### 16.6.2 Contoh Versi:

```markdown
1.2.3
MAJOR (1): Perubahan besar
MINOR (2): Penambahan fitur
PATCH (3): Perbaikan bug

```

### 16.6.3 Pre-release dan Build Metadata

Selain **MAJOR.MINOR.PATCH**, SemVer juga mendukung:

- **Pre-release Versions**: Ditambahkan dengan tanda minus (-), misalnya:
    - `1.0.0-alpha`
    - `1.0.0-beta`
    - `1.0.0-rc.1`
- **Build Metadata**: Ditambahkan dengan tanda plus (+), misalnya:
    - `1.0.0+20130313144700`

---

## 16.7 Commit Message

**Commit message** adalah pesan yang ditulis saat melakukan commit dalam sistem kontrol versi seperti Git. Tujuannya adalah untuk menjelaskan perubahan yang dilakukan dalam kode agar mudah dipahami.

### 16.7.1 Struktur Commit Message

1. **Tipe**:
    - `feat`: Menambahkan fitur baru.
    - `fix`: Memperbaiki bug.
    - `docs`: Memperbarui dokumentasi.
    - `style`: Perubahan format atau gaya kode.
    - `refactor`: Perbaikan struktur kode tanpa mengubah fungsionalitas.
    - `perf`: Meningkatkan kinerja aplikasi.
    - `test`: Menambah atau memperbaiki pengujian.
    - `chore`: Tugas pemeliharaan rutin.
    - `ci`: Perubahan pada CI/CD.
    - `build`: Perubahan sistem build atau dependensi.
    - `revert`: Mengembalikan commit sebelumnya.
2. **Scope (Opsional)**: Area spesifik dalam proyek.
3. **Ringkasan**: Deskripsi singkat dengan kalimat perintah (imperatif).

### 16.7.2 Contoh Commit Message yang Baik

```markdown
feat(auth): Tambahkan sistem login dengan Google
fix(ui): Perbaiki bug pada tombol checkout di iOS
docs(readme): Perbarui instruksi instalasi di README

```

---

### 16.7.2 Kesimpulan

Changelog, Semantic Versioning, dan Commit Message membantu menjaga transparansi, komunikasi, dan pemeliharaan kode yang baik dalam pengembangan perangkat lunak. Dengan mengikuti pedoman ini, proyek perangkat lunak dapat berkembang lebih terstruktur dan mudah dipahami oleh semua pihak yang terlibat.