import 'package:flutter/material.dart';
import '../models/game.dart';
import '../models/transaksi.dart';
import 'home_page.dart';
import 'inventory_page.dart';
import 'riwayat_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  List<Game> games = [
    Game(nama: "Mobile Legends", logo: "assets/image/ml.png", stok: 5000),
    Game(nama: "Free Fire", logo: "assets/image/ff.png", stok: 3000),
    Game(nama: "PUBG Mobile", logo: "assets/image/pubgm.png", stok: 2000),
  ];

  List<Transaksi> riwayat = [];

  void tambahTransaksi(Transaksi transaksi) {
    setState(() {
      riwayat.add(transaksi);
    });
  }

  void hapusTransaksiMultiple(List<int> indexes) {
    setState(() {
      for (var index in indexes) {
        riwayat.removeAt(index);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final pages = [
      HomePage(games: games, onTopUp: tambahTransaksi),
      InventoryPage(games: games),
      RiwayatPage(
        riwayat: riwayat,
        onDeleteMultiple: hapusTransaksiMultiple,
      ),
    ];

    return Scaffold(
      body: pages[_selectedIndex],

      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          splashColor: const Color(0xFF145A32).withOpacity(0.25), 
          highlightColor: Colors.black.withOpacity(0.08), 
          hoverColor: Colors.black.withOpacity(0.06), 
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          selectedItemColor: const Color(0xFF145A32),
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          elevation: 12, // tambah bayangan
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.inventory), label: "Inventory"),
            BottomNavigationBarItem(
                icon: Icon(Icons.history), label: "Riwayat"),
          ],
        ),
      ),
    );
  }
}