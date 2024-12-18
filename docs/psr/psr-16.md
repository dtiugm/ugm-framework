# 6.12 PSR-16 Simple Cache

PSR-16 adalah standar PHP-FIG (PHP Framework Interoperability Group) yang mendefinisikan antarmuka caching sederhana. PSR adalah singkatan dari "PHP Standard Recommendation," dan PSR-16 secara khusus menguraikan sebuah antarmuka yang konsisten dan sederhana untuk operasi caching. PSR-16 berfokus pada penyediaan API yang minimalis untuk mengelola cache.

## 6.12.1 Antarmuka Utama

PSR-16 mendefinisikan `Psr\SimpleCache\CacheInterface`, yang berisi metode dasar untuk operasi cache berikut:

1. `get($key, $default = null)`
    
    Fungsi ini mengambil nilai dari cache berdasarkan kunci yang diberikan. Kemudian akan mengembalikan nilai yang di-cache atau nilai default apabila kunci tidak ditemukan.
    
2. `set($key, $value, $ttl = null)`
    
    Fungsi yang menyimpan nilai di cache dengan kunci yang diberikan. Dan parameter `$ttl` (time-to-live) adalah waktu kedaluwarsa dalam detik.
    
3. `delete($key)` untuk menghapus nilai dari cache berdasarkan kunci yang diberikan.
4. `clear()` digunakan menghapus semua nilai dari cache.
5. `getMultiple($keys, $default = null)`
    
    Fungsi yang mengambil nilai dari cache berdasarkan beberapa kunci yang diberikan. Dan akan mengembalikan array nilai yang di-cache atau nilai default untuk kunci yang tidak ditemukan.
    
6. `setMultiple($values, $ttl = null)` akan menyimpan beberapa nilai di cache berdasarkan array pasangan kunci-nilai yang diberikan.
7. `deleteMultiple($keys)` untuk menghapus beberapa nilai dari cache berdasarkan array kunci yang diberikan.
8. `has($key)` fungsi yang digunakan untuk memeriksa apakah kunci tertentu ada di cache.

## 6.12.2 Contoh Penggunaan

Berikut adalah contoh penggunaan PSR-16 pada sebuah aplikasi PHP menggunakan implementasi cache sederhana berbasis array seperti yang telah dijelaskan sebelumnya.

1. Implementasi cache
    
    ```php
    require 'vendor/autoload.php';
    
    use Psr\SimpleCache\CacheInterface;
    
    class ArrayCache implements CacheInterface
    {
        private $cache = [];
        private $ttl = [];
    
        public function get($key, $default = null)
        {
            if ($this->has($key)) {
                return $this->cache[$key];
            }
            return $default;
        }
    
        public function set($key, $value, $ttl = null)
        {
            $this->cache[$key] = $value;
            if ($ttl !== null) {
                $this->ttl[$key] = time() + $ttl;
            }
            return true;
        }
    
        public function delete($key)
        {
            unset($this->cache[$key], $this->ttl[$key]);
            return true;
        }
    
        public function clear()
        {
            $this->cache = [];
            $this->ttl = [];
            return true;
        }
    
        public function getMultiple($keys, $default = null)
        {
            $results = [];
            foreach ($keys as $key) {
                $results[$key] = $this->get($key, $default);
            }
            return $results;
        }
    
        public function setMultiple($values, $ttl = null)
        {
            foreach ($values as $key => $value) {
                $this->set($key, $value, $ttl);
            }
            return true;
        }
    
        public function deleteMultiple($keys)
        {
            foreach ($keys as $key) {
                $this->delete($key);
            }
            return true;
        }
    
        public function has($key)
        {
            if (isset($this->ttl[$key]) && time() > $this->ttl[$key]) {
                $this->delete($key);
                return false;
            }
            return isset($this->cache[$key]);
        }
    }
    ```
    
2. Mengintegrasikan cache dalam aplikasi
    
    ```php
    // Inisialisasi cache
    $cache = new ArrayCache();
    
    // Setel nilai di cache
    $key = 'user_123';
    $value = ['name' => 'John Doe', 'email' => 'john@example.com'];
    $ttl = 3600; // 1 jam
    $cache->set($key, $value, $ttl);
    
    // Ambil nilai dari cache
    $cachedUser = $cache->get($key);
    if ($cachedUser !== null) {
        echo "User found in cache: " . print_r($cachedUser, true);
    } else {
        echo "User not found in cache, fetching from database...";
        // Logika untuk mengambil data dari database
    }
    
    // Menghapus nilai dari cache
    $cache->delete($key);
    
    // Menggunakan multiple cache methods
    $cache->setMultiple([
        'user_1' => ['name' => 'Alice', 'email' => 'alice@example.com'],
        'user_2' => ['name' => 'Bob', 'email' => 'bob@example.com']
    ], $ttl);
    
    $users = $cache->getMultiple(['user_1', 'user_2']);
    echo "Users: " . print_r($users, true);
    
    $cache->deleteMultiple(['user_1', 'user_2']);
    ```
    

## 6.12.3 Manfaat Penggunaan

PSR-16 bertujuan untuk menyediakan antarmuka caching yang sederhana dan konsisten, yang memungkinkan pengembang untuk mengintegrasikan mekanisme caching pada aplikasi mereka dengan mudah. Beberapa permasalahan utama pada PSR-16 yang menjadi prioritas dalam penyelesaiannya meliputi:

1. Penghematan sumber daya
    
    Mengurangi beban pada sumber daya seperti basis data dan API eksternal dengan menyimpan data sementara pada cache.
    
2. Peningkatan performa
    
    Mempercepat akses data dengan mengambil data dari cache yang cepat daripada harus memproses ulang atau mengambil dari sumber yang lebih lambat.
    
3. Interoperabilitas
    
    Menstandarisasi antarmuka caching sehingga berbagai library dan framework dapat bekerja bersama-sama tanpa perlu penyesuaian besar.
    
4. Kemudahan penggunaan
    
    Menyediakan API yang sederhana dan intuitif sehingga pengembang dapat dengan cepat dan mudah mengimplementasikan caching dalam aplikasi mereka.