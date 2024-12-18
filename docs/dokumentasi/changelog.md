# 16.1 Pengertian Changelog

**Changelog** adalah sebuah catatan atau dokumentasi yang mencatat semua perubahan, pembaruan, perbaikan bug, atau perubahan lainnya yang terjadi pada suatu perangkat lunak, sistem, atau produk selama pengembangannya. Changelog berfungsi sebagai referensi bagi pengembang dan pengguna untuk mengetahui fitur baru, pembaruan, dan perbaikan yang telah dilakukan pada suatu versi atau rilisan.

Changelog sering digunakan dalam proyek perangkat lunak untuk memudahkan pengguna dan pengembang dalam melacak perubahan apa saja yang telah dilakukan sejak versi sebelumnya. Ini membantu pengguna dalam mengetahui perbedaan antara versi yang mereka gunakan dengan versi yang baru dirilis.

# 16.2 Tujuan Changelog

Changelog memiliki beberapa tujuan penting, antara lain:

1. **Menyediakan riwayat perubahan**: Dengan adanya changelog, pengguna dan pengembang bisa mengetahui perubahan apa saja yang sudah dilakukan dari versi ke versi.
2. **Meningkatkan transparansi**: Changelog memberikan transparansi terhadap perkembangan suatu proyek perangkat lunak atau aplikasi, sehingga pengguna bisa memantau kemajuan dan perbaikan yang dilakukan.
3. **Membantu pengembang dalam melacak perubahan**: Pengembang bisa menggunakan changelog untuk mencatat dan melacak perbaikan atau penambahan fitur yang telah dilakukan dalam berbagai rilis.
4. **Membantu dalam perencanaan rilis selanjutnya**: Dengan mencatat perubahan yang telah dilakukan, pengembang bisa merencanakan perbaikan atau pembaruan di masa depan lebih terstruktur.

# 16.3 Struktur Umum Changelog

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

# 16.4 Contoh Penulisan Changelog

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