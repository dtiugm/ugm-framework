# 6.15 PSR-19 PHPDoc Tags

PSR-19 ****adalah standar untuk tag PHPDoc di PHP yang bertujuan untuk menyederhanakan dokumentasi kode PHP dengan menyediakan kumpulan tag standar dan konsisten. Dengan menerapkan PSR-19 diharapkan dapat meningkatkan kualitas dokumentasi kode sehingga lebih mudah dipahami dan digunakan oleh orang lain maupun tools documentor (alat otomatis).

## 6.15.1 Prinsip Dasar PSR-19

Adapun prinsip dasar pada PSR-19 adalah sebagai berikut:

1. Menyediakan tag standar untuk mendeskripsikan berbagai aspek kode, seperti kelas, fungsi, parameter, jenis data, pengecualian, dan catatan.
2. Menetapkan format tag yang konsisten dengan tanda `@` di awal baris, diikuti nama tag, dan parameter opsional.
3. Mendorong dokumentasi yang jelas, ringkas, dan informatif untuk memudahkan pemahaman developer lain.

## 6.15.2 Manfaat

Berbagai manfaat PSR-19 ini diantaranya yaitu:

1. Meningkatkan keterbacaan dan organisasi dokumentasi kode.
2. Memudahkan pemahaman kode oleh developer lain.
3. Mendukung konsistensi dokumentasi antar project.
4. Memudahkan integrasi dengan tools dokumentasi.

## 6.15.3 Kelemahan

Kelemahan PSR-19 diantaranya adalah:

1. Standar ini masih dalam tahap draft dan belum resmi diadopsi.
2. Beberapa tools dokumentasi mungkin belum mendukung PSR-19 secara penuh.
3. Implementasi PSR-19 yang berbeda mungkin memiliki cara penulisan yang berbeda.

Berikut merupakan daftar tag yang sering digunakan dalam PHPDocs:

| **Tag Metadata** | **Deskripsi** | **Contoh Penggunaan** | **Lokasi Penggunaan** |
| --- | --- | --- | --- |
| **`@author`** | Menyebutkan nama atau informasi penulis dari elemen kode. | `@author Emiliano Purnomo <emiliano.purnomo@example.com>` | *class, method, file* |
| **`@copyright`** | Menyatakan informasi hak cipta terkait elemen kode. | `@copyright 2024 Company Name` | *class, file* |
| **`@deprecated`** | Menandai elemen kode yang tidak lagi direkomendasikan untuk digunakan. | `@deprecated Sejak versi 2.0. Gunakan fungsi newFunction()` | *class, method, property* |
| **`@example`** | Memberikan contoh penggunaan kode. | `@example /path/to/example.php` | *class, method, property* |
| **`@global`** | Menjelaskan variabel global yang digunakan dalam elemen kode. | `@global string $config` | *class, file* |
| **`@ignore`** | Menandai elemen kode untuk diabaikan dalam pembuatan dokumentasi. | `@ignore` | *class, method, property* |
| **`@license`** | Menyebutkan informasi lisensi elemen kode. | `@license MIT` | *class, file* |
| **`@link`** | Menyertakan tautan ke sumber eksternal terkait elemen kode. | `@link <https://example.com/>` | *class, method, property* |
| **`@method`** | Mendefinisikan metode ajaib (*magic method*) yang tidak ada secara eksplisit di kelas. | `@method string getName()` | *class* |
| **`@package`** | Menentukan paket tempat elemen kode berada (biasanya untuk struktur aplikasi). | `@package MyLibrary` | *class* |
| **`@param`** | Menjelaskan parameter fungsi atau metode. | `@param int $a Bilangan pertama.` | *method* |
| **`@property`** | Mendefinisikan properti ajaib (*magic property*) di kelas. | `@property string $name` | *class* |
| **`@return`** | Menjelaskan tipe data yang dikembalikan oleh fungsi atau metode. | `@return int Hasil penjumlahan.` | *method* |
| **`@see`** | Menunjuk elemen kode lain yang relevan atau terkait. | `@see AnotherClass::methodName()` | *class, method* |
| **`@since`** | Menyatakan kapan elemen kode diperkenalkan. | `@since 1.0.0` | *class, method, property* |
| **`@throws`** | Menyebutkan jenis pengecualian yang bisa dilemparkan oleh fungsi atau metode. | `@throws \\InvalidArgumentException` | *method* |
| **`@todo`** | Menandai bagian kode yang perlu diperbaiki atau dikembangkan lebih lanjut. | `@todo Tambahkan validasi input.` | *class, method, property* |
| **`@uses`** | Menunjuk elemen kode lain yang digunakan oleh elemen kode saat ini. | `@uses HelperClass` | *class, method* |
| **`@var`** | Menjelaskan tipe variabel properti atau lokal dalam elemen kode. | `@var string` | *property, variable* |
| **`@version`** | Menyebutkan versi elemen kode. | `@version 1.2.3` | *class, method, property* |

Berikut adalah contoh implementasi tag PHPDoc yang sesuai dengan standar PSR-19:

```php
/**
 * Kelas yang mewakili sebuah produk.
 *
 * @author John Doe <johndoe@example.com>
 * @version 1.0.0
 * @since 2024-06-13
 */
class Product
{
    /**
     * Nama produk.
     *
     * @var string
     */
    private $name;

    /**
     * Harga produk.
     *
     * @var float
     */
    private $price;

    /**
     * Konstruktor untuk kelas Product.
     *
     * @param string $name Nama produk
     * @param float $price Harga produk
     * @throws Exception Jika nama produk kosong
     */
    public function __construct($name, $price)
    {
        if (empty($name)) {
            throw new Exception('Nama produk tidak boleh kosong');
        }

        $this->name = $name;
        $this->price = $price;
    }

    /**
     * Mendapatkan nama produk.
     *
     * @return string Nama produk
     */
    public function getName(): string
    {
        return $this->name;
    }

    /**
     * Mengatur nama produk.
     *
     * @param string $name Nama produk baru
     */
    public function setName(string $name): void
    {
        $this->name = $name;
    }

    /**
     * Mendapatkan harga produk.
     *
     * @return float Harga produk
     */
    public function getPrice(): float
    {
        return $this->price;
    }

    /**
     * Mengatur harga produk.
     *
     * @param float $price Harga produk baru
     */
    public function setPrice(float $price): void
    {
        $this->price = $price;
    }
}
```

Keterangan:

**`@author`** digunakan untuk mencantumkan nama dan email penulis kode.

**`@version`** digunakan untuk mencantumkan versi kode.

**`@since`:**digunakan untuk mencantumkan tanggal atau versi PHP minimum yang dibutuhkan untuk menjalankan kode.

**`@var`** digunakan untuk mencantumkan tipe data variabel.

**`@param`** digunakan untuk mendeskripsikan parameter fungsi, termasuk nama parameter, tipe data, dan deskripsi singkat.

**`@throws`** digunakan untuk mendeskripsikan pengecualian yang mungkin terjadi pada fungsi.

**`@return`** digunakan untuk mendeskripsikan nilai balik fungsi, termasuk tipe data dan deskripsi singkat.
