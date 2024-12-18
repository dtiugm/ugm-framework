# BAB 5 *Clean Code*

Berikut ini adalah panduan praktik terbaik menulis kode yang bersih dalam membangun sistem informasi di lingkungan UGM.

## 5.1 Menulis code yang bersih

Mengapa harus menulis kode yang bersih?

Bayangkan jika mencari sesuatu di ruangan yang berantakan. Pasti akan kesulitan mencari dan tentunya membuang waktu untuk mencarinya. Hal tersebut berlaku demikian dalam pengembangan sistem informasi. Menulis barisan kode secara berantakan akan menyulitkan dalam penelusuran masalah atau memahami logika dari kode tersebut. Dengan kode yang bersih, maka kesulitan tersebut dapat dihindari. Dengan menulis kode yang bersih, programmer juga menghemat waktu programmer lainnya. Berikut adalah tips menulis kode yang bersih.

### 5.1.1 Gunakan Nama yang Bermakna

Saat membuat variable atau fungsi, beri nama yang jelas dan menjelaskan apa yang dilakukan variable atau fungsi tersebut. Ini seperti memberi nama folder di komputer. Misal ketika akan membuat variable jumlah produk. Dari pada memberi nama hanya sebuah huruf a atau b saja, gunakan nama yang lebih jelas misal numberOfProducts.

```php
<?php
var numberOfUsers = 5;
```

### 5.1.2 Ikuti Prinsip Tanggung Jawab Tunggal (Single Responsibility Principle - SRP)

Sebuah fungsi sebaiknya melakukan satu tugas saja dan dapat melakukannya dengan baik. Ini membuat fungsi lebih mudah dipahami dan diperbaiki jika diperlukan. Seperti memiliki satu alat untuk satu tugas. Misalnya pensil untuk menulis dan gunting untuk memotong.

```php
<?php
function addNumbers(int a, int b){
		return a+b;
}
```

Fungsi `addNumbers` hanya menjumlahkan dua angka saja, tidak melakukan hal lainnya.

### 5.1.3 Hindari komentar yang Tidak Diperlukan

Daripada menambahkan komentar di mana-mana, sebaiknya mencoba untuk menyusun kode yang dapat menjelaskan kode itu sendiri dengan nama yang baik. Gunakan komentar hanya ketika sesuatu yang rumit atau membutuhkan catatan khusus. Terlalu banyak komentar akan membingungkan.

```php
<?php
//Baik: Nama variable sudah jelas, tidak perlu komentar tambahan
var userAge = 30;

//Buruk: Nama variable tidak jelas, membutuhkan komentar
var a_ = 0;
```

### 5.1.4 Buat Kode Mudah Dibaca

Gunakan spasi, indentasi, dan pemisah baris untuk menjaga kode tetap rapi. Seperti menulis paragraf, kode harus dipecah menjadi potongan-potongan kecil agar tidak semuanya berada di satu baris. Kecuali kode yang memang dikecilkan untuk optimasi (minify) misal css dan javascript.

```php
<?php
// Kode Baik
if (isLoggedIn) {
    console.log("Selamat datang!");
} else {
    console.log("Silakan masuk.");
}

// Kode Buruk
if(isLoggedIn){console.log("Selamat datang!");}else{console.log("Silakan masuk.");}
```

### 5.1.5 Tulis Unit Test

Unit test adalah pemeriksaan untuk memastikan kode bekerja seperti seharusnya. Ketika kode dirubah, unit test akan memberitahu jika ada kode yang tidak berjalan semestinya.

```php
<?php
//class calculator

class Calculator
{
    public function add(int $a, int $b): int
    {
        return $a + $b;
    }

    public function subtract(int $a, int $b): int
    {
        return $a - $b;
    }
}
```

```php
<?php
//class unit test untuk class calculator

use PHPUnit\Framework\TestCase;

class CalculatorTest extends TestCase
{
    private Calculator $calculator;

    protected function setUp(): void
    {
        $this->calculator = new Calculator();
    }

    public function testAdd(): void
    {
        $this->assertEquals(5, $this->calculator->add(2, 3));
        $this->assertEquals(0, $this->calculator->add(-2, 2));
        $this->assertEquals(-5, $this->calculator->add(-2, -3));
    }

    public function testSubtract(): void
    {
        $this->assertEquals(1, $this->calculator->subtract(3, 2));
        $this->assertEquals(-4, $this->calculator->subtract(-2, 2));
        $this->assertEquals(1, $this->calculator->subtract(-2, -3));
    }
}
```

### 5.1.6 Hati-hati dengan Dependency

Saat mengembangkan sistem informasi, usahakan agar setiap bagian tidak terlalu bergantung satu sama lain. Sebagai contoh, mesin cuci piring bisa digunakan di dapur mana saja, bukan hanya dapur tertentu. Jika menggunakan pendekatan ini maka sistem informasi akan mudah dikelola.

### 5.1.7 Organisasi Proyek yang Baik

Menjaga file dan folder proyek tetap terorganisis. Seperti menjaga meja tetap rapi. Ini akan mempermudah pencarian ketika proyek semakin besar.

Contoh:

1. Gunakan folder seperti components, services, controller, dan model dalam proyek.
2. Kelompokkan file yang serupa agar mudah dan tahu di mana mencarinya.