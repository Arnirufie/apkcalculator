import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Profil",
          style: TextStyle(color: Colors.white), // Warna teks tetap putih
        ),
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white, // Pastikan semua teks di AppBar tetap putih
      ),
      body: Center(
        child: Container(
          width: 300, // Ukuran kotak mirip kalkulator
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min, // Ukuran pas sesuai konten
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Foto Profil
              const CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage('assets/images/profile.jpg.jpeg'), // Pastikan gambar ada
              ),
              const SizedBox(height: 10),

              // Nama & Bio
              const Text(
                "Rufie",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const Text(
                "SMK | XI RPL1",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 10),

              // Email
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.email, color: Colors.pink),
                  SizedBox(width: 8),
                  Text(
                    "arnirufiyanti0309@email.com",
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),

              const SizedBox(height: 8),

              // Instagram dengan Logo Warna
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  FaIcon(FontAwesomeIcons.instagram, color: Colors.purple, size: 24),
                  SizedBox(width: 8),
                  Text(
                    "@rufie.aa",
                    style: TextStyle(color: Colors.purple, fontSize: 16),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
