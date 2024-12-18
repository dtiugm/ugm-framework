# 6.1 PSR 1 Basic Coding Standart

PSR-1 adalah standar yang memberikan pedoman dasar untuk menulis kode PHP agar lebih konsisten, mudah dipahami, dan kompatibel saat digunakan bersama oleh banyak programmer. PSR-1 adalah aturan tata krama menulis kode PHP yang bisa dipahami semua orang dalam tim besar. 

## 6.1.1 File PHP Harus Dimulai dengan Tag `<?php`

Jangan ada kode di luar tag `<?php.` Misalnya jangan tambahkan spasi atau teks di awal file. Contoh yang baik:

```php
<?php
echo "hello world!"; //ok
```

## 6.1.2 Gunakan UTF-8 Tanpa BOM

File PHP harus disimpan dalam format teks `UTF-8` tanpa BOM (*Byte Order Mark*). Ini akan memastikan kode dapat bekerja dengan baik tanpa karakter aneh muncul. Contoh yang baik seperti point 6.1.1. Berikut contoh tidak baik dengan BOM

```php
[karakter BOM tak terlihat di sini]<?php
echo "Hello, world!";
```

Outuput akan seperti ini

```php
ï»¿Hello, world!
```

Ini karena server PHP akan membaca BOM sebagai bagian dari output.

## 6.1.3 Berikan Nama Kelas dan Fungsi yang jelas

Nama kelas harus mengikuti aturan StudlyCaps (huruf besar di awal setiap kata). StudlyCaps adalah gaya penamaan dalam pemrograman di mana setiap kata dimulai dengan huruf besar, tanpa menggunakan spasi atau karakter pemisahan lainnya. Seperti PascalCase namun umumnya pascal case digunakan diluar PHP dan untuk PHP adalah StudlyCaps. Nama kelas dan namescape harus mengikuti standar di PSR-4.

```php
<?php
class MyFirstClass {} // Benar
class myfirstclass {} // Salah
```

## 6.1.4 Fungsi Harus Menggunakan camelCase

Fungsi atau metode harus menggunakan huruf kecil di awal, lalu huruf besar untuk kata berikutnya.

```php
<?php
function getUserName() {} // Benar
function GetUserName() {} // Salah
```

## 6.1.5 Konstanta

Konstanta wajib dideklarasikan dalam huruf besar semua dengan pemisah garis bawah. Contoh:

```php
<?php
namespace Vendor\Model;

class Foo
{
    const VERSION = '1.0';
    const DATE_APPROVED = '2012-06-01';
}
```