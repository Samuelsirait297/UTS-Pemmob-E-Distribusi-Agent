import 'package:flutter/material.dart';
import '../controllers/home_controller.dart';
import 'base_page.dart';

class ProductPage extends StatelessWidget {
  final HomeController controller;

  ProductPage(this.controller);

  final List<Map<String, dynamic>> products = [
    {
      'image': 'assets/images/semen3roda.jpg',
      'name': 'Semen Tiga Roda',
      'price': 'Rp 50.000',
    },
    {
      'image': 'assets/images/batamerah.jpg',
      'name': 'Bata Merah',
      'price': 'Rp 1.500/biji',
    },
    {
      'image': 'assets/images/cat_tembok_.jpg',
      'name': 'Cat Tembok',
      'price': 'Rp 120.000',
    },
    {
      'image': 'assets/images/keramik-lantai.jpg',
      'name': 'Keramik Lantai',
      'price': 'Rp 95.000/m²',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return BasePage(
      bodyContent: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Colors.blueGrey.shade100],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Produk Kami',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey.shade900,
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                  ),
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return _buildProductCard(
                      image: product['image'],
                      name: product['name'],
                      price: product['price'],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      selectedIndex: 2,
      controller: controller,
    );
  }

  Widget _buildProductCard({
    required String image,
    required String name,
    required String price,
  }) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 6,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 8),
            Text(
              name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 4),
            Text(
              price,
              style: TextStyle(
                color: Colors.blueGrey.shade700,
                fontSize: 14,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
