import 'package:flutter/material.dart';
import '../models/game.dart';
import '../models/transaksi.dart';
import 'form_topup_page.dart';
import '../widgets/custom_appbar.dart';

class HomePage extends StatefulWidget {
  final List<Game> games;
  final Function(Transaksi) onTopUp;

  const HomePage({
    super.key,
    required this.games,
    required this.onTopUp,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int? pressedIndex;
  int? hoveredIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Top Up Game",
        icon: Icons.games,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: widget.games.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemBuilder: (context, index) {
          final game = widget.games[index];
          final isPressed = pressedIndex == index;
          final isHovered = hoveredIndex == index;

          return MouseRegion(
            onEnter: (_) => setState(() => hoveredIndex = index),
            onExit: (_) => setState(() => hoveredIndex = null),
            child: GestureDetector(
              onTapDown: (_) => setState(() => pressedIndex = index),
              onTapUp: (_) => setState(() => pressedIndex = null),
              onTapCancel: () => setState(() => pressedIndex = null),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => FormTopUpPage(
                      game: game,
                      onSubmit: widget.onTopUp,
                    ),
                  ),
                );
              },
              child: AnimatedScale(
                scale: isPressed ? 0.93 : 1,
                duration: const Duration(milliseconds: 120),
                curve: Curves.easeOut,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  child: Card(
                    elevation: isHovered ? 12 : 5,
                    shadowColor: Colors.black.withOpacity(
                        isHovered ? 0.25 : 0.15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        color: isHovered
                            ? Colors.grey.shade100
                            : Colors.white,
                      ),
                      child: Column(
                        mainAxisAlignment:
                            MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            game.logo,
                            height: 60,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            game.nama,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}