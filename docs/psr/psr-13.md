# 6.10 PSR-13 Hypermedia Links

PSR-13 adalah standar PHP yang dikenal sebagai "Hypermedia Links". Standar ini didefinisikan oleh PHP-FIG (PHP Framework Interoperability Group) dan bertujuan untuk menyediakan antarmuka dan cara standar untuk menangani dan bekerja dengan hypermedia links dalam aplikasi PHP.

PSR-13 bertujuan untuk mendefinisikan antarmuka yang seragam untuk bekerja dengan hypermedia links, sehingga memudahkan interoperabilitas antara berbagai pustaka dan framework PHP. Standar ini membantu pengembang untuk mengelola link secara konsisten dan memungkinkan komponen yang berbeda untuk bekerja bersama dengan lancar.

## 6.10.1 Implementasi Kode

Contoh implementasi dan penggunaan PSR-13 pada framework Codeigniter 4:

```php
namespace App\Controllers;

use CodeIgniter\RESTful\ResourceController;
use App\Libraries\Link;
use App\Libraries\LinkProvider;

class UsersController extends ResourceController
{
    public function index()
    {
        // Contoh data pengguna
        $users = [
            ['id' => 1, 'name' => 'John Doe'],
            ['id' => 2, 'name' => 'Jane Doe'],
        ];

        // Membuat LinkProvider
        $linkProvider = new LinkProvider();
        
        // Menambahkan link ke pengguna pertama
        $linkProvider->addLink(new Link('self', '/users/1'));
        $linkProvider->addLink(new Link('friends', '/users/1/friends'));

        // Menambahkan link ke pengguna kedua
        $linkProvider->addLink(new Link('self', '/users/2'));
        $linkProvider->addLink(new Link('friends', '/users/2/friends'));

        // Menggabungkan data pengguna dengan link
        foreach ($users as &$user) {
            $user['links'] = iterator_to_array($linkProvider->getLinksByRel('self'));
        }

        return $this->respond($users);
    }
}
```

## 6.10.2 Output JSON

Response yang akan diterima oleh klien akan berupa JSON:

```jsx
[
    {
        "id": 1,
        "name": "John Doe",
        "links": [
            {
                "rel": "self",
                "href": "http://yourdomain.com/users/1"
            },
            {
                "rel": "friends",
                "href": "http://yourdomain.com/users/1/friends"
            }
        ]
    },
    {
        "id": 2,
        "name": "Jane Doe",
        "links": [
            {
                "rel": "self",
                "href": "http://yourdomain.com/users/2"
            },
            {
                "rel": "friends",
                "href": "http://yourdomain.com/users/2/friends"
            }
        ]
    }
]

```

## 6.10.3 Keuntungan Penggunaan

Mengapa PSR-13 Penting dalam konteks Ini :

1. Konsistensi 

    PSR-13 menyediakan cara yang konsisten untuk mendefinisikan dan mengakses link, membuat kode lebih mudah dipahami dan dirawat.

2. Interoperabilitas

    Dengan menggunakan standar PSR-13, berbagai pustaka dan komponen dapat bekerja bersama dengan lebih baik, meningkatkan kemampuan integrasi dan pengembangan modular.

3. Kemudahan Pengembangan

    Dengan antarmuka yang sudah didefinisikan dengan baik, pengembang dapat fokus pada logika bisnis daripada memikirkan detail implementasi pengelolaan link.