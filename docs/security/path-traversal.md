# 13.1.4 Path Traversal

*Path Traversal* memungkinkan penyerang untuk mengakses file dan direktori yang tidak seharusnya dapat diakses, dengan memanipulasi *input* yang digunakan untuk merujuk ke lokasi *file* di server. Penyerang menggunakan karakter seperti `../` untuk naik ke direktori *parent* dan mengakses *file* sensitif di luar direktori yang dituju.

Hal tersebut berdampak pada akses ke *file* konfigurasi, *log*, atau data sensitif lainnya.

**Pencegahan terhadap celah tersebut dengan:**

1. **Input Validation/Whitelisting:** Validasi *input* dan hanya izinkan karakter atau *path* yang diizinkan. Gunakan *whitelist*.
2. **Canonicalization:** Gunakan fungsi seperti `os.path.abspath()` untuk membersihkan *path* dan menghilangkan komponen seperti `../`.
3. **Hindari Input Langsung untuk Path:** Jangan pernah menggunakan *input* pengguna secara langsung untuk membangun *path file*. Gunakan `os.path.join()` untuk menggabungkan *path* dengan aman.
