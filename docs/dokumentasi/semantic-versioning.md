## 16.6 *Semantic Versioning*

***Semantic Versioning* (SemVer)** adalah sistem penomoran versi yang digunakan untuk memberikan informasi tentang perubahan yang terjadi pada perangkat lunak, sehingga pengembang dan pengguna dapat memahami apa yang telah berubah hanya dengan melihat nomor versinya.

### 16.6.1 Format *Semantic Versioning*

*Semantic Versioning* menggunakan format **MAJOR.MINOR.PATCH**, yang memiliki arti sebagai berikut:

1. **MAJOR**: Perubahan besar yang tidak kompatibel dengan versi sebelumnya.
    - Contoh: Merombak API sehingga aplikasi menjadi tidak kompatibel dengan versi sebelumnya, maka versi menjadi `2.0.0` (*increment* pada digit pertama, dan nol kan digit kedua serta ketiga)
2. **MINOR**: Penambahan fitur baru yang kompatibel dengan versi sebelumnya.
    - Contoh: Menambahkan fitur pencarian baru, maka versi menjadi `1.2.0` (*increment* pada digit kedua, dan nol kan digit ketiga)
3. **PATCH**: Perbaikan *bug* atau perubahan kecil yang tidak mengubah kompatibilitas.
    - Contoh: Memperbaiki bug kecil, maka versi menjadi `1.1.1` (*increment* pada digit ketiga)

### 16.6.2 Contoh Versi:

```markdown
1.2.3
MAJOR (1): Perubahan besar
MINOR (2): Penambahan fitur
PATCH (3): Perbaikan bug

```

### 16.6.3 *Pre-release* dan *Build Metadata*

Selain ***MAJOR.MINOR.PATCH***, *SemVer* juga mendukung:

- ***Pre-release Versions***: Ditambahkan dengan tanda minus (-), misalnya:
    - `1.0.0-alpha`
    - `1.0.0-beta`
    - `1.0.0-rc.1`
- ***Build Metadata***: Ditambahkan dengan tanda plus (+), misalnya:
    - `1.0.0+20130313144700`