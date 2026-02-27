import 'package:flutter/material.dart';
import '../models/transaksi.dart';
import '../widgets/custom_appbar.dart';

class RiwayatPage extends StatefulWidget {
  final List<Transaksi> riwayat;
  final Function(List<int>) onDeleteMultiple;

  const RiwayatPage({
    super.key,
    required this.riwayat,
    required this.onDeleteMultiple,
  });

  @override
  State<RiwayatPage> createState() => _RiwayatPageState();
}

class _RiwayatPageState extends State<RiwayatPage> {
  bool selectionMode = false;
  Set<int> selectedIndexes = {};

  void toggleSelection(int index) {
    setState(() {
      if (selectedIndexes.contains(index)) {
        selectedIndexes.remove(index);
      } else {
        selectedIndexes.add(index);
      }
      if (selectedIndexes.isEmpty) selectionMode = false;
    });
  }

  void hapusTerpilih() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Konfirmasi"),
        content: Text(
            "Hapus ${selectedIndexes.length} transaksi yang dipilih?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Batal"),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
            ),
            onPressed: () {
              widget.onDeleteMultiple(
                  selectedIndexes.toList()
                    ..sort((a, b) => b.compareTo(a)));

              setState(() {
                selectedIndexes.clear();
                selectionMode = false;
              });

              Navigator.pop(context);
            },
            child: const Text("Hapus"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: selectionMode
          ? AppBar(
              backgroundColor: const Color(0xFF145A32),
              title: Text("${selectedIndexes.length} dipilih"),
              leading: IconButton(
                icon: const Icon(Icons.close),
                onPressed: () {
                  setState(() {
                    selectionMode = false;
                    selectedIndexes.clear();
                  });
                },
              ),
              actions: [
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed:
                      selectedIndexes.isEmpty ? null : hapusTerpilih,
                )
              ],
            )
          : const CustomAppBar(
              title: "Riwayat",
              icon: Icons.history,
            ),
      body: widget.riwayat.isEmpty
          ? const Center(child: Text("Belum ada transaksi"))
          : ListView.builder(
              itemCount: widget.riwayat.length,
              itemBuilder: (context, index) {
                final data = widget.riwayat[index];
                final isSelected = selectedIndexes.contains(index);

                return GestureDetector(
                  onLongPress: () {
                    setState(() {
                      selectionMode = true;
                      selectedIndexes.add(index);
                    });
                  },
                  onTap: () {
                    if (selectionMode) toggleSelection(index);
                  },
                  child: Card(
                    elevation: 5,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 8),
                    color: isSelected
                        ? Colors.green.shade100
                        : Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(14),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        children: [
                          Text(
                            data.namaGame,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                          const SizedBox(height: 6),
                          Text("Jumlah: ${data.jumlah}"),
                          Text("ID: ${data.idPlayer}"),
                          Text("Email: ${data.email}"),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}