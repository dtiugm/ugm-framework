# 8.4 Fungsi Lain dari Krakend

## 8.4.1 Transformasi Data

Transformasi data memungkinkan Krakend mengubah struktur data respons sebelum mengirimkannya ke klien. Contoh kasus termasuk menghapus field sensitif atau menambahkan informasi tambahan.

**Contoh Transformasi:**

Misalkan backend mengembalikan data berikut:

```json
{
  "id": 1,
  "name": "John Doe",
  "password": "hashedpassword"
}

```

Kemudian ingin menghapus field `password` dari respons, maka configurasi seperti ini:

```json
{
  "endpoints": [
    {
      "endpoint": "/api/v1/user",
      "method": "GET",
      "backend": [
        {
          "host": ["http://user-service"],
          "url_pattern": "/user-data"
        }
      ],
      "extra_config": {
        "github.com/devopsfaith/krakend-jsonschema": {
          "properties": {
            "id": {},
            "name": {}
          }
        }
      }
    }
  ]
}

```

Hasil transformasi:

```json
{
  "id": 1,
  "name": "John Doe"
}

```

## 8.4.2 Load Balancing

Krakend mendukung load balancing untuk mendistribusikan permintaan secara merata ke beberapa instance backend.

**Contoh Load Balancing:**

```json
{
  "backend": [
    {
      "host": ["http://backend1-service", "http://backend2-service"],
      "url_pattern": "/data"
    }
  ]
}

```

Fitur ini membantu meningkatkan ketersediaan layanan dan menangani lebih banyak permintaan.

## 8.4.3 Monitoring

Monitoring penting untuk memantau performa API Gateway, mengidentifikasi bottleneck, dan mendeteksi masalah sebelum memengaruhi layanan secara keseluruhan. Krakend mendukung integrasi dengan **Prometheus**, alat open-source yang populer untuk pengumpulan dan analisis metrik.

## Konfigurasi Monitoring dengan Prometheus

1. Mengaktifkan Monitoring di Krakend

Tambahkan konfigurasi berikut dalam file JSON Krakend untuk mengaktifkan metrik Prometheus:

```json
{
  "extra_config": {
    "github_com/devopsfaith/krakend-metrics": {
      "collection_time": "60s",
      "proxy_disabled": false,
      "router_disabled": false,
      "endpoint": "/__metrics"
    }
  }
}
```

Penjelasan konfigurasi:

- **`collection_time`**: Interval pengumpulan metrik. Misalnya, "60s" berarti setiap 60 detik.
- **`proxy_disabled`**: Jika `false`, metrik dari lapisan proxy akan dikumpulkan.
- **`router_disabled`**: Jika `false`, metrik dari lapisan routing akan dikumpulkan.
- **`endpoint`**: Endpoint tempat metrik Prometheus dapat diakses (default: `/__metrics`).

2. Expose Endpoint Metrik

Endpoint `/__metrics` akan tersedia setelah konfigurasi diaktifkan. Prometheus dapat mengakses endpoint ini untuk menarik (scrape) metrik.

Contoh respons dari endpoint `/__metrics`:

```bash
# HELP krakend_requests_total Total number of requests handled
# TYPE krakend_requests_total counter
krakend_requests_total{endpoint="/api/v1/resource",method="GET"} 150
krakend_requests_total{endpoint="/api/v1/secure",method="POST"} 50
```

3. Menambahkan Krakend ke Konfigurasi Prometheus

Tambahkan Krakend sebagai target di file konfigurasi Prometheus (`prometheus.yml`):

```yaml
scrape_configs:
  - job_name: "krakend"
    static_configs:
      - targets: ["localhost:8080"] # Ganti dengan host dan port Krakend
```

## Metrik yang Didukung Krakend

Berikut adalah beberapa metrik utama yang dihasilkan oleh Krakend:

- **`krakend_requests_total`**: Jumlah total permintaan yang diterima oleh endpoint tertentu.
- **`krakend_latency_ms`**: Latensi permintaan dalam milidetik.
- **`krakend_backend_latency_ms`**: Latensi antara Krakend dan backend untuk permintaan tertentu.
- **`krakend_response_size_bytes`**: Ukuran respons yang dikirimkan oleh endpoint tertentu.
- **`krakend_errors_total`**: Jumlah total kesalahan yang terjadi pada endpoint.

## Visualisasi dengan Grafana

Prometheus dapat diintegrasikan dengan **Grafana** untuk membuat dashboard visual.

1. **Tambahkan Prometheus sebagai Data Source** di Grafana.
2. Buat panel baru di Grafana untuk memvisualisasikan metrik tertentu. Misalnya:
    - Query untuk jumlah permintaan per endpoint:
    
    ```sql
    sum(rate(krakend_requests_total[1m])) by (endpoint
    ```
    
    - Query untuk latensi rata-rata:
    
    ```sql
    avg(krakend_latency_ms) by (endpoint)
    ```
    

## 8.4.4 Logging

### Format Logging

Secara default, Krakend mencatat log di konsol dalam format JSON. Log ini mencakup informasi seperti permintaan, respons, waktu proses, dan kesalahan.

Contoh log Krakend:

```json
{
  "level": "INFO",
  "time": "2024-12-12T10:00:00Z",
  "message": "Request completed",
  "method": "GET",
  "endpoint": "/api/v1/resource",
  "status": 200,
  "duration": 45
}
```

### Customizing Logging

Logging Krakend dapat dikustomisasi dengan menambahkan plugin logging atau menggunakan log processor eksternal seperti ELK Stack (Elasticsearch, Logstash, Kibana).

Tambahkan konfigurasi untuk log level:

```json
{
  "logs": {
    "level": "DEBUG" // Level log: DEBUG, INFO, WARN, ERROR
  }
}
```

## 8.4.5 Caching

Krakend mendukung caching untuk meningkatkan performa response API. Berikut contoh konfigurasi caching:

```json
{
  "extra_config": {
    "github.com/devopsfaith/krakend-httpcache": {
      "cache_size": 1000,
      "memory": {
        "max": 100
      }
    }
  }
}
```

- **`cache_size`**: Ukuran cache maksimum.
- **`memory.max`**: Kapasitas maksimum memori untuk cache.