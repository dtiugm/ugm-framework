# 6.4 PSR-3 Antarmuka Logger

PSR-3 adalah standar yang mendefinisikan antarmuka universal untuk library logging di PHP. Tujuannya adalah membuat aplikasi dan library dapat menulis log dengan cara yang konsisten, mudah, dan fleksibel.

Mengapa PSR-3 penting?

1. Universal: library atau framework dapat bekerja dengan logger apapun yang mendukung PSR-3.
2. Kemudahan: apabila aplikasi menggunakan PSR-3, maka bisa mengganti sistem logging tanpa mengubah kode log.
3. Sentralisasi Log: semua log aplikasi, library pihak ketiga, dan framework dapat digabungkan dalam satu tempat.

## 6.4.1 LoggerInterface

PSR-3 mendefinisikan antarmuka umum untuk library logging. Tujuan utamanya adalah memungkinkan library atau framework menerima antarmuka bernama `LoggerInterface` dan menulis log dengan cara yang sederhana serta universal. Semua library logging yang mengikuti PSR-3 harus mengimplementasikan antarmuka ini. LoggerInterface menyediakan 8 metode utama yang sesuai dengan level log standar dari [RFC 5424](http://tools.ietf.org/html/rfc5424):

1. Emergency: sistem tidak bisa digunakan (contoh: seluruh aplikasi down).
2. Alert: aksi segera diperlukan (contoh: database hilang).
3. Critical: kesalahan kritis yang memengaruhi sistem inti (contoh: exception penting).
4. Error: kesalahan runtime yang tidak memerlukan aksi langsung.
5. Warning: peringatan (contoh: penggunaan API yang salah).
6. Notice: peristiwa normal tapi signifikan (contoh: konfigurasi berubah).
7. Info: informasi umum (contoh: pengguna berhasil login).
8. Debug: informasi rinci untuk debugging.

Terdapat juga metode tambahan **`log()`** yang digunakan untuk menulis log dengan level yang ditentukan secara dinamis yaitu menerima level log sebagai argumen pertama dan apabila level log yang diberikan tidak dikenali, maka harus melemparkan `Psr\Log\InvalidArgumentException`.

## 6.4.2 Pesan

Pesan ini terdiri atas:

- Pesan Log**:** setiap metode menerima pesan berupa string atau objek yang memiliki metode `__toString()`.
- Placeholder digunakan dalam pesan log, yang akan diganti dengan nilai dari konteks (`context`).

Contoh:

```php
$logger->error('Kesalahan pada {file}', ['file' => 'config.php']);
```

```php
Kesalahan pada config.php
```

Format placeholder:

- Ditulis dengan kurung kurawal `{...}`.
- Hanya diperbolehkan menggunakan karakter huruf, angka, garis bawah `_`, atau titik `.`.

## 6.4.3 Konteks (Context)

Konteks adalah array tambahan untuk menyimpan data yang relevan dengan log. Misalnya, nama pengguna, ID, atau data tambahan lainnya. Apabila konteks memiliki key `'exception'`, maka nilai ini harus berupa objek Exception untuk menangkap stack trace.

Contoh penggunaan konteks:

```php
$logger->critical('Kesalahan terjadi', ['exception' => new Exception('Fatal error')]);
```

## 6.4.4 Kelas dan Trait Bantu (Helper)

PSR-3 menyediakan kelas dan trait berikut untuk mempermudah implementasi:

1. AbstractLogger: mempermudah implementasi dengan hanya mewajibkan untuk mengimplementasikan metode `log()`.
2. LoggerTrait: memungkinkan untuk menggunakan semua metode log hanya dengan mengimplementasikan metode `log()`.
3. NullLogger: logger “kosong” yang tidak menghasilkan apa-apa. Hal tersebut berguna sebagai fallback.
4. LoggerAwareInterface: antarmuka untuk kelas yang membutuhkan logger. Contoh metode `setLogger(LoggerInterface $logger);`.
5. LoggerAwareTrait: trait untuk mempermudah implementasi `LoggerAwareInterface`.
6. LogLevel: kelas ini mendefinisikan konstanta level log seperti `LogLevel::ERROR`, `LogLevel::DEBUG`.

Contoh LoggerInterface sesuai PSR-3:

```php
namespace Psr\Log;

interface LoggerInterface
{
    public function emergency($message, array $context = array());
    public function alert($message, array $context = array());
    public function critical($message, array $context = array());
    public function error($message, array $context = array());
    public function warning($message, array $context = array());
    public function notice($message, array $context = array());
    public function info($message, array $context = array());
    public function debug($message, array $context = array());
    public function log($level, $message, array $context = array());
}
```

Contoh LoggerAwareInterface:

Antarmuka ini memungkinkan kelas menerima logger dari luar.

```php
namespace Psr\Log;

interface LoggerAwareInterface
{
    public function setLogger(LoggerInterface $logger);
}
```

Contoh Konstanta LogLevel:

```php
namespace Psr\Log;

class LogLevel
{
    const EMERGENCY = 'emergency';
    const ALERT     = 'alert';
    const CRITICAL  = 'critical';
    const ERROR     = 'error';
    const WARNING   = 'warning';
    const NOTICE    = 'notice';
    const INFO      = 'info';
    const DEBUG     = 'debug';
}
```

Untuk setiap pengembangan sistem informasi wajib menerapkan mekanisme logging dengan standar PSR-3 agar lebih seragam dan mudah dipahami.