# 🎮 Mini Project 1 PAB
# 💎 Aplikasi Manajemen Top Up Game

Aplikasi mobile berbasis Flutter untuk mengelola layanan top up game secara digital.
Aplikasi ini memungkinkan admin untuk:

- Melihat daftar game

- Melakukan transaksi top up

- Mengelola stok diamond/koin

- Melihat riwayat transaksi


# 📱 Deskripsi Aplikasi

Game Top Up Management App adalah aplikasi manajemen top up game sederhana yang dirancang untuk membantu pengelolaan stok dan transaksi top up secara real-time.

Aplikasi memiliki 3 halaman utama:

🏠 Home Page → Menampilkan daftar game yang tersedia dan untuk membuat transaksi top up

📦 Inventory Page → Mengelola stok top up yang tersedia di setiap game

📋 Transaction Page → Melihat riwayat transaksi top up

# Struktur Folder

```
lib/
├── main.dart
├── models/
│   ├── game.dart
│   └── transaksi.dart
├── pages/
│   ├── main_page.dart
│   ├── home_page.dart
│   ├── inventory_page.dart
│   ├── transaction_page.dart
│   └── topup_page.dart
└── widgets/
    ├── custom_appbar.dart
    └── custom_textfield.dart
```

# Fitur Aplikasi

## 1. Daftar Game

- Menampilkan seluruh game dalam bentuk daftar

- Setiap kartu game menampilkan logo, nama game, dan jumlah stok diamond/koin

- Tombol Top Up tersedia langsung pada setiap game untuk membuat (CREATE) transaksi

## 2. Top Up Game

- Halaman form khusus untuk menambahkan informasi transaksi top up

- Input field untuk ID Player, jumlah top up, dan email

- Stok otomatis berkurang setelah transaksi berhasil

- Terdapat notifikasi apakah transaksi berhasil atau gagal

## 3. Manajemen Inventory 

- Menampilkan daftar game beserta stok saat ini

- Tombol "+" tersedia pada setiap game untuk mengedit (UPDATE) jumlah stok

- Dialog input jumlah stok

- Stok langsung diperbarui secara real-time setelah ditambahkan

## 4. Riwayat Transaksi

- Menampilkan daftar transaksi yang telah dilakukan (READ)

- Data transaksi langsung muncul setelah proses top up berhasil

- Dapat interaksi dengan menahan lama pada salah satu riwayat transaksi untuk dihapus (DELETE)

## 5. Navigasi

- Halaman utama menampilkan daftar game (Home Page)

- Halaman Top Up diakses melalui tombol pada gambar game

- Halaman Inventory digunakan untuk mengelola stok

- Halaman Transaksi digunakan untuk melihat riwayat transaksi

- Navigasi antar halaman menggunakan Navigator

# Widget yang digunakan


## 1. Widget Layout dan Navigation
| Widget             | Fungsi                              |
| ------------------ | ----------------------------------- |
| `MaterialApp`      | Root aplikasi                       |
| `Scaffold`         | Struktur dasar halaman              |
| `AppBar`           | Header halaman                      |
| `CustomAppBar`     | AppBar kustom                       |
| `Navigator.push`   | Navigasi antar halaman              |
| `ListView.builder` | Menampilkan daftar game & transaksi |
| `Row`              | Layout horizontal                   |
| `Column`           | Layout vertikal                     |
| `Expanded`         | Layout fleksibel dalam `Row`        |
| `SizedBox`         | Spacing antar widget                |
| `Padding`          | Memberikan jarak                    |
| `Container`        | Styling & dekorasi                  |
| `ClipRRect`        | Membuat sudut rounded pada gambar   |

## 2. Widget Input
| Widget                  | Fungsi                         |
| ----------------------- | ------------------------------ |
| `TextField`             | Input ID Player, jumlah, email |
| `TextEditingController` | Mengambil nilai input          |
| `AlertDialog`           | Dialog tambah/edit stok        |
| `SnackBar`              | Notifikasi berhasil/gagal      |
| `ElevatedButton`        | Tombol aksi utama              |
| `TextButton`            | Tombol aksi sekunder           |
| `GestureDetector`       | Deteksi klik & animasi custom  |

## 3. Widget Animasi
| Widget              | Fungsi                            |
| ------------------- | --------------------------------- |
| `AnimatedContainer` | Animasi hover & press             |
| `MouseRegion`       | Deteksi hover (desktop/web)       |
| `BoxDecoration`     | Border radius & shadow            |
| `BoxShadow`         | Efek bayangan                     |
| `Icon`              | Ikon UI                           |
| `Image.asset`       | Logo game                         |
| `Matrix4.scale`     | Efek tombol mengecil saat ditekan |

# Contoh Penggunaan Aplikasi

## 1. Tampilan Page Awal

<img width="1919" height="909" alt="image" src="https://github.com/user-attachments/assets/279481ce-44a6-46a9-815d-2fbac719c8c7" />

## 2. Tampilan Page Inventory

<img width="1919" height="908" alt="image" src="https://github.com/user-attachments/assets/856ddf9f-a386-47cd-b9b3-f600f00f1f90" />

## 3. Tampilan Page Riwayat

<img width="1919" height="907" alt="image" src="https://github.com/user-attachments/assets/3ff6f1a9-74e3-49d9-98b0-82e3f6d529bc" />

## 4. Tampilan Form Top Up 

<img width="1919" height="908" alt="image" src="https://github.com/user-attachments/assets/4b89d602-726f-44bc-b6ae-86b599bb20c1" />

## 5. Tampilan Edit Stok di Inventory

<img width="1919" height="910" alt="image" src="https://github.com/user-attachments/assets/ab963fb4-b87b-41c8-a97a-9bd32fccf7c1" />

## 6. Tampilan Ketika Menahan Lama Salah Satu Riwayat Transaksi

<img width="1919" height="913" alt="image" src="https://github.com/user-attachments/assets/ff978e47-f7fc-4db0-aa5d-280bf7837244" />

## 7. Tampilan Konfirmasi Apabila Ingin Menghapus Riwayat Transaksi

<img width="1919" height="903" alt="image" src="https://github.com/user-attachments/assets/eb97988f-f8e0-4f37-be17-1d4d7b632772" />




