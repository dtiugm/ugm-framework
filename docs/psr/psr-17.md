# 6.7 PSR-17 HTTP Factories

PSR-17 menyediakan antarmuka untuk membuat objek HTTP yang sering digunakan pada aplikasi web berbasis PHP. Antarmuka ini berguna untuk mengabstraksi pembuatan objek HTTP dari logika aplikasi utama, sehingga mempermudah interoperabilitas antar framework atau library.

## 6.7.1 Antarmuka

Setiap antarmuka ini mempermudah pengelolaan objek-objek HTTP pada aplikasi PHP dengan cara yang konsisten dan dapat digunakan secara lintas library. Antarmuka utama dalam PSR-17 meliputi:

| **Antarmuka** | **Objek yang Dibuat** | **Kegunaan** |
| --- | --- | --- |
| RequestFactoryInterface | Request | Membuat permintaan HTTP untuk komunikasi keluar. |
| ResponseFactoryInterface | Response | Membuat tanggapan HTTP untuk dikirim ke klien. |
| ServerRequestFactoryInterface | ServerRequest | Membuat permintaan HTTP yang diterima oleh server. |
| StreamFactoryInterface | Stream | Membuat aliran data, seperti membaca/menulis file atau data HTTP. |
| UploadedFileFactoryInterface | UploadedFile | Membuat representasi file yang diunggah. |
| UriFactoryInterface | URI | Membuat dan mengelola URI untuk permintaan HTTP. |

## 6.7.2 Cara Implementasi

Untuk menggunakan PSR-17, diperlukan library yang mengimplementasikan antarmuka tersebut. Salah satu library populer adalah nyholm/psr7. Dengan menambahkan dependensi library menggunakan Composer:

```bash
composer require nyholm/psr7
```

1. Membuat request (RequestFactoryInterface)
    
    ```php
    <?php
    
    require 'vendor/autoload.php';
    
    use Nyholm\Psr7\Factory\Psr17Factory;
    
    $factory = new Psr17Factory();
    
    // Membuat Request HTTP GET ke URL tertentu
    $request = $factory->createRequest('GET', 'https://example.com');
    
    // Menambahkan header ke Request
    $request = $request->withHeader('Authorization', 'Bearer token123');
    
    echo $request->getMethod(); // GET
    echo $request->getUri();    // https://example.com
    ```
    
2. Membuat response (ResponseFactoryInterface)
    
    ```php
    <?php
    
    require 'vendor/autoload.php';
    
    use Nyholm\Psr7\Factory\Psr17Factory;
    
    $factory = new Psr17Factory();
    
    // Membuat Response dengan status 200 OK
    $response = $factory->createResponse(200);
    
    // Menambahkan konten ke Response
    $response = $response->withBody($factory->createStream('Hello, World!'));
    $response = $response->withHeader('Content-Type', 'text/plain');
    
    echo $response->getStatusCode(); // 200
    echo $response->getBody();       // Hello, World!
    ```
    
3. Membuat serverRequest (ServerRequestFactoryInterface)
    
    ```php
    <?php
    
    require 'vendor/autoload.php';
    
    use Nyholm\Psr7\Factory\Psr17Factory;
    
    $factory = new Psr17Factory();
    
    // Membuat ServerRequest dengan metode POST
    $serverRequest = $factory->createServerRequest('POST', 'https://example.com');
    
    // Menambahkan parameter query
    $serverRequest = $serverRequest->withQueryParams(['key' => 'value']);
    
    echo $serverRequest->getMethod();            // POST
    echo $serverRequest->getQueryParams()['key']; // value
    ```
    
4. Membuat stream (StreamFactoryInterface)
    
    ```php
    <?php
    
    require 'vendor/autoload.php';
    
    use Nyholm\Psr7\Factory\Psr17Factory;
    
    $factory = new Psr17Factory();
    
    // Membuat stream dari string
    $stream = $factory->createStream('Isi data stream.');
    
    // Membuat stream dari file
    $fileStream = $factory->createStreamFromFile('/path/to/file.txt', 'r');
    
    echo $stream->getContents(); // Isi data stream.
    ```
    
5. Membuat uploadedFile (UploadedFileFactoryInterface)
    
    ```php
    <?php
    
    require 'vendor/autoload.php';
    
    use Nyholm\Psr7\Factory\Psr17Factory;
    
    $factory = new Psr17Factory();
    
    // Membuat UploadedFile dari stream
    $stream = $factory->createStream('file content');
    $uploadedFile = $factory->createUploadedFile($stream, 1234, UPLOAD_ERR_OK, 'example.txt', 'text/plain');
    
    echo $uploadedFile->getClientFilename(); // example.txt
    echo $uploadedFile->getSize();           // 1234
    ```
    
6. Membuat URI (UriFactoryInterface)
    
    ```php
    <?php
    
    require 'vendor/autoload.php';
    
    use Nyholm\Psr7\Factory\Psr17Factory;
    
    $factory = new Psr17Factory();
    
    // Membuat URI
    $uri = $factory->createUri('https://example.com/path?query=value');
    
    echo $uri->getScheme(); // https
    echo $uri->getHost();   // example.com
    echo $uri->getPath();   // /path
    ```

## 6.7.3 Keuntungan

1. Konsistensi: Menyediakan antarmuka standar untuk membuat objek HTTP.
2. Interoperabilitas: Mempermudah integrasi antar library dan framework.
3. Fleksibilitas: Memungkinkan penggantian implementasi objek HTTP tanpa memengaruhi logika aplikasi.