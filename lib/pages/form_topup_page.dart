import 'package:flutter/material.dart';
import '../models/game.dart';
import '../models/transaksi.dart';

class FormTopUpPage extends StatefulWidget {
  final Game game;
  final Function(Transaksi) onSubmit;

  const FormTopUpPage({
    super.key,
    required this.game,
    required this.onSubmit,
  });

  @override
  State<FormTopUpPage> createState() => _FormTopUpPageState();
}

class _FormTopUpPageState extends State<FormTopUpPage> {
  final idController = TextEditingController();
  final jumlahController = TextEditingController();
  final emailController = TextEditingController();

  void kirim() {
    String id = idController.text.trim();
    String jumlahText = jumlahController.text.trim();
    String email = emailController.text.trim();

    // Logika Field Kosong
    if (id.isEmpty || jumlahText.isEmpty || email.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Semua field wajib diisi!"),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    // Logika kolom Jumlah harus angka
    int? jumlah = int.tryParse(jumlahText);
    if (jumlah == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Jumlah harus berupa angka!"),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    // Logika Jumlah harus lebih dari 0
    if (jumlah <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Jumlah harus lebih dari 0!"),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    // Logika apabila jumlah melebihi stok
    if (jumlah > widget.game.stok) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Stok tidak cukup!"),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    widget.game.stok -= jumlah;

    widget.onSubmit(
      Transaksi(
        namaGame: widget.game.nama,
        idPlayer: id,
        jumlah: jumlah,
        email: email,
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Top Up Berhasil!"),
        backgroundColor: Colors.green,
      ),
    );

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Top Up ${widget.game.nama}"),
        backgroundColor: const Color(0xFF145A32),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: idController,
              decoration: const InputDecoration(
                labelText: "ID Player",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: jumlahController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Jumlah Top Up",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: kirim,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF145A32),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                child: const Text(
                  "Kirim",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}