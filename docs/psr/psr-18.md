# 6.8 PSR-18 HTTP Client

PSR-18 merupakan standar interface untuk library client HTTP di PHP. Standar ini bertujuan untuk menyederhanakan proses interaksi dengan server HTTP dan memfasilitasi interoperabilitas antar library client HTTP yang berbeda. Dengan mengikuti PSR-18, diharapkan dapat menciptakan aplikasi yang lebih terstruktur, mudah dipelihara, dan dapat berinteraksi dengan berbagai komponen lainnya dengan lebih baik.

## 6.8.1 Prinsip Dasar PSR-18:

1. Interface client
    
    Mendefinisikan interface `Psr\Http\Client\ClientInterface` yang harus diimplementasikan oleh semua library client HTTP. Interface ini menyediakan metode untuk membuat dan mengirim permintaan HTTP, serta menerima dan memproses respons HTTP.
    
2. Permintaan HTTP
    
    Mendefinisikan interface `Psr\Http\Message\RequestInterface` untuk mewakili permintaan HTTP. Interface ini menyediakan metode untuk mendapatkan informasi tentang permintaan, seperti URL, metode HTTP, header, dan badan permintaan
    
3. Response HTTP
    
    Mendefinisikan interface `Psr\Http\Message\ResponseInterface` untuk mewakili respons HTTP. Interface ini menyediakan metode untuk mendapatkan informasi tentang respons, seperti status code, header, dan badan respons.
    
4. Stream Pesan:
    
    Mendukung penggunaan stream untuk membaca dan menulis badan pesan HTTP.
    

Contoh Implementasi PSR-18 dalam kode:

```php
use Psr\Http\Client\ClientInterface;
use Psr\Http\Message\RequestInterface;

class MyHttpClient implements ClientInterface
{
    public function sendRequest(RequestInterface $request): Promise
    {
        // Buat dan kirim permintaan HTTP
        $curl = curl_init($request->getUri()->__toString());
        curl_setopt($curl, CURLOPT_CUSTOMREQUEST, $request->getMethod());
        curl_setopt($curl, CURLOPT_HTTPHEADER, $request->getHeaders());
        curl_setopt($curl, CURLOPT_POSTFIELDS, $request->getBody()->getContents());
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);

        $response = curl_exec($curl);
        curl_close($curl);

        // Buat dan kembalikan Promise untuk respons HTTP
        $promise = new Promise(function ($resolve, $reject) use ($response) {
            if ($response === false) {
                $reject(new Exception('CURL error: ' . curl_error($curl)));
                return;
            }

            $statusLine = trim(fgets($response));
            $statusCode = (int) explode(' ', $statusLine)[1];

            $headers = [];
            while (($line = fgets($response)) !== false) {
                if (strlen(trim($line)) === 0) {
                    break;
                }

                $parts = explode(':', $line, 2);
                $headers[trim($parts[0])] = trim($parts[1]);
            }

            $responseBody = stream_get_contents($response);

            $httpResponse = new Response($statusCode, $headers, $responseBody);
            $resolve($httpResponse);
        });

        return $promise;
    }
}

// Contoh penggunaan
$httpClient = new MyHttpClient();
$request = new Request('GET', 'https://example.com');

$promise = $httpClient->sendRequest($request);
$promise->then(function (ResponseInterface $response) {
    echo "Status code: " . $response->getStatusCode() . "\n";
    echo "Content: " . $response->getBody()->getContents() . "\n";
});
```

## 6.8.2 Manfaat

Adapun manfaat dari penerapan PSR-18 adalah sebagai berikut:

1. Meningkatkan keterbacaan dan organisasi kode HTTP karena telah konsisten sesuai standar.
2. Mempermudah integrasi dengan library HTTP pihak ketiga selama mengikuti interface yang sama.
3. Memisahkan logika HTTP dari aplikasi sehingga dapat digunakan oleh class lainnya dalam satu aplikasi.
4. Mendukung pengujian unit dan integrasi yang lebih mudah.

## 6.8.3 Kelemahan

Meskipun disarankan untuk menggunakan PSR-18, namun PSR-18 masih memiliki beberapa kendal, antar lain:

1. Standar ini masih tergolong baru dan belum diadopsi secara luas.
2. Beberapa library HTTP populer belum mendukung PSR-18 secara penuh.
3. Implementasi PSR-18 yang berbeda mungkin memiliki cara kerja yang berbeda.