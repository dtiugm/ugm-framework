DevOps adalah seperangkat praktik, budaya, dan filosofi yang mengotomatiskan dan mengintegrasikan proses antara tim pengembangan perangkat lunak (Development) dengan tim operasi TI (Operations).

Tujuannya adalah untuk mempersingkat siklus pengembangan perangkat lunak dan menyediakan *continuous delivery* dengan kualitas tinggi, sambil meningkatkan kolaborasi dan komunikasi antar tim. 

DevOps bukan hanya tentang penggunaan alat, melainkan juga tentang perubahan budaya dan pola pikir. Implementasi DevOps yang sukses membutuhkan komitmen dari semua tim yang terlibat dan adaptasi terhadap praktik-praktik baru.

## **11.1 Prinsip-Prinsip Utama DevOps**

- **Kolaborasi dan Komunikasi:** DevOps menekankan pada kolaborasi yang erat antara tim pengembang, operasi, keamanan, dan tim lainnya yang terlibat dalam siklus hidup perangkat lunak. Komunikasi yang efektif dan transparan sangat penting untuk menghindari silo dan miskomunikasi.
- **Otomatisasi:** Otomatisasi adalah inti dari DevOps. Ini mencakup otomatisasi *build*, pengujian, *deployment*, dan *monitoring*. Otomatisasi mengurangi kesalahan manusia, mempercepat proses, dan memungkinkan *feedback* yang lebih cepat.
- **Continuous Integration (CI):** CI adalah praktik pengintegrasian kode secara teratur pada repositori bersama. Setiap integrasi diverifikasi dengan *automated build* dan pengujian.
- **Continuous Delivery (CD):** CD memperluas CI dengan mengotomatiskan proses *release* dan *deployment* sehingga perangkat lunak dapat dirilis pada lingkungan produksi setiap waktu.
- **Monitoring dan Logging:** Pemantauan dan pencatatan yang komprehensif sangat penting untuk memahami kinerja aplikasi dan infrastruktur, mendeteksi masalah dengan cepat, dan memberikan *feedback* untuk perbaikan.
- **Feedback Loop (Umpan Balik):** DevOps mendorong *feedback loop* yang cepat antara tim pengembang, operasi, serta pengguna. Ini memungkinkan perbaikan dan peningkatan berkelanjutan.

## **11.2 Praktik-Praktik Utama DevOps**

- **Continuous Integration (CI)**
    - Pengembang melakukan *commit* kode secara teratur.
    - Sistem CI otomatis membangun aplikasi dan menjalankan pengujian, baik itu uji fungsi maupun uji keamanan.
    - *Feedback* cepat diberikan kepada pengembang jika ada kesalahan.
- **Continuous Delivery (CD)**
    - Otomatisasi *deployment* ke berbagai lingkungan (pengembangan, pengujian, *staging*, produksi).
    - Penggunaan *pipeline* CD untuk mengelola alur *release*.
    - Strategi *deployment* seperti *blue/green deployment* atau *canary releases*.
- **Monitoring dan Logging**
    - Penggunaan alat *monitoring* seperti Prometheus, Grafana, atau Kibana untuk memantau kinerja aplikasi dan infrastruktur.
    - Penggunaan *logging* terpusat untuk menganalisis *log* dan mendeteksi masalah.
- **Collaboration and Communication Tools**: Penggunaan *tools* seperti Slack atau Microsoft Teams untuk memfasilitasi kolaborasi dan komunikasi antar tim.

## **11.3 Alur Kerja CI/CD**

1. **Pengembang Melakukan *Commit* Kode ke GitLab**: Pengembang melakukan perubahan kode dan melakukan *commit* serta *push* ke *branch* yang relevan di GitLab (misalnya, *branch develop* untuk *development* atau *branch main/master* untuk *production*).
2. **GitLab CI Menjalankan *Pipeline* CI**
    - Setiap *push* ke GitLab akan memicu *pipeline* CI yang didefinisikan dalam berkas `.gitlab-ci.yml` di *root* repositori.
    - Contoh `.gitlab-ci.yml` sederhana:
        
        ```yaml
        stages:
          - build
          - test
          - call_portainer
          
        build_image_develop:
          stage: build
          image:
            name: gcr.io/kaniko-project/executor:v1.23.2-debug
            entrypoint: [""]
          tags:
            - gitdev-runner
          before_script:
            - echo "{\"auths\":{\"${HARBOR_HOST}\":{\"auth\":\"$(printf "%s:%s" "${HARBOR_USERNAME}" "${HARBOR_PASSWORD}" | base64 | tr -d '\n')\"}}}" > /kaniko/.docker/config.json
          script:
            - /kaniko/executor
              --context "${CI_PROJECT_DIR}"
              --dockerfile "${CI_PROJECT_DIR}/Dockerfile"
              --destination "${HARBOR_HOST}/${HARBOR_PROJECT}/${CI_PROJECT_NAME}:${CI_COMMIT_TAG}"
          rules:
             - if : '$CI_COMMIT_BRANCH == "develop"'
               changes:
                 - Dockerfile
                 - CHANGELOG.md
                 
        test-job:
          stage: test
          image: $HARBOR_HOST}/$HARBOR_PROJECT/$CI_PROJECT_NAME:$CI_COMMIT_TAG
          script:
            - # perintah pengujian, contoh: pytest
                 
        call_portainer_develop:
          image: hub.ugm.id/proxy/alpine:latest
          stage: call_portainer
          tags:
            - gitdev-runner
          rules:
             - if : '$CI_COMMIT_BRANCH == "develop"'
               changes: 
                 - docker-compose.*
                 - Dockerfile
                 - CHANGELOG.md
          script:
            - apk add --no-cache curl
            - curl -X POST $PORTAINER_WEBHOOK_DEVELOP
        ```
        
        Penjelasan konfigurasi:
        
        - `stages` : Mendefinisikan tahap-tahap *pipeline* (build, test, deploy).
        - `image` : Mendefinisikan *image* Docker yang akan digunakan untuk *job*.
        - `tags` :  Dalam contoh ini, digunakan untuk memilih gitlab runner
        - `before_script`: Perintah yang dijalankan sebelum setiap *job*. Contoh di atas melakukan *login* ke *registry* Docker.
        - `rules` : Memberikan kondisi yang harus terpenuhi untuk job dijalankan
        - `script` : Perintah yang akan dijalankan dalam *job*.
      
3. **Membangun Aplikasi dan Membuat *Image* Docker**
    - *Job build* menggunakan *image* `gcr.io/kaniko-project/executor` dan menjalankan perintah build untuk membangun *image* Docker berdasarkan `Dockerfile` di repositori.
    - *Image* yang dibangun diberi *tag* dengan `${HARBOR_HOST}/${HARBOR_PROJECT}/${CI_PROJECT_NAME}:${CI_COMMIT_TAG}` agar mudah diidentifikasi dan di kelola, dan di *push* ke Harbor Registry.
4. **Menjalankan Pengujian**: *Job test* menggunakan *image* yang baru dibangun dan menjalankan pengujian yang sesuai (misalnya, *unit test*, *integration test*).
5. **Upload *Image* ke Harbor Registry**: *Job build* melakukan *push* *image* Docker yang berhasil dibangun ke Harbor Registry. Kredensial registri disimpan sebagai variabel CI/CD di GitLab atau dengan Harbor integration.
6. **GitLab CI Mengirim *Webhook* ke Portainer**
    - *Job deploy* akan mengirim *webhook* ke Portainer setelah tahap *build dan test* selesai.
7. **Portainer Melakukan *Deployment Image* Docker Baru ke *Environment* yang Dituju**
    - Portainer dikonfigurasi untuk menerima *webhook* dan menjalankan *deployment*.
    - Perlu dibuatkan *stack* atau *container* terlebih dahulu di Portainer. Konfigurasi *webhook* di Portainer akan merujuk ke *stack* atau *container* ini dan memperbarui *image* yang digunakan.
    - Pastikan konfigurasi network dan mapping port sudah sesuai agar aplikasi dapat diakses.
8. **Memantau Aplikasi dan Infrastruktur**: Menggunakan Grafana + Loki ataupun ELK Stack untuk menampilkan data *metric* penggunaan resouce infrastruktur, juga untuk menampilkan log aplikasi yang telah ter-*deploy*
9. **Umpan Balik dari *Monitoring* dan *Logging* Digunakan untuk Perbaikan dan Peningkatan:** Tim pengembangan dan operasi menggunakan data dari *monitoring* dan *logging* untuk mengidentifikasi masalah, melakukan perbaikan, dan meningkatkan kinerja aplikasi.