import 'package:flutter/material.dart';
import 'package:mysample/data/models/model_product.dart';

class DetailProductScreen extends StatelessWidget {
  final Product product;

  const DetailProductScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // =========================
      // APP BAR
      // =========================
      appBar: AppBar(title: const Text('Detail Produk'), centerTitle: true),

      // =========================
      // BODY
      // =========================
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // =========================
            // GAMBAR PRODUK
            // =========================
            Container(
              width: double.infinity,
              height: 350,
              color: Colors.grey.shade100,
              child: Image.network(product.imageUrl, fit: BoxFit.contain),
            ),

            // =========================
            // INFORMASI PRODUK
            // =========================
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Nama produk
                  Text(
                    product.name,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  // Harga
                  Text(
                    'Rp ${product.price}',
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  // Rating dan toko
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.amber, size: 20),

                      const SizedBox(width: 5),

                      Text(
                        '${product.rating}',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(width: 15),

                      const Icon(
                        Icons.location_on_outlined,
                        color: Colors.grey,
                        size: 20,
                      ),

                      const SizedBox(width: 4),

                      Text(
                        product.storeName,
                        style: const TextStyle(
                          fontSize: 15,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  const Divider(),

                  const SizedBox(height: 15),

                  // =========================
                  // DESKRIPSI
                  // =========================
                  const Text(
                    'Deskripsi Produk',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    'Produk ${product.name} merupakan salah satu produk '
                    'pilihan dari ${product.storeName}. Produk ini memiliki '
                    'kualitas yang baik dan cocok digunakan untuk kebutuhan '
                    'sehari-hari. Dapatkan produk ini dengan harga terbaik '
                    'di toko kami.',
                    style: const TextStyle(
                      fontSize: 15,
                      height: 1.5,
                      color: Colors.grey,
                    ),
                  ),

                  const SizedBox(height: 20),

                  // =========================
                  // INFORMASI TOKO
                  // =========================
                  const Text(
                    'Informasi Toko',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 10),

                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        const CircleAvatar(
                          radius: 25,
                          child: Icon(Icons.store),
                        ),

                        const SizedBox(width: 12),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              product.storeName,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            const SizedBox(height: 4),

                            const Text(
                              'Toko resmi',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 25),

                  // =========================
                  // BUTTON
                  // =========================
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        // Tambahkan ke keranjang
                      },
                      icon: const Icon(Icons.shopping_cart_outlined),
                      label: const Text(
                        'Tambah ke Keranjang',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
