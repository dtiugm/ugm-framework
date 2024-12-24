# 13.1.2 Cross-site Scripting

XSS terjadi ketika penyerang menyuntikkan skrip berbahaya (biasanya JavaScript) ke dalam halaman web yang dilihat oleh pengguna lain. Ketika pengguna mengunjungi halaman yang terinfeksi, skrip akan dieksekusi di browser mereka

**Hal diatas berdampak pada:**

1. Pencurian cookie dan sesi (mengambil alih akun pengguna).
2. Pengalihan ke situs web berbahaya.
3. Perubahan tampilan halaman web.
4. Pencurian informasi sensitif.

**Pencegahan yaitu dengan hal-hal sebagai berikut:**

1. **Input Validation:** Validasi semua *input* pengguna dengan ketat. Tolak *input* yang mencurigakan atau yang tidak sesuai dengan format yang diharapkan.
2. **Output Encoding/Escaping:** Gunakan *output encoding* atau *escaping* untuk mengubah karakter HTML khusus (seperti `<`, `>`, `&`, `"`, `'`) menjadi entitas HTML yang sesuai. 
3. **Content Security Policy (CSP):** Implementasikan CSP untuk membatasi sumber dari mana browser diizinkan untuk memuat sumber daya, seperti skrip dan *style*.
4. **HTTPOnly Cookie Flag:** Setel *flag* `HttpOnly` pada *cookie* untuk mencegah JavaScript mengakses *cookie* tersebut.
