# 6.6 PSR-15 HTTP Server Request Handlers

PSR-15 merupakan salah satu standar yang ditetapkan oleh PHP-FIG untuk mendefinisikan HTTP Server Request Handlers dan Middleware dalam PHP. Standar ini bertujuan untuk menyediakan kerangka kerja bagi pengelolaan permintaan HTTP yang konsisten dan interoperable menggunakan pendekatan berbasis middleware, yang mirip dengan konsep pada framework seperti Express.js di Node.js atau Middleware Pipeline di ASP.NET Core.

Komponen Utama PSR-15

1. Antarmuka Middleware:
Middleware merupakan komponen yang berada diantara permintaan klien dan aplikasi. Middleware memproses permintaan server yang masuk dan menghasilkan response, dengan pilihan untuk mendelegasikan pembuatan respons ke komponen middleware berikutnya. Middleware yang mengikuti pedoman PSR-15 ini sebaiknya menggunakan interface `Psr\Http\Server\MiddlewareInterface`
    
    ```php
    namespace Psr\Http\Server;
    
    use Psr\Http\Message\ResponseInterface;
    use Psr\Http\Message\ServerRequestInterface;
    
    interface MiddlewareInterface
    {
        public function process(ServerRequestInterface $request, RequestHandlerInterface $handler): ResponseInterface;
    }
    ```
    
2. Antarmuka Request Handler:
Request handler menerima permintaan server dan mengembalikan response. Objek yang mengimplementasikan interface ini menerima permintaan (PSR-7 `RequestInterface`) dan harus mengembalikan response (PSR-7 `ResponseInterface`).
    
    ```php
    namespace Psr\Http\Server;
    
    use Psr\Http\Message\ResponseInterface;
    use Psr\Http\Message\ServerRequestInterface;
    
    interface RequestHandlerInterface
    {
        public function handle(ServerRequestInterface $request): ResponseInterface;
    }
    
    ```
    

Contoh Penggunaan

Berikut adalah contoh cara membuat middleware dan request handler menggunakan PSR-15:

1. Contoh middleware:
    
    ```php
    namespace App\Middleware;
    
    use Psr\Http\Message\ResponseInterface;
    use Psr\Http\Message\ServerRequestInterface;
    use Psr\Http\Server\MiddlewareInterface;
    use Psr\Http\Server\RequestHandlerInterface;
    
    class ExampleMiddleware implements MiddlewareInterface
    {
        public function process(ServerRequestInterface $request, RequestHandlerInterface $handler): ResponseInterface
        {
            // Melakukan sesuatu dengan permintaan
            $response = $handler->handle($request);
            // Melakukan sesuatu dengan respons
            return $response;
        }
    }
    
    ```
    
2. Contoh request handler:
    
    ```php
    namespace App\Handler;
    
    use Psr\Http\Message\ResponseInterface;
    use Psr\Http\Message\ServerRequestInterface;
    use Psr\Http\Server\RequestHandlerInterface;
    use Zend\Diactoros\Response;
    
    class ExampleHandler implements RequestHandlerInterface
    {
        public function handle(ServerRequestInterface $request): ResponseInterface
        {
            $response = new Response();
            $response->getBody()->write('Hello, World!');
            return $response;
        }
    }
    ```
    
3. Menggunakan middleware dan handler:
    
    Dispatcher middleware biasanya digunakan untuk menangani urutan middleware dan akhirnya memanggil request handler. Berikut adalah contoh sederhana cara mengaturnya:
    
    ```php
    use Laminas\Stratigility\MiddlewarePipe;
    use Laminas\Stratigility\Middleware\RequestHandlerMiddleware;
    use Laminas\Diactoros\ServerRequestFactory;
    use Laminas\Diactoros\ResponseFactory;
    
    $app = new MiddlewarePipe();
    $app->pipe(new ExampleMiddleware());
    $app->pipe(new RequestHandlerMiddleware(new ExampleHandler()));
    
    $request = ServerRequestFactory::fromGlobals();
    $response = $app->handle($request);
    
    // Emit respons
    $emitter = new \Laminas\HttpHandlerRunner\Emitter\SapiEmitter();
    $emitter->emit($response);
    ```
    
    Dalam pengaturan ini, `MiddlewarePipe` menangani tumpukan middleware, dan setiap komponen middleware dapat memproses permintaan dan menghasilkan response atau meneruskan permintaan ke middleware berikutnya. `RequestHandlerMiddleware` membungkus request handler terakhir.
    
    Contoh ini menggunakan komponen Laminas (sebelumnya Zend) untuk menangani pesan HTTP dan dispatching middleware, tetapi pola serupa berlaku dengan pustaka lain yang kompatibel dengan PSR-7 dan PSR-15.
