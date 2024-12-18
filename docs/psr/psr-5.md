# 6.14 PSR-5 PHPDoc Standard

PSR-5 merupakan tata cara penulisan dokumentasi yang lengkap dan sesuai standar menggunakan PHPDoc. Harapannya adalah pengembang dapat membuat dokumentasi yang konsisten, mudah dibaca, dan dapat diproses secara otomatis seperti IDE, generator dokumentasi, maupun alat analisis kode lainnya.  Dalam konteks PHP, PHPDoc, DocBlock, dan DocComment saling berhubungan, tetapi memiliki perbedaan spesifik dalam penggunaan dan terminologinya. 

### 6.14.1. **PHPDoc**

PHPDoc adalah format “standar” yang digunakan untuk mendokumentasikan kode PHP. PHPDoc menyediakan aturan dan konvensi tertentu untuk membuat dokumentasi dalam kode PHP agar dapat dipahami oleh manusia maupun alat analisis otomatis seperti IDE (PhpStorm), alat dokumentasi (phpDocumentor), atau alat analisis statis (PHPStan, Psalm). PHPDoc merupakan bagian dari dokumentasi yang memberikan informasi tentang struktur elemen dalam kode PHP yang biasanya diletakkan pada suatu function, method, class, atau property. 
Hal penting untuk dipahami bahwa PHPDoc, DocBlock, DocComment adalah hal yang berbeda. 

Contoh PHPDocs dengan komentar, tag, dan metadata yang telah terstandardisasi:

```php
/**
 * Menambahkan dua angka.
 *
 * @param int $a Angka pertama.
 * @param int $b Angka kedua.
 * @return int Hasil penjumlahan.
 */
function add(int $a, int $b): int {
    return $a + $b;
}
```

### 6.14.2. **DocComment**

DocComment adalah istilah umum yang mencakup semua jenis komentar yang ditulis ****DocBlock. Biasanya PHP dapat mengenali DocComment di dalam DocBlock yang menggunakan format `/** ... */` (bukan `/* ... */` atau `//`yang pada implementasi pengembangan sering dijumpai). Apabila komentar dibuat menggunakan format `/* ... */` atau `//`disebut komentar biasa yang tidak dapat dipahami oleh alat dokumentasi (biasanya ditujukan untuk manusia). Komentar biasa umumnya digunakan untuk meninggalkan pesan/penjelasan sebagai pengingat/petunjuk untuk pengembang berikutnya. 

Berikut aturan penulisan DocComment:

1. Dimulai dengan barisan karakter `/**` kemudiaan diikuti whitespace
2. Diakhiri dengan `*/` 
3. Dapat ditulis dalam satu atau beberapa baris

Contoh single line:

```php
/** ... */
```

Apabila DocComment terdiri labih dari satu baris maka setiap baris harus diikuti dengan karakter `(*)` yang sejajar dengan klausa pembuka. 

Contoh multiple line:

```php
/**
 * <...>
 * <...>
 */
```

### 6.14.3. **DocBlock**

DocBlock adalah istilah untuk menyebut blok komentar PHPDoc yang digunakan untuk mendokumentasikan elemen kode tertentu, seperti fungsi, kelas, properti, atau file. Karakteristik DocBlock yaitu selalu dimulai dengan `/**` dan diakhiri dengan `*/` , serta berada tepat diatas elemen yang didokumentasikan. DocBlock terdiri dari 3 bagian yaitu deskripsi singkat (summary), deskripsi panjang (opsional) dan tag metadata (opsional). Deskripsi singkat berisi penjelasan ringkas tentang elemen kode tersebut dalam 1 atau 2 kalimat. Deskripsi panjang berisi penjelasan lebih rinci tentang elemen kode, termasuk konteks, asumsi, atau contoh penggunaan.

Contoh lengkap DocBlock:

```php
/**
 * Kelas untuk menghitung operasi matematika.
 *
 * @author Emiliano Purnomo
 * @since 1.0.0
 */
class Calculator {
    /**
     * @var int Menyimpan hasil terakhir.
     */
    private int $result;

    /**
     * Menambahkan dua angka.
     *
     * @param int $a Angka pertama.
     * @param int $b Angka kedua.
     * @return int Hasil penjumlahan.
     */
    public function add(int $a, int $b): int {
        $this->result = $a + $b;
        return $this->result;
    }
}
```

Contoh diatas memiliki 3 buah DocBlock. Yang pertama adalah pada bagian class menjelaskan kegunaan secara global. Yang kedua berada di atas property (deklarasi variabel global didalam class tersebut). Dan yang ketiga adalah diatas method/function untuk menjelaskan secara teknis mengenai method/function tersebut seperti deskripsi, hasil kembalian method, juga parameter pendukungnya.

### 6.14.4. Manfaat

Adapun manfaat dengan menerapkan PHPDoc standard PSR-5 adalah sebagai berikut:

1. Meningkatkan keterbacaan dan pemahaman kode karena dokumentasi disusun menggunakan pedoman yang konsisten yang sudah ditentukan.
2. Mempermudah pemeliharan kode karena adanya standar yang jelas.
3. Mempermudah kolaborasi antar pengembang dalam project karena mengikuti standard yang sama
4. Dukungan terhadap alat pembantu (tools) dokumentasi dan analisis secara otomatis yang kompatibel dengan PSR-5 (PHPDocumentor, PHPStan, Psalm)
5. Mempermudah pengujian dan debugging dengan pemanfaatan tag `@thrown` dan `@return`
6. Peningkatan konsistensi dan standarisasi karena semua telah ada pedomannya
7. Mempermudah onboarding pengembang baru dengan mengurangi kurva pembelajaran
8. Mempermudah refactoring kode