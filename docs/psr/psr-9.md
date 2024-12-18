# 6.9 PSR-11 Container Interface

PSR-11 atau Container Interface adalah antarmuka yang mengatur cara pengelolaan dan pemanggilan dependensi di dalam aplikasi PHP. Sebuah container dependensi berfungsi untuk menyimpan objek-objek dan menangani pembuatan instansinya. PSR-11 menetapkan aturan bagi container agar objek dapat diambil melalui nama atau alias dan juga menangani lifecycle objek, seperti apakah objek harus selalu dibuat baru atau berbagi instansi yang sama.

PSR-11 menyediakan dua metode utama:

1. get(): untuk mendapatkan objek dari container.
2. has(): untuk memeriksa apakah objek tersedia dalam container.

## 6.9.1 Cara Implementasi

Untuk menggunakan PSR-11, diperlukan implementasi container yang mendukung standar ini. Salah satu container yang umum digunakan adalah PHP-DI. 
Instal library PHP-DI menggunakan Composer:

```bash
composer require php-di/php-di
```

Berikut adalah langkah-langkah penggunaan PSR-11 pada aplikasi PHP:

1. Membuat kelas yang akan dikelola oleh Container
    
    Misalnya: terdapat dua kelas yaitu `DatabaseConnection` dan `UserService`. Kelas `UserService` membutuhkan objek `DatabaseConnection` sebagai dependensinya. Berikut sebagai contohnya:
    
    Kelas DatabaseConnection
    
    ```php
    <?php
    
    class DatabaseConnection {
        public function connect() {
            return "Terhubung ke database!";
        }
    }
    ```
    
    Kelas UserService
    
    ```php
    <?php
    
    class UserService {
        private $databaseConnection;
    
        // Menyuntikkan dependensi DatabaseConnection melalui konstruktor
        public function __construct(DatabaseConnection $databaseConnection) {
            $this->databaseConnection = $databaseConnection;
        }
    
        public function getUser() {
            return "Pengguna data, " . $this->databaseConnection->connect();
        }
    }
    ```
    
2. Mengkonfigurasi Container
    
    Dalam hal ini, `ContainerBuilder` digunakan untuk membuat container yang akan menyimpan objek-objek dan dependensinya.
    
    ```php
    <?php
    
    require 'vendor/autoload.php';
    
    use DI\ContainerBuilder;
    
    // Membuat dan mengonfigurasi container
    $containerBuilder = new ContainerBuilder();
    $container = $containerBuilder->build();
    
    // Menambahkan objek DatabaseConnection ke dalam container
    $container->set(DatabaseConnection::class, DI\create(DatabaseConnection::class));
    
    // Menambahkan objek UserService dengan dependency injection
    $container->set(UserService::class, DI\create(UserService::class)->constructor(DI\get(DatabaseConnection::class)));
    ```
    
3. Mengambil dan menggunakan objek dari Container
    
    Saat ini, objek `UserService` dapat diambil dari container. Container akan secara otomatis menangani injeksi dependensi (dalam hal ini `DatabaseConnection`).
    
    ```php
    <?php
    
    // Mengambil objek UserService dari container
    $userService = $container->get(UserService::class);
    
    // Menggunakan objek UserService
    echo $userService->getUser();  // Output: Pengguna data, Terhubung ke database!
    ```
    

Penjelasan Kode

1. ContainerBuilder: digunakan untuk membuat container. Container ini menyimpan semua dependensi yang dibutuhkan oleh aplikasi.
2. set(): menambahkan objek ke dalam container. Dalam contoh ini, objek `DatabaseConnection` dan `UserService` ditambahkan.
3. get(): mengambil objek dari container. Saat mengambil objek `UserService`, container juga secara otomatis menyuntikkan objek `DatabaseConnection` ke dalamnya.
4. constructor(): digunakan untuk menyuntikkan dependensi ke dalam konstruktor objek `UserService`.

Berikut adalah hasil yang diperoleh setelah menjalankan kode di atas:

```php
Pengguna data, Terhubung ke database!
```

## 6.9.2 Keuntungan

1. Modularitas

    PSR-11 memungkinkan mengelola dan memisahkan dependensi dalam aplikasi, sehingga aplikasi lebih modular.

2. Interoperabilitas

    Aplikasi dapat dengan mudah berintegrasi dengan berbagai library dan framework yang mendukung PSR-11.

3. Dependency Injection

    PSR-11 mendukung pola dependency injection, yang memungkinkan pengelolaan objek lebih fleksibel dan mudah diuji.
