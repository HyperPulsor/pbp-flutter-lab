# Tugas 7 Elemen Dasar Flutter
Pemrograman Berbasis Platform (CSGE602022) - diselenggarakan oleh Fakultas Ilmu Komputer Universitas Indonesia, Semester Ganjil 2022/2023

Rakan Fasya Athhar Rayyan - 2106750950

***1. Jelaskan apa yang dimaksud dengan stateless widget dan stateful widget dan jelaskan perbedaan dari keduanya!***

Stateless Widget -> dapat diartikan sebagai suatu widget yang tidak terpengaruh oleh *state*. Tipe widget ini berfungsi hanya untuk menampilkan sesuatu secara statis dan tidak melakukan mengganti data apabila terdapat perubahan sehingga apabila terdapat perubahan pada *state*, variabel, ataupun data yang terjadi secara *realtime* maka tidak akan merubah Stateless Widget.

Stateful Widget -> dapat diartikan sebagai suatu widget yang terpengaruh oleh *state*. Tipe widget ini berfungsi hanya untuk menampilkan suatu data yang terus berganti secara *realtime* sehingga apabila terdapat perubahan pada *state*, variabel, ataupun data yang terjadi secara *realtime* maka akan merubah Stateful Widget.

***2. Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya.***

- **Text**, fungsinya untuk menampilkan teks pada aplikasi Flutter. Pada tugas ini, berfungsi untuk tulisan "GANJIL" dan "GENAP".
- **Row**, fungsinya untuk mendefinisikan layout secara horizontal untuk widget-widget lain. Pada tugas ini, berfungsi untuk menempatkan *button* *increment* dan *decrement* pada satu *row* yang sama.
- **SizedBox**, fungsinya untuk memberikan kotak kosong sebelum button *decrement*.
- **Expanded**, fungsinya untuk membuat container suatu widget memenuhi satu *row* penuh walaupun ukuran widget tidak memenuhi *row*. Pada tugas ini, berfungsi untuk memberikan container untuk button *increment* dan *decrement*.
- **Align**, fungsinya untuk menempatkan widget pada posisinya sesuai alignment. Pada tugas ini, berfungsi untuk menempatkan button *increment* dan *decrement*.
- **FloatingActionButton**, fungsinya untuk membuat suatu button yang bisa ditekan atau *floating button*.Pada tugas ini, berfungsi untuk membuat button *increment* dan button *decrement*.

***3. Apa fungsi dari `setState()`? Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut.***

`setState()` berfungsi untuk memberi tahu Flutter bahwa objek-objek pada state sedang mengalami perubahan. Setelah diberi tahu, Flutter akan melakukan `build` kembali dan menampilkan aplikasi setelah dilakukan perubahan pada state. Variabel `_counter` berubah dan memberi dampak pada `setState()` karena berubah ditambah dan dikurang.

***4. Jelaskan perbedaan antara const dengan final.***

`const` merupakan *modifier* yang menetapkan bahwa value tersebut sifatnya sudah tetap dan tidak bisa diubah (konstan). Variabel dengan nilai ini harus diidentifikasi saat *compile time* sehingga tidak bisa diubah lagi.

`final` merupakan *modifier* yang menetapkan bahwa variabel tersebut sifatnya sudah tetap dan tidak bisa diubah, tetapi `final` diidentifikasi tidak harus saat *compile time* sehingga nilai dari variabel masih dapat berubah.

***5. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas.***

1. Melakukan command `flutter create counter_7`
2. Menetapkan kondisional yang diperlukan untuk menghilangkan button *decrement* dan menetapkan teks yang sesuai tergantun nilai counternya.
```
if (_counter % 2 == 0)
    const Text(
    'GENAP',
    style: TextStyle(color: Colors.red),
    )
else
    const Text(
    'GANJIL',
    style: TextStyle(color: Colors.blue),
    ),
``` 
3. Membuat method untuk implementasi button mengurangi counter
```
 void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }
```
4. Mengubah `floatingActionButton` dengan :
- Menambahkan Row untuk menempatkan button *increment* dan *decrement* pada satu baris yang sama
- Row memiliki child `SizedBox` untuk kotak kosong sebelum button *decrement*, `Expanded` untuk setiap button mengisi space yang kosong pada satu baris yang sama.
- `Expanded` memiliki child `Align` untuk menempatkan tiap button sesuai tempatnya masing-masing (kiri bawah untuk tombol *decrement* dan kanan bawah untuk tombol *increment*), `FloatingActionButton` untuk membuat button dari tiap fungsinya masing-masing dimana fungsi ditempatkan pada parameter `onPressed`, `tooltip` untuk teks muncul saat *hover* pada tiap button, dan setiap button memiliki child berupa `Icon` nya masing-masing yang sesuai.
```
floatingActionButton: Row(
        children: [
          const SizedBox(
            width: 32,
          ),
          if (_counter > 0)
            Expanded(
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: FloatingActionButton(
                    onPressed: _decrementCounter,
                    tooltip: 'Decrement',
                    child: const Icon(Icons.remove),
              ),
            )),
          Expanded(
              child: Align(
                alignment: Alignment.bottomRight,
                child: FloatingActionButton(
                  onPressed: _incrementCounter,
                  tooltip: 'Increment',
                  child: const Icon(Icons.add),
            ),
          )),
        ],
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
```

# Tugas 8 Flutter Form
Pemrograman Berbasis Platform (CSGE602022) - diselenggarakan oleh Fakultas Ilmu Komputer Universitas Indonesia, Semester Ganjil 2022/2023

Rakan Fasya Athhar Rayyan - 2106750950

***1. Jelaskan perbedaan `Navigator.push` dan `Navigator.pushReplacement` !***

Penggunaan Navigator seperti stack. Setiap kali `Navigator.push`dipanggil, maka akan menimpa halaman sebelumnya dengan halaman baru. Namun, `Navigator.pushReplacement` akan mengganti halaman lama dengan halaman baru. Jika menggunakan `Navigator.push`, bisa menggunakan tombol back karena terdapat halaman sebelumnya dan halaman baru yang bisa diakses kembali

***2.  Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya.***

- Drawer, Widget untuk navigasi yang membuat suatu layar tambahan di bagian kiri app dan bisa dimunculkan serta disembunyikan

- Form, Widget untuk inisialisasi widget apa saja yang dianggap masuk atau fields dalam form oleh Flutter sehingga bisa menerima input

- Card, Widget untuk menampilkan data-data budget dalam suatu kotak

- ListTile, Widget untuk membuat tulisan-tulisan lain dalam suatu drawer

- TextFormField, Widget untuk menerima input berupa text dari user

- DropdownButtonFormField, Wigdet untuk memungkinkan user supaya bisa memilih item dari suatu dropdown. Isi dari dropdown dibuat dengan suatu list

- TextButton, Widget untuk membuat suatu tombol yang dapat diberikan teks. Saat tombol diklik, akan mensubmit input fields form yang sudah dimasukkan user

***3.  Sebutkan jenis-jenis event yang ada pada Flutter (contoh: onPressed).***

- `onChanged`, event yang muncul saat widget mengalami perubahan
- `onPressed`, event yang muncul saat button dipencet oleh user
- `onSaved`, event yang muncul saat suatu form telah disimpan
- `onTap`, event yang muncul saat widget dipencet oleh user

***4.   Jelaskan bagaimana cara kerja Navigator dalam "mengganti" halaman dari aplikasi Flutter.***

Cara kerja Navigator mirip dengan penggunaan stack. Halaman yang pertama kali dilihat oleh user adalah halaman yang berada di top of stack. Jika kita melakukan `push`, maka halaman yang baru akan jadi top of stack. Kita dapat menggunakan `pop` untuk kembali ke halaman yang lama. Penggunaan `pushReplacement` hanya akan merubah halaman lama yang merupakan top of stack dan diganti dengan halaman baru yang sekarang menjadi top of stack.

***5.  Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas.***

1. Menambahkan code untuk Drawer dan menambahkan menu (counter_7, Tambah Budget, Data Budget) pada Drawer serta memberikan navigasi untuk menu-menunya dengan mengganti `Navigator.pushReplacement` menjadi masing-masing page yang sesuai

2. Membuat form pada halaman baru `form.dart` dengan `MyFormPage`serta input-input yang dibutuhkan dalam form tersebut, validasi untuk input-inputnya, dan button yang diubah `onPressed`nya supaya bisa mensubmit form. Setelah form disubmit, maka akan membuat suatu objek `Budget` baru. Data-data input tersebut akan disimpan dalam suatu list yang berisi tipe data `Budget` supaya bisa diakses di halaman Data Budget pada `MyShowPage`.

3. Membuat halaman baru untuk menampilkan data budget `show.dart` dengan `MyShowPage`. Halaman ini akan menggunakan widget `Card` untuk tampilan data-data budget tersebut. `Card` akan diisikan dengan widget `Text` yang berisi data-data dari objek budget yang sudah dibuat karena sifatnya `static`. List diakses dengan menambahkan fungsi buatan dengan parameter `BuildContext` `context` dan `int` `index`. Dalam fungsi tersebut, list diakses dengan indexing menggunakan `index` dari parameter. Terdapat parameter `itemCount` supaya Flutter mengetahui panjang dari list tersebut supaya tidak error.



