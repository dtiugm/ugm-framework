# 6.2 PSR 12 Extended Coding Style Guide

PSR 12 merupakan pengembangan dari PSR 2 mengenai coding style dan mengikuti standar PSR 1 untuk pengkodean dasar dengan tujuan untuk mencakup lebih banyak aspek dan memberikan panduan yang lebih rinci. PSR 12 dirancang untuk meningkatkan konsistensi dan keterbacaan kode dalam pengembangan PHP. Dengan standar ini maka akan memudahkan kolaborasi antar programmer dalam suatu proyek. PSR 12 memberikan panduan detail tentang penyesuaian format atau gaya penulisan kode mulai dari indentasi, spasi, panjang baris, hingga cara mendeklarasikan kelas dan fungsi. Bayangkan PSR 12 ini seperti “aturan tata bahasa” saat menulis artikel. Jika semua mengikuti aturan maka artikel akan mudah dibaca. Di dalam dunia PHP, kode yang mengikuti PSR 12 akan lebih mudah dipahami dan dirawat oleh semua programmer. Beberapa poin utama yang harus diperhatikan dalam pengembangan PHP menurut PSR 12:

## 6.2.1 Gunakan Tag PHP Dalam File PHP

Semua file PHP harus menggunakan tag `<?php` dan harus menggunakan Unix LF atau baris baru. File harus diakhiri dengan satu baris kosong. Apabila file PHP **hanya berisi kode PHP**, **tidak boleh menutup** file dengan tag `?>`.

## 6.2.2 Baris

Tidak terdapat batasan panjang maksimum untuk baris. Namun disarankan panjang baris tidak melebihi **120 karakter**. Idealnya, baris tidak lebih dari **80 karakter**. Apabila lebih, maka dengan memotong menjadi beberapa baris. Kemudian tidak boleh terdapat spasi berlebihan di akhir baris. Selanjutnya gunakan baris kosong untuk **memisahkan blok kode yang berhubungan**, agar lebih mudah dibaca.

Contoh:
```php
<?php

// Panjang baris tidak lebih dari 80 karakter (direkomendasikan)
if ($user->isLoggedIn() && $user->hasPermission('edit')) {
    echo "You have access to edit.";
}

// Jika lebih panjang dari 80 karakter, pisahkan ke beberapa baris
if (
    $user->isLoggedIn()
    && $user->hasPermission('edit')
    && $user->isVerified()
) {
    echo "Access granted.";
}

// Tidak ada trailing whitespace
echo "This is correct."; // ← (Tidak ada spasi setelah titik koma)

// Tambahkan baris kosong untuk keterbacaan
function example()
{
    $data = "Contoh data";

    // Operasi yang lebih kompleks di sini
    return $data;
}

// Satu pernyataan per baris
$var1 = 'value1';
$var2 = 'value2'; // Boleh seperti ini
// $var1 = 'value1'; $var2 = 'value2'; ← Ini tidak boleh
```

## 6.2.3 Indentasi

Agar kode terlihat lebih rapi, maka gunakan 4 spasi untuk setiap tingkat indentasi. Jangan gunakan Tab karena terdapat perbedaan interprestasi Tab disetiap editor atau IDE. Ada editor satu tab setara dengan 4 spasi namun ada editor lain satu tab bisa setara dengan 8 spasi. Akibatnya identasi kode dapat terlihat tidak seragam ketika dibuka di lingkungan berbeda. Sedangkan spasi lebih terprediksi di lintas platform. Spasi memiliki panjang tetap, sehingga memastikan bahwa indentasi terlihat sama di berbagai perangkat dan platform.

## 6.2.4 Kata Kunci dan Tipe

Semua kata kunci PHP seperti `if`, `else`, `public`, dan lain-lain serta tipe seperti `int`, `string` harus ditulis dengan huruf kecil. Gunakan tipe pendek seperti `bool` untuk boolean (bukan `boolean`) dan `int` untuk integer (bukan `integer`).

## 6.2.5 Deklarasi, Namespace, dan Impor

Bagian awal file PHP dapat memiliki blok berikut dalam urutan tertentu:

1. Tag pembuka `<?php`.
2. Komentar untuk file atau `docblock`.
3. Deklarasi seperti `declare(strict_types=`);` .
4. Namespace.
5. Setelah deklarasi namespace harus ada satu baris kosong
6. Pernyataan `use` untuk kelas, fungsi atau konstanta harus dibagian atas setelah deklarasi namespace.
7. Deklarasi `use` harus diurutkan secara alfabetis.

Jika terdapat HTML dan PHP dalam satu file, bagian-bagian di atas tetap ada di atas file. Import tidak boleh menggunakan backslash `\` di depan. Contoh yang benar untuk import:
```php
use Vendor\Package\ClassName;
```
Contoh file dengan semua blok:
```php
<?php

declare(strict_types=1);

namespace Vendor\Package;

use Vendor\Package\{ClassA as A, ClassB, ClassC as C};
use Vendor\Package\SomeNamespace\ClassD as D;
use Vendor\Package\AnotherNamespace\ClassE as E;

use function Vendor\Package\{functionA, functionB, functionC};
use function Another\Vendor\functionD;

use const Vendor\Package\{CONSTANT_A, CONSTANT_B, CONSTANT_C};
use const Another\Vendor\CONSTANT_D;

/**
 * FooBar is an example class.
 */
class FooBar
{
    // ... additional PHP code ...
}
```
Namespace dengan kedalaman lebih dari dua **tidak diperbolehkan** untuk digunakan. Oleh karena itu, berikut ini adalah kedalaman gabungan maksimum yang diizinkan:
```php
<?php

use Vendor\Package\SomeNamespace\{
    SubnamespaceOne\ClassA,
    SubnamespaceOne\ClassB,
    SubnamespaceTwo\ClassY,
    ClassZ,
};
```
Dan hal-hal berikut ini **tidak diperbolehkan**:
```php
<?php

use Vendor\Package\SomeNamespace\{
    SubnamespaceOne\AnotherNamespace\ClassA,
    SubnamespaceOne\ClassB,
    ClassZ,
};
```
## 6.2.6 Ekstensi dan Implementasi

Kata kunci `extends` dan `implements` harus berada di baris yang sama dengan nama kelas. Kemudian simbol kurung kurawal `{` untuk membuka kelas harus pada baris baru, dan kurawal tutup `}` harus di baris berikutnya setelah isi kelas.
Contoh:

```php
<?php

namespace Vendor\Package;

use FooClass;
use BarClass as Bar;
use OtherVendor\OtherPackage\BazClass;

class ClassName extends ParentClass implements \ArrayAccess, \Countable
{
    // constants, properties, methods
}
```
Daftar implementasi dan dalam kasus interfaces, ekstensi boleh dibagi menjadi beberapa baris. Dimana setiap baris berikutnya diberi indentasi satu kali. Saat melakukannya, item pertama dalam daftar harus berada di baris berikutnya, dan harus hanya ada satu interface per baris.

Contoh:
```php
<?php

namespace Vendor\Package;

use FooClass;
use BarClass as Bar;
use OtherVendor\OtherPackage\BazClass;

class ClassName extends ParentClass implements
    \ArrayAccess,
    \Countable,
    \Serializable
{
    // constants, properties, methods
}
```

## 6.2.7 Menggunakan Traits

Kata kunci `use` yang digunakan di dalam kelas untuk mengimplementasikan traits harus dideklarasikan pada baris berikutnya setelah kurung kurawal buka, contoh:

```php
<?php

namespace Vendor\Package;

use Vendor\Package\FirstTrait;

class ClassName
{
    use FirstTrait;
}
```

Setiap individu trait yang diimpor ke dalam kelas harus disertakan satu per baris dan setiap penyertaan harus mempunyai pernyataan penggunaan impornya sendiri, contoh:

```php
<?php

namespace Vendor\Package;

use Vendor\Package\FirstTrait;
use Vendor\Package\SecondTrait;
use Vendor\Package\ThirdTrait;

class ClassName
{
    use FirstTrait;
    use SecondTrait;
    use ThirdTrait;
}
```

Jika kelas tidak memiliki apapun setelah pernyataan `use` import, tanda kurung tutup kelas harus berada pada baris berikutnya setelah pernyataan `use` import.

```php
<?php

namespace Vendor\Package;

use Vendor\Package\FirstTrait;

class ClassName
{
    use FirstTrait;
}
```

Jika tidak, maka harus memiliki baris kosong setelah pernyataan penggunaan impor.

```php
<?php

namespace Vendor\Package;

use Vendor\Package\FirstTrait;

class ClassName
{
    use FirstTrait;

    private $property;
}
```

Jika menggunakan operator `insteadof` dan `as`, keduanya harus digunakan sebagai berikut dengan memperhatikan indentasi, spasi, dan baris baru:

```php
<?php

class Talker
{
    use A;
    use B {
        A::smallTalk insteadof B;
    }
    use C {
        B::bigTalk insteadof C;
        C::mediumTalk as FooBar;
    }
}
```

## 6.2.8 Properti dan Konstanta

Visibility harus ditentukan. Semua properti dalam sebuah kelas wajib memiliki visibilitas yang ditentukan misal `public`, `protected` atau `private`.

Konstanta jika menggunakan PHP 7.1 atau versi yang lebih baru, visibilitas konstanta (`public`, `protected`, `private`) juga harus ditentukan. Contoh:

```php
class Example
{
    public $foo;
    protected int $bar = 10;
    private static string $baz = "Hello";
    
    protected const MY_CONSTANT = 100;
}
```

Kata kunci `var` (yang masih didukung untuk deklarasi properti) **tidak boleh digunakan**, karena tidak merepresentasikan visibilitas secara eksplisit.

```php
var $foo = null; // Dilarang
public $foo = null; // Diperbolehkan
```

Setiap properti harus dideklarasikan pada barisnya masing-masing, tanpa digabung dengna properti lain dalam satu pernyataan.

```php
public $foo, $bar; // Dilarang
public $foo; // Boleh
public $bar; //Boleh

```

Nama properti tidak boleh diawali dengan underscore (_) untuk menunjukan visibilitas (`protected` atau `private`). Sebagai gantinya gunakan visibilitas eksplisit.

```php
private $_foo; // Dilarang
private $foo; // Boleh
```

Jika menggunakan type hinting, harus ada satu spasi antara tipe properti dan nama properti.

```php
public int$bar; // Dilarang
public int $bar; //Boleh
```

## 6.2.9 Metode dan Fungsi

Visibilitas harus ditentukan. Semua metode dalam sebuah kelas wajib memiliki visibilitas yang ditentukan misal `public`, `protected` atau `private`.

```php
class Example
{
    public function foo() {}
    protected function bar() {}
    private function baz() {}
}
```

Tidak menggunakan awalan undescore (_) pada nama metode. Nama metode tidak boleh diawali underscore untuk menujukan visibilitas. Sebagai gantinya gunakan visibilitas eksplisit.

```php
protected function _myMethod() {} // Dilarang
protected function myMethod() {} //Boleh
```

Penempatan braces kurung kurawal buka `{` harus berada di baris baru setelah nama metode atau fungsi. Kemudian braces `}` harus berada di barus baru setelah metode atau fungsi.

```php
public function fooBarBaz($arg1, &$arg2, $arg3 = [])
{
    // Isi metode
}
```

Tidak boleh ada spasi setelah nama metode atau fungsi dan sebelum tanpda kurung buka `(`. Dan tidak boleh ada spasi sebelum tanda kurung tutup `)`. Tapi untuk parameter yang jika lebih dari satu wajib menggunakan spasi setelah tanda koma.

```php
namespace Vendor\Package;

class ClassName
{
    public function fooBarBaz($arg1, &$arg2, $arg3 = [])
    {
        // Isi metode
    }
}

function fooBarBaz($arg1, &$arg2, $arg3 = [])
{
    // Isi fungsi
}

public function foo($arg1 ,$arg2 , $arg3 = []) {} // Dilarang
public function foo($arg1, $arg2, $arg3 = []) {} // Boleh
```

Default value harus di akhir argumen. Argumen yang memiliki nilai default harus ditempatkan di akhir daftar argumen.

```php
public function foo($arg1 = 10, $arg2) {} // Dilarang
public function foo($arg1, $arg2 = 10) {} // Boleh
```

Jika argumen terlalu panjang, maka

1. Setiap baris baru harus diindentasi sekali.
2. Argumen pertama dalam daftar dimulai pada baris baru.
3. Satu argumen per baris.
4. Tanda kurung tutup `)` dan tanda kurung kurawal `{` harus bereda di baris yang sama dengan satu spasi diantaranya.

```php
public function aVeryLongMethodName(
    ClassTypeHint $arg1,
    &$arg2,
    array $arg3 = []
) {
    // method body
}
```

Jika metode atau fungsi memiliki deklarasi tipe pengembalian (return type) maka

1. Ada satu spasi setelah titik dua `:` sebelum tipe pengembalian.
2. Tanda : harus bereda di baris yang sama dengan tanpda kurung tutup `)`.

```php
public function functionName(int $arg1, $arg2): string
{
    return 'foo';
}
```

Jika daftar argumen dipisah dalam beberpa baris maka tanda `:` dan tipe pengembalian tetap di baris yang sama dengan tanda kurung tutup `)`.

```php
public function anotherFunction(
    string $foo,
    string $bar,
    int $baz
): string {
    return 'foo';
}
```

Dalam deklarasi tipe yang nullable, tidak boleh ada spasi antara tanda tanya ? dan tipe.

```php
public function functionName(? string $arg1): ? string {} // Dilarang
public function functionName(?string $arg1): ?string {} // Boleh
```

Tidak boleh ada spasi setelah tanda referensi `&`.

```php
public function foo(&$ arg) {} // Dilarang
public function foo(&$arg) {} // Boleh
```

Tidak boleh ada spasi antara variadic operator `…` dan nama argumen.

```php
public function process(string $algorithm, ... $parts) {} // Dilarang
public function process(string $algorithm, ...$parts) {} // Boleh
```

Jika menggunakan kombinasi reference operator & dan variadic operator … tidak boleh ada spasi di antara keduanya.

```php
public function process(string $algorithm, & ...$parts) {} // Dilarang
public function process(string $algorithm, &...$parts) {} // Boleh
```

## 6.2.10 Control Structures

Terdapat beberapa aturan yang harus diterapkan pada control structures.

Berikut adalah aturan penulisan `if`, `elseif`, `else`

1. Harus ada satu spasi setelah kata kunci (`if`, `elseif`, `else`).
2. Tidak terdapat spasi setelah tanda kurung buka `(` dan sebelum tanda kurung tutup `)`.
3. Badan struktur:
    1. Dibungkus dengan kurung kurawal `{}` meskipun hanya satu baris.
    2. Dimulai pada baris baru setelah kurung buka `{`.
    3. Diakhiri dengan kurung tutup `}` pada baris baru setelah badan.
4. Gunakan `elseif` atau `else if` untuk konsistensi.
5. Apabila ekpresi panjang:
    1. Setiap kondisi ditulis pada baris baru dengan indentasi.
    2. Operator boolean harus konsisten, berada di awal atau akhir baris.

```php
if ($expr1) {
    // if body
} elseif ($expr2) {
    // elseif body
} else {
    // else body
}

if (
    $expr1
    && $expr2
) {
    // if body
}
```

Aturan penulisan `switch`, `case`

1. Kata kunci `switch` diikuti dengan ekspresi dalam tanda kurung `()`.
2. Blok `case` dan `default` :
    1. Diindentasi satu tingkat dari `switch`.
    2. Setiap `case` atau `default` diakhiri dengan perintah `break`, `return`, atau komentar `// no break` apabila tidak menggunakan break.
3. Ekspresi panjang pada switch mengikuti aturan yang sama seperti `if`.

```php
switch ($expr) {
    case 0:
        echo 'First case, with a break';
        break;
    case 1:
        echo 'Second case, which falls through';
        // no break
    case 2:
        echo 'Third case, return instead of break';
        return;
    default:
        echo 'Default case';
        break;
}
```

Aturan penulisan `while`

1. Ekspresi dalam tanda kurung `()` mengikuti aturan spasi yang sama dengan `if`.
2. Badan struktur di dalam `{}`.
3. Apabila ekspresi panjang, maka gunakan indentasi per baris dengan boolean operator yang konsisten

```php
while ($expr) {
    // body
}

while (
    $expr1
    && $expr2
) {
    // body
}

```

Aturan penulisan `do while`

1. Kurung buka `{` setelah kata kunci `do` di baris yang sama.
2. `while` diakhiri dengan tanda titik koma `;`.

```php
do {
    // body
} while ($expr);

do {
    // body
} while (
    $expr1
    && $expr2
);

```

Aturan penulisan `for`

1. Ekspresi dalam tanda kurung `()`
    1. Tidak terdapat spasi sebelum atau setelah tanda koma.
    2. Setiap ekspresi dalam tanda kurung diakhiri dengan tanda titik koma `;`.
2. Apabila ekpsresi panjang, gunakan indentasi per baris.

```php
for ($i = 0; $i < 10; $i++) {
    // for body
}

for (
    $i = 0;
    $i < 10;
    $i++
) {
    // for body
}

```

Aturan penulisan `foreach`

1. Gunakan tanda kurung `()` untuk menampung ekspresi.
2. Badan struktur di dalam `{}`.

```php
foreach ($iterable as $key => $value) {
    // foreach body
}
```

Aturan penulisan `try`, `catch`, `finally`

1. Kurung buka `{` setelah kunci `try`, `catch`, atau `finally` pada baris yang sama.
2. Ekspresi dalam `catch` mendukung operator union `|` untuk tipe exception.

```php
try {
    // try body
} catch (FirstThrowableType $e) {
    // catch body
} catch (OtherThrowableType | AnotherThrowableType $e) {
    // catch body
} finally {
    // finally body
}
```

## 6.2.11 Operator

Penulisan operator harus mengikuti aturan agar konsisten dalam pengelolaan spasi di sekitar operator untuk meningkatkan keterbacaan kode.

Unari operator hanya memiliki satu operan, dan tidak diperbolehkan terdapat spasi antara operator dan operannya.

```php
//Contoh Salah
$i ++;
++ $j;

//Contoh Benar
$i++;
++$j;
```

Type casting (`int)`, `(string)`, dll.) tidak diperbolehkan terdapat spasi di dalam tanda kurung tipe casting.

```php
$intValue = ( int ) $input; //contoh salah

$intValue = (int) $input; //contoh benar
```

Operator binary melibatkan dua operan. Aturan operator ini mencakup operator aritmatika, perbandingan, penugasan, bitwise, logika, string dan tipe harus diapit oleh setidaknya satu spasi sebelum dan sesudahya.

```php
//Contoh Salah
if ($a===$b) {
    $foo=$bar??$a??$b;
} elseif ($a>$b) {
    $foo=$a+$b*$c;
}
//Contoh Benar
if ($a === $b) {
    $foo = $bar ?? $a ?? $b;
} elseif ($a > $b) {
    $foo = $a + $b * $c;
}
```

Ternary operator digunakan untuk pernyataan kondisional singkat. Spasi di sekitar `?` dan `:` harus ada setidaknya satu spasi sebelum dan sesudah `?` dan `:`.

```php
$variable = $foo?'foo':'bar'; //Contoh salah
$variable = $foo ? 'foo' : 'bar'; //Contoh benar
```

Ternary operator tanpa operand tengah mengikuti aturan yang sama seperti operator binary lainnya, yaitu terdapat spasi sebelum dan sesudah operator.

```php
$variable = $foo?:'bar'; //Contoh salah
$variable = $foo ?: 'bar'; //Contoh benar
```

## 6.2.12 Closures

Closures adalah fungsi anonim yang sering digunakan sebagai parameter atau fungsi tanpa nama. Untuk menjaga konsistensi dan keterbacaan, berikut beberapa aturan gaya penulisan untuk colsures.

Spasi setelah function dan use. Harus terdapat satu spasi setelah kata kunci function dan sebelum serta sesudah kata kunci use.

```php
//Contoh salah
$closure = function($arg)use($var) {
    // body
};
//Contoh benar
$closure = function ($arg) use ($var) {
    // body
};

```

Letak kurung kurawal pembuka `{` harus berada di baris yang sama dengan deklarasi closure. Sedangkan kurung kurawal penutup `}` harus berada di baris berikutnya setelah isi closure.

```php
//Contoh salah
$closure = function ($arg)
{
    // body
};
//Contoh benar
$closure = function ($arg) {
    // body
};
```

Spasi pada daftar argumen dan variabel. Tidak diperbolehkan terdapat spasi setelah kurung buka atau sebelum kurung tutup. Kemudian tidak diperbolehkan terdapat spasi sebelum koma. Terakhir harus terdapat satu spasi setelah koma.

```php
//Contoh salah
$closure = function( $arg1 ,$arg2 )use( $var1,$var2){
    // body
};
//Contoh benar
$closure = function ($arg1, $arg2) use ($var1, $var2) {
    // body
};
```

Argumen dengan nilai default harus berada di akhir daftar argumen.

```php
//Contoh salah
$closure = function ($arg1 = 'default', $arg2) {
    // body
};
//Contoh benar
$closure = function ($arg1, $arg2 = 'default') {
    // body
};

```

Tanda kolon (`:`) dan tipe return harus langsung mengikuti kurung tutup daftar argumen atau daftar variable `use` tanpa spasi. Kemudian harus terdapat satu spasi sebelum deklarasi tipe return.

```php
//Contoh salah
$closure = function ($arg) :string {
    return 'result';
};
//Contoh benar
$closure = function ($arg): string {
    return 'result';
};

```

Pemisahan argumen atau variable harus berada pada barisnya sendiri. Kemudian untuk kurung tutup dan kurung kurawal pembuka harus berada pada baris yang sama dengan satu spasi diantaranya.

```php
//Contoh salah
$closure = function ($arg1,
    $arg2, $arg3) use ($var1,
    $var2, $var3) 
{
    // body
};
//Contoh benar
$closure = function (
    $arg1,
    $arg2,
    $arg3
) use (
    $var1,
    $var2,
    $var3
) {
    // body
};
```

Kombinasi panjang dan pendek pada pendekatan variabel atau argumen yang pendek diperbolehkan digabungkan dalam satu baris.

```php
//Contoh salah
$closure = function ($arg) use (
    $var1
) {
    // body
};
//Contoh benar
$closure = function ($arg) use ($var1) {
    // body
};
```

Apabila closure digunakan langsung sebagai parameter dalam pemanggilan fungsi atau metode, aturan format tetap berlaku.

```php
//Contoh salah
$foo->bar($arg1,function($arg2)use($var1){
    // body
},$arg3);
//Contoh benar
$foo->bar(
    $arg1,
    function ($arg2) use ($var1) {
        // body
    },
    $arg3
);

```

### 6.2.13 Anonymouse Classes

Anonymous classess harus mengikuti pedoman, gaya, dan prinsip yang sama seperti closures. Anonymous class dideklarasikan sebagai kata kunci class tanpa nama. Brace pembuka (`{`) dapat berada pada baris yang sama dengan kata kunci class apabila tidak ada daftar implementasi antarmuka yang membungkus baris.

```php
//Contoh brace di baris yang sama
$instance = new class {
    // Class content
};
//Contoh brace di baris berikutnya
$instance = new class extends \Foo implements
    \ArrayAccess,
    \Countable
{
    // Class content
};
```

Isi kelas harus mengikuti aturan standar untuk struktur kelas pada umumnya. Setiap properti, metode, atau blok kode pada anonymous class harus diindentasikan satu kali.

```php
//Contoh salah
$instance = new class {
private $property;

public function method()
{
// Method body
}
};

//Contoh Benar
$instance = new class {
    private $property;

    public function method()
    {
        // Method body
    }
};

```

Apabila anonymous class memiliki daftar implements atau extends yang pendek (tidak membungkus baris), brace pembuka harus berada pada baris yang sama. Apabila daftar membungkus, brace pembuka harus berada pada baris setelah daftar terakhir.

```php
// Daftar pendek
$instance = new class extends \BaseClass implements \Interface1 {
    // Class content
};

// Daftar panjang
$instance = new class implements
    \Interface1,
    \Interface2,
    \Interface3
{
    // Class content
};

```

Harus terdapat satu spasi antara daftar `extends` atau `implements` dengan brace pembuka.

```php
//Contoh salah
$instance = new class extends \Foo implements \Bar{
    // Class content
};
//Contoh benar
$instance = new class extends \Foo implements \Bar {
    // Class content
};

```

Penempatan anonymous class pada parameter, apabila anonymous class digunakan sebagai argumen fungsi atau metode dengan aturan format yang sama tetap berlaku.

```php
//Contoh salah
$foo->process(new class extends \BaseClass{
    public function execute()
    {
        // Method content
    }
});
//Contoh benar
$foo->process(new class extends \BaseClass {
    public function execute()
    {
        // Method content
    }
});

```



