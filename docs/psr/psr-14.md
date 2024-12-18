# 6.13 PSR-14 Event Dispatcher

PSR-14 adalah standar yang mengatur tentang Event Dispatcher atau sistem pemicu peristiwa pada PHP. Spesifikasi ini bertujuan untuk menyediakan standar interoperabilitas pada sistem pengelolaan dan pengiriman event sehingga library dan componen dapat digunakan secara berulang dalam aplikasi PHP.

## 6.13.1 Konsep Dasar

Adapun konsep dasar dari PSR-14 adalah sebagai berikut:

1. Event, dalam konteks PSR-14 merupakan objek yang merepresentasikan suatu kejadian yang terjadi dalam aplikasi. Event dapat berisi data yang relevan tentang kejadian tersebut.
2. Event Dispatcher adalah komponen yang bertanggung jawab untuk mengelola dan mengirimkan event. Hal tersebut memungkinkan pengembang untuk mendaftarkan listener (pendengar) yang akan merespon ketiga event tertentu apabila dipanggil.
3. Listener adalah fungsi atau objek yang mendengarkan event tertentu dan merespon ketika event tersebut terjadi. Listener dapat melakukan berbagai tindakan, seperti memperbarui status, mengirim notifikasi, atau menjalankan logika bisnis lainnya.

## 6.13.2 Komponen Utama

PSR-14 mendefinisikan beberapa komponen utama sebagai berikut:

1. Event Interface
    
    PSR-14 mendefinisikan antarmuka untuk event. Setiap event harus mengimplementasikan antarmuka ini.
    
    ```php
    namespace Psr\EventDispatcher;
    
    interface EventInterface
    {
        // Metode yang diperlukan untuk event
    }
    ```
    
2. Event Dispatcher Interface
    
    Antarmuka ini mendefinisikan method untuk mengelola dan mengirimkan event.
    
    ```php
    namespace Psr\EventDispatcher;
    
    interface EventDispatcherInterface
    {
        public function dispatch(EventInterface $event): EventInterface;
    }
    
    ```
    
3. Listener merupakan fungsi atau objek yang merespons event. Listener dapat diimplementasikan sebagai class atau function/method yang sesuai dengan kebutuhan aplikasi.
4. Event merupakan object yang dipicu dan dikirimkan melalui event dispatcher. Sebuah event biasanya berisi informasi tentang peristiwa atau kondisi yang terjadi di dalam aplikasi, bisa dalam bentuk sederhana maupun kompleks.
5. Event Subscriber (optional)  merupakan konsep tambahan yang memungkinkan sebuah objek untuk "subscribe/berlangganan" ke berbagai jenis event dan mendengarkan lebih dari satu event tanpa memerlukan penambahan listener satu per satu.

Berikut adalah contoh sederhana PSR-14:

```php
use Psr\EventDispatcher\EventDispatcherInterface;
use Psr\EventDispatcher\EventInterface;

class UserRegisteredEvent implements EventInterface
{
    private $user;

    public function __construct($user)
    {
        $this->user = $user;
    }

    public function getUser ()
    {
        return $this->user;
    }
}

class UserRegisteredListener
{
    public function handle(UserRegisteredEvent $event)
    {
        // Logika untuk menangani event pengguna terdaftar
        echo "User  registered: " . $event->getUser ();
    }
}

class EventDispatcher implements EventDispatcherInterface
{
    private $listeners = [];

    public function addListener(string $eventName, callable $listener)
    {
        $this->listeners[$eventName][] = $listener;
    }

    public function dispatch(EventInterface $event): EventInterface
    {
        $eventName = get_class($event);
        if (isset($this->listeners[$eventName])) {
            foreach ($this->listeners[$eventName] as $listener) {
                $listener($event);
            }
        }
        return $event;
    }
}

// Penggunaan
$dispatcher = new EventDispatcher();
$dispatcher->addListener(UserRegisteredEvent::class, [new UserRegisteredListener(), 'handle']);

$event = new UserRegisteredEvent('John Doe');
$dispatcher->dispatch($event);
```