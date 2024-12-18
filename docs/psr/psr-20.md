# 6.16 PSR-20 Clock

PSR-20 adalah standar yang dirancang untuk menyediakan antarmuka seragam dalam menangani waktu pada aplikasi PHP. Dengan PSR-20 pengelolaan waktu menjadi lebih fleksibel, terutama untuk kebutuhan pengujian dan pengaturan waktu dinamis.

## 6.16.1 ClockInterface

PSR-20 mendefinisikan antarmuka `ClockInterface`, yang menyediakan metode `now()` untuk mendapatkan waktu saat ini dalam bentuk objek `DateTimeImmutable`. Standar ini memungkinkan aplikasi menggunakan implementasi waktu yang dapat disesuaikan sesuai kebutuhan, baik untuk pengembangan maupun pengujian.
Antarmuka `ClockInterface` didefinisikan sebagai berikut:

```php
<?php

namespace Psr\Clock;

use DateTimeImmutable;

interface ClockInterface
{
    /**
     * Mengembalikan waktu saat ini sebagai objek DateTimeImmutable.
     *
     * @return DateTimeImmutable
     */
    public function now(): DateTimeImmutable;
}
```

## 6.16.2 Cara Implementasi

Berikut ini merupakan berbagai cara dalam pengimplementasian PSR-20:

1. Menggunakan library pihak ketiga yang mendukung PSR-20
    
    Apabila terdapat library pihak ketiga yang mendukung PSR-20, instalasi dapat dilakukan menggunakan Composer. Contoh library seperti `nyholm/psr20`, dengan langkah-langkah sebagai berikut:
    
    1. Jalankan perintah berikut untuk menginstal library melalui Composer
        
        ```bash
        composer require nyholm/psr20
        ```
        
    2. Setelah instalasi, library akan ditambahkan ke direktori `vendor/`
    3. Tambahkan `autoload.php` dari Composer ke file PHP
        
        ```php
        require 'vendor/autoload.php';
        ```
        
    4. Gunakan implementasi `ClockInterface` yang disediakan library
        
        ```php
        <?php
        
        require 'vendor/autoload.php';
        
        use Nyholm\Psr20\SystemClock;
        
        $clock = new SystemClock();
        echo "Waktu saat ini: " . $clock->now()->format('Y-m-d H:i:s');
        ```
        
2. Membuat implementasi PSR-20 sendiri
    
    Langkah-langkahnya sebagai berikut:
    
    1. Definisikan antarmuka `ClockInterface`
    Buatlah file untuk mendefinisikan antarmuka di lokasi seperti `src/Contracts/ClockInterface.php`.
        
        ```php
        <?php
        
        namespace App\Contracts;
        
        use DateTimeImmutable;
        
        interface ClockInterface
        {
            /**
             * Mengembalikan waktu saat ini sebagai objek DateTimeImmutable.
             *
             * @return DateTimeImmutable
             */
            public function now(): DateTimeImmutable;
        }
        ```
        
    2. Implementasi waktu sistem
        
        Buatlah kelas yang mengimplementasikan `ClockInterface` untuk mendapatkan waktu dari sistem. Kemudian simpan di `src/Services/SystemClock.php`.
        
        ```php
        <?php
        
        namespace App\Services;
        
        use App\Contracts\ClockInterface;
        use DateTimeImmutable;
        
        class SystemClock implements ClockInterface
        {
            public function now(): DateTimeImmutable
            {
                return new DateTimeImmutable();
            }
        }
        ```
        
    3. Implementasi waktu tetap (opsional)
    Untuk kebutuhan pengujian, waktu tetap dapat digunakan. Dan simpan file di `src/Services/FixedClock.php`.
        
        ```php
        <?php
        
        namespace App\Services;
        
        use App\Contracts\ClockInterface;
        use DateTimeImmutable;
        
        class FixedClock implements ClockInterface
        {
            private DateTimeImmutable $fixedTime;
        
            public function __construct(DateTimeImmutable $time)
            {
                $this->fixedTime = $time;
            }
        
            public function now(): DateTimeImmutable
            {
                return $this->fixedTime;
            }
        }
        ```
        
    4. Implementasi
        
        Setelah implementasi selesai, pilihlah salah satu kelas `ClockInterface` sesuai kebutuhan.
        
        ```php
        <?php
        
        use App\Services\SystemClock;
        
        $clock = new SystemClock();
        echo "Waktu sistem: " . $clock->now()->format('Y-m-d H:i:s');
        ```
        
        ```php
        <?php
        
        use App\Services\FixedClock;
        use DateTimeImmutable;
        
        $fixedTime = new DateTimeImmutable('2024-12-15 12:00:00');
        $clock = new FixedClock($fixedTime);
        
        echo "Waktu tetap: " . $clock->now()->format('Y-m-d H:i:s');
        ```
        

## 6.16.3 Kapan Harus Menggunakan PSR-20?

PSR-20 sangat berguna dalam skenario berikut:

1. Aplikasi dengan ketergantungan waktu
Contohnya pada sistem yang memerlukan timestamp untuk transaksi atau log.
2. Pengujian unit
    
    Dalam pengujian, waktu tetap memudahkan untuk menguji logika yang bergantung pada waktu tertentu. Misalnya menguji apakah fungsi berlaku pada jam kerja tertentu.
    
3. Dependency injection
    
    Dalam hal ini kita dapat menyuntikkan sumber waktu (clock) yang berbeda ke dalam aplikasi sesuai dengan kebutuhan.
    

## 6.16.4 Keuntungan

1. Fleksibilitas, mengacu pada sumber waktu yang dapat diubah tanpa memengaruhi logika utama aplikasi.
2. Konsistensi, dengan implementasi waktu tetap, pengujian logika yang bergantung pada waktu menjadi lebih mudah.
3. Testability, PSR-20 ini menjadikan kode lebih kompatibel dengan library atau framework lain.