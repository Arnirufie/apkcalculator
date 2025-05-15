import 'package:flutter/material.dart';
import 'screens/calculator_screen.dart';
import 'screens/history_screen.dart';
import 'screens/profile_screen.dart';
import '../welcome_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const WelcomePage(), // ✅ Tampilkan WelcomePage dulu!
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  List<String> history = []; // Menyimpan riwayat perhitungan

  late final List<Widget> _screens;

  @override
  void initState() {
    super.initState();
    _screens = [
      CalculatorScreen(history: history),
      HistoryScreen(history: history),
      const ProfileScreen(),
    ];
  }

  void _onItemTapped(int index) {
    if (_selectedIndex != index) {
      setState(() {
        _selectedIndex = index;
      });
    }
    Navigator.pop(context); // Tutup drawer setelah pilih menu
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(), // 🔥 Menghapus title dari AppBar
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            ListTile(
              leading: const Icon(Icons.calculate),
              title: const Text("Kalkulator"),
              onTap: () => _onItemTapped(0),
            ),
            ListTile(
              leading: const Icon(Icons.history),
              title: const Text("Riwayat"),
              onTap: () => _onItemTapped(1),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text("Profil"),
              onTap: () => _onItemTapped(2),
            ),
          ],
        ),
      ),
      body: _screens[_selectedIndex], // Menampilkan halaman sesuai pilihan Drawer
    );
  }
}
