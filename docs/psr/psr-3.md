# 6.3 PSR-4 Autoloader

Autoloader adalah cara otomatis untuk memuat file kelas, interface, atau trait di PHP tanpa harus menggunakan require atau include secara manual. Dengan autoloader, PHP akan mencari dan memuat file yang sesuai dengan kelas yang dipanggil berdasarkan aturan tertentu.

PSR-4 adalah standar yang menjelaskan bagaimana file PHP harus diorganisir agar dapat dimuat secara otomatis oleh autoloader. Standar ini memastikan kode yang digunakan konsisten dan mudah digunakan pada berbagai proyek atau framework.

## 6.3.1 Tujuan

Berikut merupakan beberapa tujuan dari autoloading standard:

- Konsistensi autoloading karena dilakukan dengan cara yang seragam
- Mengurangi penggunaan include atau require secara manual
- Mengatur struktur direktori yang jelas agar sesuai dengan namespace untuk memudahkan navigasi
- Interoperabilitas, yaitu memungkinkan integrasi yang lebih baik antar proyek atau library PHP lainnya karena standar yang sama.

## 6.3.2 Penamaan Kelas

Nama kelas lengkap (fully qualified class name) mengikuti struktur berikut:

```php
\VendorNamespace\SubNamespace\ClassName
```

Keterangan:

VendorNamespace: Nama utama (contohnya: `Acme` atau `Symfony`).

SubNamespace: Folder tambahan dalam namespace.

ClassName: Nama file yang akan dimuat.

## 6.3.3 Hubungan Namespace dan Struktur Folder

Namespace diterjemahkan sebagai struktur folder. Setiap bagian namespace dipisahkan dengan `\`, yang menjadi folder di dalam sistem file. Nama file sesuai dengan nama kelas dan harus berakhiran `.php`.

Contoh:

```php
\Acme\Log\Writer\FileWriter
```

Keterangan:

Namespace `Acme\log\Writer` diterjemahkan ke folder `Acme/Log/Writer/`. 

Kelas `FileWriter` berada di file `FileWriter.php`.

## 6.3.4 Direktori Dasar

Direktori dasar atau Base directory adalah lokasi utama tempat folder namespace dimulai.

Misalnya: namespace `Acme\Log\Writer` dengan base directory `./src/` berarti file `FileWriter.php` berada di `./src/Acme/Log/Writer/FileWriter.php`.

## 6.3.5 Kondisi Teknis

Pada kondisi teknis ini, hal yang harus diperhatikan adalah:

1. Tidak diperbolehkan terdapat Error, dengan kata lain autoloader tidak diperbolehkan menghasilkan error atau exception.
2. Case-Sensitive yaitu nama file dan folder harus sesuai dengan huruf besar/kecil dalam namespace.

## 6.3.6 Contoh Implementasi

| Nama Kelas Lengkap | Namespace Prefix | Base Directory | Path File Hasil |
| --- | --- | --- | --- |
| `\Acme\Log\Writer\FileWriter` | `Acme\Log\Writer` | `./acme-log-writer/lib/` | `./acme-log-writer/lib/FileWriter.php` |
| `\Symfony\Core\Request` | `Symfony\Core` | `./vendor/Symfony/Core/` | `./vendor/Symfony/Core/Request.php` |

Autoloader sangat penting karena:

1. Mengurangi kerumitan karena tidak perlu memuat file secara manual dengan require.
2. Organisasi kode yang baik, memastikan file dan folder terstruktur.
3. Kompabilitas, PSR-4 digunakan oleh banyak framework seperti laravel, symfony, dan composer.

Autoloder membantu pengembang mengelola file secara efisien. Dengan mengikuti standar PSR-4 file dan kelas dalam proyek akan terorganisis dengan baik, mudah ditemukan, dan kompatibel dengan ekosistem PHP modern. Untuk itu wajib dalam sebuah proyek pengembangan sistem menggunakan PHP wajib menerapkan PSR-4.