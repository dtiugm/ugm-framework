# 6.11 PSR-6 Caching Interface

PSR-6 adalah rekomendasi standar PHP yang berfokus pada interoperabilitas cache. Tujuan utama dari PSR-6 adalah menyediakan antarmuka cache standar untuk digunakan pada berbagai proyek PHP, memungkinkan pengembang untuk menggunakan implementasi cache yang berbeda dengan cara yang konsisten dan seragam.

## Komponen Utama PSR-6

1. CacheItemInterface
    
    Yang dimaksud adalah antarmuka yang mewakili satu item cache. Antarmuka ini menyediakan metode untuk mendapatkan dan menetapkan nilai, serta metadata lainnya yang terkait dengan item cache. Metode penting tersebut diantaranya: `get()`, `isHit()`, `set()`, dan `expiresAt()`.
    
2. CacheItemPoolInterface
    
    Antarmuka yang mewakili kumpulan item cache. Dalam hal ini bertanggung jawab untuk mengelola item cache, termasuk mendapatkan item dari cache, menyimpan item di cache, dan membersihkan cache. Metode penting yang dimaksud yaitu `getItem()`, `getItems()`, `hasItem()`, `clear()`, `deleteItem()`, `deleteItems()`, dan `save()`.
    
3. CacheException
    
    Antarmuka untuk pengecualian yang ditangani oleh PSR-6. Pengecualian ini memungkinkan penanganan kesalahan yang konsisten di seluruh implementasi cache.