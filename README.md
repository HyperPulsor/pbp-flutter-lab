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


