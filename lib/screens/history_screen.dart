import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  final List<String> history;

  const HistoryScreen({super.key, required this.history});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Riwayat"),
        backgroundColor: Colors.pink.shade300, // Warna AppBar Soft Pink
      ),
      backgroundColor: Colors.pink.shade50, // Warna Background Soft Pink
      body: history.isEmpty
          ? const Center(
              child: Text(
                "Belum ada riwayat",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            )
          : ListView.builder(
              itemCount: history.length,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.white, // Biar kontras, pakai putih untuk Card
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    title: Text(
                      history[index],
                      style: TextStyle(
                        color: Colors.pink.shade700, // Warna teks pink tua
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    leading: const Icon(Icons.history, color: Colors.pink), // Ikon pink
                  ),
                );
              },
            ),
    );
  }
}
