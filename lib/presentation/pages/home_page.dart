import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart'; // Paket untuk ikon media sosial
import 'package:url_launcher/url_launcher.dart';
import '../controllers/home_controller.dart';
import 'base_page.dart';

class HomePage extends StatelessWidget {
  final HomeController controller;

  HomePage(this.controller);

  @override
  Widget build(BuildContext context) {
    return BasePage(
      bodyContent: Container(
        // Tambahkan background dengan warna gelap untuk kesan profesional
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black87, Colors.blueGrey],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Bagian foto profil
              Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 50, // Ukuran foto profil
                      backgroundImage: AssetImage('assets/images/image.png'), // Ganti dengan path foto lokal
                    ),
                    SizedBox(height: 10),
                    Text(
                      'TB Jaya Bangunan',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Agen Distribusi Bahan Bangunan',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[400],
                      ),
                    ),
                    SizedBox(height: 16),
                  ],
                ),
              ),
              // Teks Selamat Datang
              Text(
                'Selamat Datang di TB Jaya Bangunan',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 16),
              Expanded(
                child: ListView(
                  children: [
                    _buildHomeItem(Icons.inventory, 'Stok Barang'),
                    _buildHomeItem(Icons.price_change, 'Harga dan Penawaran'),
                  ],
                ),
              ),
              SizedBox(height: 16),
              // Bagian media sosial
              Center(
                child: Column(
                  children: [
                    Text(
                      'Ikuti kami di',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey[400],
                      ),
                    ),
                    SizedBox(height: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FaIcon(FontAwesomeIcons.instagram, color: Colors.pinkAccent),
                            SizedBox(width: 8),
                            Text(
                              '@tbjayabangunan',
                              style: TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FaIcon(FontAwesomeIcons.facebook, color: Colors.blueAccent),
                            SizedBox(width: 8),
                            Text(
                              'TB Jaya Bangunan',
                              style: TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FaIcon(FontAwesomeIcons.whatsapp, color: Colors.green),
                            SizedBox(width: 8),
                            Text(
                              '081219084020',
                              style: TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      selectedIndex: 0, // Home tab is selected
      controller: controller,
    );
  }

  // Fungsi untuk membuka URL media sosial
  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Widget _buildHomeItem(IconData icon, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: GestureDetector(
        onTap: () {
          // Aksi ketika item ditekan, misalnya navigasi ke halaman terkait
        },
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 6,
          shadowColor: Colors.black54,
          color: Colors.blueGrey[900], // Warna card gelap untuk kesan profesional
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Icon(icon, color: Colors.lightBlueAccent, size: 30),
                SizedBox(width: 16),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.white, // Warna teks putih untuk kontras
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
