# Panduan Docker

## 11.4.1 Apa itu Docker?
Docker adalah platform open-source yang memungkinkan kita untuk membuat, mendistribusikan, dan menjalankan aplikasi di dalam **container**. Container adalah semacam "mini komputer virtual" yang berisi semua yang dibutuhkan untuk menjalankan aplikasi, seperti kode, library, dependensi, dan sistem operasi ringan.

### 11.4.1.1 Kenapa Harus Docker?
1. **Portabilitas:** Aplikasi yang berjalan di Docker akan bekerja di mana saja selama Docker terinstall, tanpa harus memikirkan perbedaan sistem operasi.
2. **Isolasi Lingkungan:** Setiap aplikasi berjalan di dalam container terpisah, sehingga konflik antara versi library atau dependensi tidak terjadi.
3. **Efisiensi:** Container lebih ringan dibandingkan dengan Virtual Machine (VM), karena berbagi kernel sistem operasi dengan host.
4. **Otomatisasi:** Docker mempermudah pengaturan lingkungan pengembangan, testing, dan produksi dengan file konfigurasi seperti `Dockerfile` dan `docker-compose.yml`.

## 11.4.2 Cara Install Docker

### 11.4.2.1 Install Docker di Windows
- **Prasyarat:**
  - Windows 10/11 Pro, Enterprise, atau Education (mendukung WSL2).
  - Aktifkan Windows Subsystem for Linux 2 (WSL2).

- **Langkah-langkah:**
  1. Download Docker Desktop dari [situs resmi Docker](https://www.docker.com/products/docker-desktop/).
  2. Instal Docker Desktop.
  3. Selama instalasi, pilih opsi untuk mengaktifkan WSL2.
  4. Setelah instalasi selesai, buka Docker Desktop dan pastikan Docker berjalan.

### 11.4.2.2 Install Docker di Linux VM
- **Langkah-langkah:**
  1. Update paket:
     ```bash
     sudo apt update && sudo apt upgrade -y
     ```
  2. Install dependensi:
     ```bash
     sudo apt install -y apt-transport-https ca-certificates curl software-properties-common
     ```
  3. Tambahkan repository Docker:
     ```bash
     curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
     echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
     ```
  4. Install Docker:
     ```bash
     sudo apt update
     sudo apt install -y docker-ce docker-ce-cli containerd.io
     ```
  5. Tambahkan user ke grup Docker (opsional):
     ```bash
     sudo usermod -aG docker $USER
     ```
  6. Jalankan Docker:
     ```bash
     sudo systemctl start docker
     sudo systemctl enable docker
     ```

## 11.4.3 Apa itu Dockerfile dan docker-compose.yml?

### 11.4.3.1 Apa itu Dockerfile?
Dockerfile adalah file konfigurasi untuk membuat image Docker. File ini berisi instruksi step-by-step tentang bagaimana image Docker harus dibuat.

### 11.4.3.2 Apa itu docker-compose.yml?
`docker-compose.yml` adalah file konfigurasi yang digunakan untuk mendefinisikan dan menjalankan aplikasi multi-container. Dengan file ini, kita bisa mendefinisikan beberapa container sekaligus, seperti aplikasi utama dan database.

## 11.4.4 Struktur Project dengan Docker

Berikut adalah struktur project yang disarankan:

```
project-root/
├── app/                # Folder untuk source code aplikasi
│   ├── index.php       # Contoh file aplikasi PHP
│   └── ...
├── Dockerfile          # File konfigurasi Docker untuk aplikasi ini
├── docker-compose.yml  # File docker-compose untuk konfigurasi container
└── README.md           # Dokumentasi project
```

- **Dockerfile**: Diletakkan di root direktori project (`project-root/Dockerfile`).
- **docker-compose.yml**: Juga diletakkan di root direktori project (`project-root/docker-compose.yml`).
- **Source Code**: Dimasukkan ke dalam folder `app/`.

## 11.4.5 Contoh Dockerfile dan Docker-Compose

### 11.4.5.1 Dockerfile untuk PHP 5.6 (CodeIgniter 3)

**Dockerfile:**
```dockerfile
FROM php:5.6-apache

# Install dependensi
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    zip \
    unzip \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install gd mysqli

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Copy project ke dalam container
COPY ./app /var/www/html

# Set permission
RUN chown -R www-data:www-data /var/www/html
```

**docker-compose.yml:**
```yaml
version: '3.8'
services:
  app:
    build: .
    ports:
      - "8080:80"
    volumes:
      - ./app:/var/www/html
    networks:
      - app-network

  db:
    image: mysql:5.7
    restart: always
    environment:
      MYSQL_ROOT_PASSWORD: rootpassword
      MYSQL_DATABASE: codeigniter_db
      MYSQL_USER: ci_user
      MYSQL_PASSWORD: ci_password
    ports:
      - "3306:3306"
    networks:
      - app-network

networks:
  app-network:
```

### 11.4.5.2 Dockerfile untuk PHP 8 (CodeIgniter 3.13)

**Dockerfile:**
```dockerfile
FROM php:8.0-apache

# Install dependensi
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    zip \
    unzip \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd mysqli

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Copy project ke dalam container
COPY ./app /var/www/html

# Set permission
RUN chown -R www-data:www-data /var/www/html
```

**docker-compose.yml:**
```yaml
version: '3.8'
services:
  app:
    build: .
    ports:
      - "8090:80"
    volumes:
      - ./app:/var/www/html
    networks:
      - app-network

  db:
    image: mysql:8.0
    restart: always
    environment:
      MYSQL_ROOT_PASSWORD: rootpassword
      MYSQL_DATABASE: codeigniter_db
      MYSQL_USER: ci_user
      MYSQL_PASSWORD: ci_password
    ports:
      - "3307:3306"
    networks:
      - app-network

networks:
  app-network:
```

## 11.4.6 Cara Build dan Push Image ke Harbor

### 11.4.6.1 Build Image
1. Pastikan Anda berada di direktori root project.
2. Jalankan perintah berikut untuk membangun image Docker:
   ```bash
   docker build -t harbor.example.com/project/php56-codeigniter3:latest .
   ```

### 11.4.6.2 Push Image ke Harbor
1. Login ke registry Docker:
   ```bash
   docker login harbor.example.com
   ```
2. Push image ke registry:
   ```bash
   docker push harbor.example.com/project/php56-codeigniter3:latest
   ```

### 11.4.6.3 Tagging Image
- Untuk menandai image dengan versi tertentu:
  ```bash
  docker tag harbor.example.com/project/php56-codeigniter3:latest harbor.example.com/project/php56-codeigniter3:v1.0.0
  ```
- Push image dengan tag baru:
  ```bash
  docker push harbor.example.com/project/php56-codeigniter3:v1.0.0
  ```

## 11.4.7 Cara Menjalankan Docker di Windows dan Linux

### 11.4.7.1 Jalankan Docker Desktop di Windows atau Pastikan Docker Aktif di Linux

1. **Clone atau siapkan project:**
   - Letakkan `Dockerfile` dan `docker-compose.yml` di direktori root masing-masing project.

2. **Bangun dan jalankan container:**
   - Untuk PHP 5.6:
     ```bash
     docker-compose up -d
     ```
   - Untuk PHP 8:
     ```bash
     docker-compose -f docker-compose.yml up -d
     ```

3. **Akses aplikasi:**
   - PHP 5.6: [http://localhost:8080](http://localhost:8080)
   - PHP 8: [http://localhost:8090](http://localhost:8090)

4. **Cek log jika ada masalah:**
   ```bash
   docker logs <nama_container>
   ```

5. **Database dapat diakses pada port 3306 (PHP 5.6) dan 3307 (PHP 8).**
