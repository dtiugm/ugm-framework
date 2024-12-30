## 16.7 *Commit Message*

***Commit message*** adalah pesan yang ditulis saat melakukan commit dalam sistem kontrol versi seperti Git. Tujuannya adalah untuk menjelaskan perubahan yang dilakukan dalam kode agar mudah dipahami.

### 16.7.1 Struktur *Commit Message*

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

### 16.7.2 Contoh *Commit Message* yang Baik

```markdown
feat(auth): Tambahkan sistem login dengan Google
fix(ui): Perbaiki bug pada tombol checkout di iOS
docs(readme): Perbarui instruksi instalasi di README

```