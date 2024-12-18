# 14.1 PEP 8: Pedoman Gaya Penulisan Kode Python

PEP 8 adalah pedoman gaya penulisan kode Python yang diterima secara luas oleh komunitas Python  untuk membuat kode Python yang konsisten, mudah dibaca, dan mudah dipelihara. Beberapa prinsip utama dalam PEP 8 termasuk indentasi, penamaan, komentar, dan pemformatan kode. 

Selain PEP 8, saat membangun API dengan FastAPI, ada beberapa praktik terbaik (best practices) yang perlu dipahami. Dalam bab ini, dibahas pedoman PEP 8 untuk penulisan kode Python secara umum dan penerapannya dalam pengembangan API menggunakan FastAPI.

## 14.1.1 Indentasi dan Pemformatan Baris

Indentasi adalah aspek penting dalam Python karena digunakan untuk menentukan blok kode. PEP 8 menyarankan penggunaan **4 spasi** untuk indentasi, bukan tab.

**Contoh:**

```python
def greet(name):
    if name:
        print(f"Hello, {name}")
    else:
        print("Hello, world!")

```

## 14.1.2 Panjang Baris

Panjang baris kode tidak boleh melebihi **79 karakter**. Untuk kode yang lebih panjang, pisahkan menjadi beberapa baris.

**Contoh:**

```python
def greet_long_name(name, surname, age, profession, city, country):
    print(f"Hello, {name} {surname}, Age: {age}, Profession: {profession}, "
          f"City: {city}, Country: {country}")

```

## 14.1.3 Penamaan Variabel dan Fungsi

Untuk variabel dan nama fungsi, gunakan **snake_case** (huruf kecil dan dipisahkan dengan garis bawah). Untuk kelas, gunakan **CamelCase**.

**Contoh:**

```python
# Variabel dan fungsi menggunakan snake_case
first_name = "John"
last_name = "Doe"
def get_full_name(first_name, last_name):
    return f"{first_name} {last_name}"

# Kelas menggunakan CamelCase
class Person:
    def __init__(self, first_name, last_name):
        self.first_name = first_name
        self.last_name = last_name

```

## 14.1.4 Komentar dan Docstring

Komentar digunakan untuk menjelaskan kode yang rumit atau tidak langsung terlihat maksudnya. Semua fungsi dan kelas harus memiliki **docstring** yang menjelaskan tujuannya.

**Contoh komentar:**

```python
# Menghitung usia berdasarkan tahun kelahiran
def calculate_age(birth_year):
    current_year = 2024
    age = current_year - birth_year
    return age

```

Contoh docstring

```python
def greet(name):
    """
    Menyapa pengguna dengan nama yang diberikan.
    
    Parameter:
    name (str): Nama pengguna yang akan disapa
    
    Mengembalikan:
    str: Pesan sapaan
    """
    return f"Hello, {name}"

```