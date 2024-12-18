# 6.5 PSR-7 HTTP Message Interface

PSR-7 adalah standar untuk mengelola pesan HTTP dalam aplikasi PHP. PSR-7 mendefinisikan antarmuka untuk objek yang mewakili permintaan HTTP (Request) dan respons HTTP (Response), serta cara mengelola elemen-elemen HTTP lainnya seperti header, URI, dan body.

Implementasi PSR-7 memungkinkan pengelolaan pesan HTTP secara standar, yang membuat kode lebih modular dan dapat digunakan bersama dengan berbagai framework dan library PHP.

Pesan HTTP biasanya disarikan dari konsumen pengguna akhir. Namun sebagai pengembang, penting untuk memahami bagaimana pesan ini disusun dan bagaimana cara mengakses atau memanipulasinya. Hal ini diperlukan baik untuk membuat permintaan ke API HTTP, maupun untuk menangani permintaan yang masuk. Setiap pesan permintaan HTTP memiliki struktur tertentu. Contohnya:

```php
POST /path HTTP/1.1
Host: example.com

foo=bar&baz=bat
```

Pada contoh di atas, baris pertama adalah baris permintaan, yang berisi tiga komponen penting:

1. Metode permintaan HTTP (seperti `POST`, `GET`, dll.)
2. Target permintaan (biasanya berupa URI absolut atau jalur di server web)
3. Versi protokol HTTP (misalnya, `HTTP/1.1`).

Setelah baris permintaan, terdapat satu atau lebih header HTTP yang memberikan informasi tambahan tentang permintaan. Diikuti dengan baris kosong yang menandakan berakhirnya header, kemudian terdapat isi pesan (body) yang berisi data yang dikirimkan (misalnya data formulir dalam permintaan POST).

Pesan response HTTP memiliki struktur yang mirip, namun terdapat perbedaan pada baris pertama. Contohnya:

```php
HTTP/1.1 200 OK
Content-Type: text/plain

This is the response body
```

Pada contoh response ini, baris pertama disebut baris status yang terdiri dari:

1. Versi protokol HTTP
2. Kode status HTTP (misalnya, `200` menandakan permintaan berhasil)
3. Frasa alasan yang memberikan deskripsi kode status yang dapat dibaca manusia (misalnya, `OK`).

Setelah baris status, ada satu atau lebih header HTTP yang memberikan informasi tambahan tentang respons tersebut, diikuti oleh baris kosong, dan kemudian isi pesan yang berisi data yang dikirimkan sebagai respons (misalnya teks atau file).

Dengan memahami struktur pesan permintaan dan respons HTTP, pengembang dapat dengan mudah membuat, mengirim, dan memanipulasi data dalam aplikasi web, serta menangani permintaan yang diterima dengan tepat.

## 6.5.1 Cara Implementasi

Untuk mulai menggunakan PSR-7, diperlukan library yang mendukung standar ini. Salah satu library yang banyak digunakan adalah nyholm/psr7. 
Instal nyholm/psr7 menggunakan composer:

```php
composer require nyholm/psr7
```

1. Membuat dan mengonfigurasi request
Untuk membuat permintaan HTTP menggunakan PSR-7, digunakan antarmuka `RequestInterface` yang mendefinisikan berbagai metode untuk mengelola request seperti URI, metode HTTP, header, dan body.
    
    ```php
    <?php
    
    require 'vendor/autoload.php';
    
    use Nyholm\Psr7\Factory\Psr17Factory;
    
    // Membuat instance Psr17Factory
    $factory = new Psr17Factory();
    
    // Membuat Request HTTP GET
    $request = $factory->createRequest('GET', 'https://example.com');
    
    // Menambahkan header
    $request = $request->withHeader('User-Agent', 'MyApp/1.0');
    
    // Menambahkan query string
    $request = $request->withQueryParams(['key' => 'value']);
    
    // Menambahkan body
    $request = $request->withBody($factory->createStream('This is the request body.'));
    
    echo $request->getMethod();  
    echo $request->getUri();  
    echo $request->getBody();  
    
    ```
    
    Output:
    
    ```php
    GET
    https://example.com?key=value
    This is the request body.
    ```
    
2. Membuat dan mengonfigurasi response
Untuk membuat response HTTP, digunakan antarmuka `ResponseInterface` yang mendefinisikan metode untuk mengelola status, header, dan body dari response.
    
    ```php
    <?php
    
    require 'vendor/autoload.php';
    
    use Nyholm\Psr7\Factory\Psr17Factory;
    
    // Membuat instance Psr17Factory
    $factory = new Psr17Factory();
    
    // Membuat Response HTTP 200 OK
    $response = $factory->createResponse(200);
    
    // Menambahkan header
    $response = $response->withHeader('Content-Type', 'text/plain');
    
    // Menambahkan body
    $response = $response->withBody($factory->createStream('Hello, World!'));
    
    echo $response->getStatusCode(); 
    echo $response->getHeaderLine('Content-Type'); 
    echo $response->getBody();  
    ```
    
    Output:
    
    ```php
    200
    text/plain
    Hello, World!
    ```
    
3. Membuat dan mengonfigurasi URI
    
    PSR-7 juga menyediakan antarmuka `UriInterface` untuk mengelola URI. URI digunakan untuk mengidentifikasi sumber daya pada web dan dapat digunakan pada request dan response.
    
    ```php
    <?php
    
    require 'vendor/autoload.php';
    
    use Nyholm\Psr7\Factory\Psr17Factory;
    
    // Membuat instance Psr17Factory
    $factory = new Psr17Factory();
    
    // Membuat URI
    $uri = $factory->createUri('https://example.com/path?query=value');
    
    echo $uri->getScheme();  
    echo $uri->getHost();    
    echo $uri->getPath();    
    echo $uri->getQuery();  
    ```
    
    Output:
    
    ```php
    https
    example.com
    /path
    query=value
    ```
    
4. Menggunakan stream
    
    PSR-7 menyediakan antarmuka `StreamInterface` untuk menangani aliran data dalam body dari pesan HTTP. Data ini dapat berupa teks, file, atau data lainnya.
    
    ```php
    <?php
    
    require 'vendor/autoload.php';
    
    use Nyholm\Psr7\Factory\Psr17Factory;
    
    // Membuat instance Psr17Factory
    $factory = new Psr17Factory();
    
    // Membuat stream dari string
    $stream = $factory->createStream('This is the body content.');
    
    echo $stream->getContents(); // This is the body content.
    ```
    
    Output:
    
    ```php
    This is the body content.
    ```
    

## 6.5.2 Menangani Header

Header adalah bagian penting dalam pesan HTTP yang menyertakan informasi tambahan. PSR-7 memungkinkan untuk mendapatkan, menambahkan, atau mengubah header.

```php
<?php

require 'vendor/autoload.php';

use Nyholm\Psr7\Factory\Psr17Factory;

// Membuat instance Psr17Factory
$factory = new Psr17Factory();

// Membuat Response HTTP 200 OK
$response = $factory->createResponse(200);

// Menambahkan header Content-Type
$response = $response->withHeader('Content-Type', 'application/json');

// Mengambil nilai header
echo $response->getHeaderLine('Content-Type');  // application/json
```

## 6.5.3 Keuntungan

1. Modularitas: PSR-7 memungkinkan pengelolaan pesan HTTP secara modular dengan antarmuka standar yang dapat digunakan di berbagai library dan framework.
2. Interoperabilitas: mempermudah aplikasi untuk bekerja dengan berbagai library atau framework yang mendukung PSR-7, seperti middleware atau server HTTP.
3. Fleksibilitas: PSR-7 memberi fleksibilitas dalam menangani berbagai aspek HTTP seperti body, header, dan URI tanpa terikat pada implementasi spesifik.
