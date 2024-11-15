import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'base_page.dart';
import '../controllers/home_controller.dart';

class ProfilePage extends StatelessWidget {
  final HomeController controller;

  ProfilePage(this.controller);

  @override
  Widget build(BuildContext context) {
    return BasePage(
      bodyContent: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF8B4513), Color(0xFFD2691E)], // Warna tanah dan bata
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Header
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFFCD853F), Color(0xFFDEB887)], // Warna kayu
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black45,
                        blurRadius: 20,
                        offset: Offset(0, 6),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      // Logo perusahaan
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.5),
                              blurRadius: 20,
                              offset: Offset(0, 10),
                            ),
                          ],
                        ),
                        child: CircleAvatar(
                          radius: 75,
                          backgroundColor: Colors.white,
                          child: CircleAvatar(
                            radius: 70,
                            backgroundImage: AssetImage(
                              'assets/images/tb_jaya_bangunan_logo.jpg',
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      Text(
                        'TB Jaya Bangunan',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Mitra Konstruksi dan Renovasi Anda',
                        style: TextStyle(
                          fontSize: 18,
                          fontStyle: FontStyle.italic,
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),
                // Informasi Perusahaan
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  padding: EdgeInsets.all(16),
                  child: Column(
                    children: [
                      _buildProfileRow(Icons.store, 'Alamat Toko', 'Jl. Karya Bakti No. 45, Bekasi'),
                      _buildProfileRow(Icons.phone, 'Telepon', '+62 812-3456-7890'),
                      _buildProfileRow(Icons.access_time, 'Jam Operasional', 'Senin - Sabtu, 08.00 - 17.00'),
                      _buildProfileRow(Icons.category, 'Kategori', 'Bahan Bangunan, Alat Konstruksi'),
                    ],
                  ),
                ),
                SizedBox(height: 30),
                // Tentang Perusahaan
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    'TB Jaya Bangunan adalah penyedia bahan bangunan terpercaya yang telah melayani masyarakat sejak 2010. Kami berkomitmen untuk menyediakan produk berkualitas tinggi dengan harga bersaing. Dengan layanan pelanggan yang ramah dan stok yang lengkap, kami adalah mitra terbaik untuk kebutuhan konstruksi Anda.',
                    style: TextStyle(color: Colors.white70, fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 30),
                // Tombol Pesan Sekarang
                ElevatedButton.icon(
                  onPressed: () {
                    _launchURL('https://wa.me/6281234567890?text=Halo%20TB%20Jaya%20Bangunan,%20saya%20ingin%20memesan');
                  },
                  icon: Icon(Icons.shopping_cart, color: Colors.white),
                  label: Text('Pesan Sekarang'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orangeAccent, // Gunakan `backgroundColor` alih-alih `primary`
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      selectedIndex: 1, // Profile tab is selected
      controller: controller,
    );
  }

  Widget _buildProfileRow(IconData icon, String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.white70),
          SizedBox(width: 12),
          Expanded(
            child: Text(
              '$title: ',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                fontSize: 16,
                color: Colors.white70,
              ),
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }

  // Fungsi untuk membuka URL
  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
