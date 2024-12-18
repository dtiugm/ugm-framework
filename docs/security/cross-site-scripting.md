# 13.1.2 Cross-site Scripting

1. **Penjelasan singkat**
    
    XSS terjadi ketika penyerang menyuntikkan skrip berbahaya (biasanya JavaScript) ke dalam halaman web yang dilihat oleh pengguna lain. Ketika pengguna mengunjungi halaman yang terinfeksi, skrip akan dieksekusi di browser mereka
    
2. **Dampak**
    - Pencurian cookie dan sesi (mengambil alih akun pengguna).
    - Pengalihan ke situs web berbahaya.
    - Perubahan tampilan halaman web.
    - Pencurian informasi sensitif.
3. **Pencegahan**
    - **Input Validation:** Validasi semua *input* pengguna dengan ketat. Tolak *input* yang mencurigakan atau yang tidak sesuai dengan format yang diharapkan.
    - **Output Encoding/Escaping:** Gunakan *output encoding* atau *escaping* untuk mengubah karakter HTML khusus (seperti `<`, `>`, `&`, `"`, `'`) menjadi entitas HTML yang sesuai.
    - **Content Security Policy (CSP):** Implementasikan CSP untuk membatasi sumber dari mana browser diizinkan untuk memuat sumber daya, seperti skrip dan *style*.
    - **HTTPOnly Cookie Flag:** Setel *flag* `HttpOnly` pada *cookie* untuk mencegah JavaScript mengakses *cookie* tersebut.