import 'package:flutter/material.dart';
import '../models/game.dart';
import '../widgets/custom_appbar.dart';

class InventoryPage extends StatefulWidget {
  final List<Game> games;

  const InventoryPage({super.key, required this.games});

  @override
  State<InventoryPage> createState() => _InventoryPageState();
}

class _InventoryPageState extends State<InventoryPage> {

  int? hoveredIndex;
  int? pressedIndex;

  IconData getGameIcon(String nama) {
    switch (nama) {
      case "Mobile Legends":
      case "Free Fire":
        return Icons.diamond_outlined;
      case "PUBG Mobile":
        return Icons.monetization_on;
      default:
        return Icons.circle;
    }
  }

  Color getGameIconColor(String nama) {
    switch (nama) {
      case "Mobile Legends":
        return Colors.blueAccent;
      case "Free Fire":
        return Colors.cyan;
      case "PUBG Mobile":
        return Colors.orange;
      default:
        return Colors.grey;
    }
  }

  void tambahStokDialog(Game game) {
    final jumlahController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
        title: Text(
          "Tambah Stok ${game.nama}",
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        content: TextField(
          controller: jumlahController,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            labelText: "Jumlah Stok",
            border: OutlineInputBorder(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              "Batal",
              style: TextStyle(
                color: Color(0xFF145A32),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF145A32),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: () {
              int jumlah = int.tryParse(jumlahController.text) ?? 0;

              if (jumlah > 0) {
                setState(() {
                  game.stok += jumlah;
                });
              }

              Navigator.pop(context);
            },
            child: const Text(
              "Tambah",
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Inventory",
        icon: Icons.inventory,
      ),
      backgroundColor: const Color(0xFFF4F6F5),
      body: ListView.builder(
        itemCount: widget.games.length,
        itemBuilder: (context, index) {
          final game = widget.games[index];

          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              children: [

                /// Ini logo gamenya
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    game.logo,
                    width: 55,
                    height: 55,
                    fit: BoxFit.cover,
                  ),
                ),

                const SizedBox(width: 16),

                /// Ini ngasih kotaknya
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        game.nama,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 6),

                      /// Ini Ikon samping Stok
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: getGameIconColor(game.nama)
                                  .withOpacity(0.1),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Icon(
                              getGameIcon(game.nama),
                              size: 16,
                              color: getGameIconColor(game.nama),
                            ),
                          ),
                          const SizedBox(width: 6),
                          Text(
                            "${game.stok}",
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                /// Ini Button Tambah
                MouseRegion(
                  onEnter: (_) {
                    setState(() {
                      hoveredIndex = index;
                    });
                  },
                  onExit: (_) {
                    setState(() {
                      hoveredIndex = null;
                    });
                  },
                  child: GestureDetector(
                    onTapDown: (_) {
                      setState(() {
                        pressedIndex = index;
                      });
                    },
                    onTapUp: (_) {
                      setState(() {
                        pressedIndex = null;
                      });
                      tambahStokDialog(game);
                    },
                    onTapCancel: () {
                      setState(() {
                        pressedIndex = null;
                      });
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 150),
                      curve: Curves.easeInOut,
                      width: 44,
                      height: 44,
                      transform: pressedIndex == index
                          ? (Matrix4.identity()..scale(0.9))
                          : Matrix4.identity(),
                      decoration: BoxDecoration(
                        color: hoveredIndex == index
                            ? const Color(0xFF1E8449)
                            : const Color(0xFF145A32),
                        shape: BoxShape.circle,
                        boxShadow: pressedIndex == index
                            ? []
                            : [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  blurRadius: 8,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                      ),
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 22,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}