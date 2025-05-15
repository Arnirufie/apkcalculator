import 'package:flutter/material.dart';
import 'main.dart'; // ✅ Pastikan import HomeScreen agar bisa navigasi ke sana!

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.jpg.jpeg"), // ✅ Ganti sesuai path file kamu
            fit: BoxFit.cover, // ✅ Agar gambar menutupi seluruh layar
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Selamat Datang di\nAPP KALKULATOR 💖',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24, 
                  fontWeight: FontWeight.bold, 
                  color: Colors.white, // ✅ Ubah warna agar kontras dengan background
                  shadows: [
                    Shadow(blurRadius: 5, color: Colors.black.withOpacity(0.5), offset: Offset(2, 2))
                  ],
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink[400],
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()), // ✅ Pindah ke HomeScreen!
                  );
                },
                child: const Text('Go', style: TextStyle(fontSize: 18, color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
