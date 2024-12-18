## 8.5 Flexibel Configuration KrakenD dengan FastAPI

Flexible Configuration memungkinkan pembuatan konfigurasi API Gateway menggunakan KrakenD secara otomatis dengan memanfaatkan template Go. FastAPI menyediakan kemampuan untuk menghasilkan file `openapi.json` yang berisi informasi detail tentang API, seperti host, endpoint, dan parameter yang dibutuhkan. Dengan menggunakan file `openapi.json`, konfigurasi KrakenD dapat dihasilkan secara otomatis dan disesuaikan dengan kebutuhan lingkungan *development* atau *production*.

Template Go pada KrakenD mempermudah pengelolaan konfigurasi dengan membagi file besar menjadi bagian-bagian kecil yang lebih mudah dikelola dan dimodifikasi. Konfigurasi ini memungkinkan pengelolaan API secara modular dan fleksibel.

### 8.5.1 Langkah-langkah Generate Konfigurasi KrakenD dengan Script

Berikut adalah langkah-langkah untuk menghasilkan konfigurasi KrakenD secara otomatis dengan menggunakan script PHP yang membaca file `openapi.json` dan menghasilkan file template KrakenD.

1. **Persiapkan File `openapi.json`**:
FastAPI secara otomatis menghasilkan file `openapi.json` yang berisi informasi endpoint, parameter, dan host API. Pastikan file `openapi.json` tersedia dan dapat diakses oleh script.
2. **Gunakan Script PHP untuk Menghasilkan Konfigurasi KrakenD**:
Berikut adalah script PHP yang digunakan untuk membaca `openapi.json` dan menghasilkan konfigurasi KrakenD secara otomatis.

### Script PHP untuk Menghasilkan Konfigurasi KrakenD

```bash
<?php
require 'helper.php';

$list_openapi_json = __DIR__ . '/../config/list_openapi.json';
$PATH_SETTING_HOST = __DIR__ . '/../config/krakend/settings';
$INPUT_HEADERS_FILENAME = __DIR__ . '/../config/krakend/partials/input_headers.tmpl';
$SETTING_HOST_FILENAME = 'host.json';
$PATH_ENDPOINTS = __DIR__ . '/../config/krakend/endpoints';

// Baca file JSON dan decode dengan error handling yang lebih baik
$list_openapi_data = file_get_contents($list_openapi_json);
if ($list_openapi_data === false) {
    die("Gagal membaca file config OPENAPI.JSON");
}

try {
    $list_openapi = json_decode($list_openapi_data, true, 512, JSON_THROW_ON_ERROR);
} catch (JsonException $e) {
    die("Gagal decode JSON: " . $e->getMessage());
}

$SETTING_HOST_PROD = [];
$SETTING_HOST_DEV = [];
$input_headers = ["Content-Type", "Authorization", "Accept"];

$SETTING_HOST_PROD['vnext_staff'] = "host_prod_1";
$SETTING_HOST_DEV['vnext_staff'] = "host_dev_1";
$SETTING_HOST_PROD['vnext_student'] = "host_prod_2";
$SETTING_HOST_DEV['vnext_student'] = "host_dev_2";

// Loop untuk mengisi konfigurasi host berdasarkan environment
foreach ($list_openapi as $openapi) {
    $endpoints = [];
    $API_NAME_CLEAN = make_url_friendly($openapi['name']);
    // buat object untuk host.json
    foreach ($openapi['host'] as $host) {
        if ($host['environment'] === 'production') {
            $SETTING_HOST_PROD[$API_NAME_CLEAN] = $host['url'];
        } elseif ($host['environment'] === 'development') {
            $SETTING_HOST_DEV[$API_NAME_CLEAN] = $host['url'];
        }
    }

    $openapi_json_content = file_get_contents($openapi['url']);

    if ($openapi_json_content === false) {
        die("Gagal membaca file config openapi.json : ".$openapi['name']);
    }

    try {
        $openapi_content = json_decode($openapi_json_content, true);
    } catch (JsonException $e) {
        die("Gagal decode JSON: " . $e->getMessage());
    }

    $version = make_url_friendly($openapi_content['info']['version']);

    $paths = array_keys($openapi_content['paths']);
    foreach( $paths as $path) {
        if ($path == "/"){
            continue;
        }
        $methods = array_keys($openapi_content['paths'][$path]);

        foreach( $methods as $method) {
            $query = array();

            if (isset($openapi_content['paths'][$path][$method]['parameters'])){
                $data = array_keys($openapi_content['paths'][$path][$method]['parameters']);
                foreach($data as $row => $item){
                    if (isset($openapi_content['paths'][$path][$method]['parameters'][$item])){
                        $d1 = $openapi_content['paths'][$path][$method]['parameters'][$item];
                        if ($d1['in'] == 'query'){
                            $query[] = $d1["name"];
                        }
                    }
                }
            }
            $endpoints[] = array(
                "endpoint" => $path,
                "method" => strtoupper($method),
                "output_encoding" => "no-op",
                "backend" => array(
                    array(
                        "url_pattern" => $path,
                        "encoding" => "json",
                        "sd" => "static",
                        "method" => strtoupper($method),
                        "host" => [
                            "{{ .host.".$API_NAME_CLEAN." }}"
                        ],
                        "disable_host_sanitize" => false
                    )
                ),
                "input_query_strings" => $query,
                "input_headers" => '{{ include "input_headers.tmpl" }}'
            );
        }
    }

    try {
        if (!empty($endpoints)) {
            write_json_file(
                $PATH_ENDPOINTS . DIRECTORY_SEPARATOR . $API_NAME_CLEAN.'.tmpl',
                $endpoints,
                true
            );
        }

    } catch (JsonException $e) {
        die("Gagal encode JSON untuk endpoints ".$openapi['name']." file: " . $e->getMessage());
    }

}

// buat input_headers.tmpl
try {
    write_json_file($INPUT_HEADERS_FILENAME, $input_headers);
}catch (JsonException $e) {
    die("Gagal encode JSON: " . $e->getMessage());
}

try {
    if (!empty($SETTING_HOST_PROD)) {
        write_json_file(
            $PATH_SETTING_HOST . DIRECTORY_SEPARATOR . 'prod' . DIRECTORY_SEPARATOR . $SETTING_HOST_FILENAME,
            $SETTING_HOST_PROD
        );
    }

    if (!empty($SETTING_HOST_DEV)) {
        write_json_file(
            $PATH_SETTING_HOST . DIRECTORY_SEPARATOR . 'dev' . DIRECTORY_SEPARATOR . $SETTING_HOST_FILENAME,
            $SETTING_HOST_DEV
        );
    }
} catch (JsonException $e) {
    die("Gagal encode JSON untuk host file: " . $e->getMessage());
}

```

### Output Struktur Folder

Setelah menjalankan script di atas, struktur folder untuk konfigurasi KrakenD yang dihasilkan adalah sebagai berikut:

```markdown
krakend/
├── config/
│   ├── krakend/
│   │   ├── endpoints/
│   │   │   └── api_name.tmpl
│   │   ├── partials/
│   │   │   └── input_headers.tmpl
│   │   ├── settings/
│   │   │   ├── dev/
│   │   │   │   └── host.json
│   │   │   └── prod/
│   │   │       └── host.json
|   |   |__ krakend.tmpl
│   └── list_openapi.json
└── helper.php
```

**Keuntungan**:

- **Otomatisasi**: Konfigurasi KrakenD dapat dihasilkan secara otomatis, mengurangi kesalahan dan mempercepat waktu pengembangan.
- **Modular dan Organisatif**: Konfigurasi API dibagi menjadi bagian-bagian kecil yang lebih mudah dikelola, seperti template endpoint dan file host terpisah untuk lingkungan yang berbeda.
- **Fleksibilitas dan Skalabilitas**: Memungkinkan pengelolaan API yang berbeda di lingkungan yang berbeda tanpa perlu perubahan manual pada setiap file konfigurasi.