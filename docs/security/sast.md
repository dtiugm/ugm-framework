# 13.2.1 Static Application Security Testing (SAST)

SAST menganalisis kode sumber aplikasi secara statis, tanpa menjalankan aplikasi tersebut. Fokusnya adalah pada identifikasi potensi kerentanan berdasarkan pola kode yang mencurigakan atau penggunaan fungsi yang tidak aman. SAST sering disebut sebagai *white-box testing* karena membutuhkan akses ke kode sumber.

**Kelebihan SAST antara lain:**

1. **Deteksi Dini:** Dapat mendeteksi kerentanan pada tahap awal siklus pengembangan perangkat lunak (SDLC), bahkan sebelum aplikasi di-*compile* atau di-*deploy*.
2. **Lokasi Spesifik:** Memberikan informasi detail mengenai lokasi kerentanan dalam kode sumber, memudahkan pengembang untuk memperbaikinya.
3. **Otomatisasi:** Proses pemindaian dapat diotomatisasi dan diintegrasikan ke dalam *pipeline CI/CD*.
4. **Efisiensi:** Relatif cepat dalam melakukan pemindaian dan dapat menangani basis kode yang besar.

**Adapun untuk kekurangan SAST antara lain:**

1. ***False Positive*:** Cenderung menghasilkan *false positive* (laporan kerentanan yang sebenarnya bukan kerentanan), sehingga membutuhkan verifikasi manual.
2. **Keterbatasan Konteks:** Kurang efektif dalam mendeteksi kerentanan yang terkait dengan konfigurasi atau interaksi *runtime* aplikasi.
3. **Ketergantungan pada Kode Sumber:** Membutuhkan akses ke kode sumber, sehingga tidak dapat digunakan untuk menguji aplikasi pihak ketiga atau aplikasi yang kode sumbernya tidak tersedia.

**Contoh tools SAST:**

- **Semgrep**

```bash
bash$ semgrep --config 'p/fastapi' .

┌──── ○○○ ────┐
│ Semgrep CLI │
└─────────────┘

                                                                                                                        
Scanning 60 files (only git-tracked) with 60 Code rules:
            
  CODE RULES
  Scanning 51 files with 60 python rules.
                    
  SUPPLY CHAIN RULES
                                                       
  💎 Run `semgrep ci` to find dependency
     vulnerabilities and advanced cross-file findings. 
                                                       
          
  PROGRESS
   
  ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 100% 0:00:14                                                                                                                        
                
                
┌──────────────┐
│ Scan Summary │
└──────────────┘
Some files were skipped or only partially analyzed.
  Scan was limited to files tracked by git.

Ran 60 rules on 51 files: 0 findings.
```

- **Snyk**

```bash
bash$ snyk code test .

Testing . ...

 ✗ [Low] Use of Password Hash With Insufficient Computational Effort 
   Path: app/api/v1/endpoints/users.py, line 47 
   Info: hashlib.md5 is insecure. Consider changing it to a secure hashing algorithm.

 ✗ [Low] Use of Password Hash With Insufficient Computational Effort 
   Path: app/api/v1/endpoints/users.py, line 121 
   Info: hashlib.md5 is insecure. Consider changing it to a secure hashing algorithm.

 ✗ [Low] Use of Password Hash With Insufficient Computational Effort 
   Path: app/api/v2/endpoints/users.py, line 47 
   Info: hashlib.md5 is insecure. Consider changing it to a secure hashing algorithm.

 ✗ [Low] Use of Password Hash With Insufficient Computational Effort 
   Path: app/api/v2/endpoints/users.py, line 121 
   Info: hashlib.md5 is insecure. Consider changing it to a secure hashing algorithm.

 ✗ [Low] Use of Password Hash With Insufficient Computational Effort 
   Path: app/api/v2/endpoints/banner.py, line 48 
   Info: hashlib.md5 is insecure. Consider changing it to a secure hashing algorithm.

 ✗ [Low] Use of Password Hash With Insufficient Computational Effort 
   Path: app/api/v1/endpoints/banner.py, line 48 
   Info: hashlib.md5 is insecure. Consider changing it to a secure hashing algorithm.

✔ Test completed

Organization:      UGM
Test type:         Static code analysis
Project path:      .

Summary:

  6 Code issues found
  6 [Low]
```