import 'package:flutter/material.dart';
import 'package:mysample/data/models/model_product.dart';

class DetailProductScreen extends StatefulWidget {
  final Product product;

  const DetailProductScreen({super.key, required this.product});

  @override
  State<DetailProductScreen> createState() => _DetailProductScreenState();
}

class _DetailProductScreenState extends State<DetailProductScreen> {
  // Warna yang sedang dipilih
  String selectedColor = 'Hitam';

  @override
  Widget build(BuildContext context) {
    final product = widget.product;

    return Scaffold(
      backgroundColor: Colors.white,

      // =====================================
      // BOTTOM BUTTON
      // =====================================
      bottomNavigationBar: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 10,
                offset: const Offset(0, -3),
              ),
            ],
          ),
          child: Row(
            children: [
              // Keranjang
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.shopping_cart_outlined),
                  label: const Text('Keranjang'),
                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size(0, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),

              const SizedBox(width: 10),

              // Beli sekarang
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(0, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Beli Sekarang',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

      // =====================================
      // BODY
      // =====================================
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // =====================================
            // GAMBAR + APPBAR TRANSPARAN
            // =====================================
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 380,
                  color: Colors.grey.shade100,
                  child: Image.network(product.imageUrl, fit: BoxFit.contain),
                ),

                // AppBar transparan
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 5,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Tombol kembali
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.75),
                              shape: BoxShape.circle,
                            ),
                            child: IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(Icons.arrow_back),
                            ),
                          ),

                          Row(
                            children: [
                              // Keranjang
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.75),
                                  shape: BoxShape.circle,
                                ),
                                child: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.shopping_cart_outlined,
                                  ),
                                ),
                              ),

                              const SizedBox(width: 6),

                              // Share
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.75),
                                  shape: BoxShape.circle,
                                ),
                                child: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.share_outlined),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // =====================================
            // INFORMASI PRODUK
            // =====================================
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // =====================================
                  // JUDUL + HEART
                  // =====================================
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          product.name,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.favorite_border, size: 28),
                      ),
                    ],
                  ),

                  const SizedBox(height: 6),

                  // =====================================
                  // HARGA
                  // =====================================
                  Text(
                    'Rp ${product.price}',
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  // =====================================
                  // RATING + TOKO
                  // =====================================
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.amber, size: 20),

                      const SizedBox(width: 4),

                      Text(
                        '${product.rating}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
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
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  const Divider(),

                  // =====================================
                  // PILIH WARNA
                  // =====================================
                  const SizedBox(height: 15),

                  const Text(
                    'Pilih Warna',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 12),

                  Row(
                    children: [
                      _colorItem('Hitam', Colors.black),

                      const SizedBox(width: 10),

                      _colorItem('Putih', Colors.white),

                      const SizedBox(width: 10),

                      _colorItem('Merah', Colors.red),

                      const SizedBox(width: 10),

                      _colorItem('Biru', Colors.blue),
                    ],
                  ),

                  const SizedBox(height: 12),

                  Text(
                    'Warna dipilih: $selectedColor',
                    style: const TextStyle(color: Colors.grey),
                  ),

                  const SizedBox(height: 20),

                  const Divider(),

                  // =====================================
                  // DESKRIPSI
                  // =====================================
                  const SizedBox(height: 15),

                  const Text(
                    'Deskripsi Produk',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    'Produk ${product.name} merupakan produk pilihan '
                    'dari ${product.storeName}. Produk ini memiliki '
                    'kualitas yang baik dan cocok digunakan untuk '
                    'kebutuhan sehari-hari. Tersedia dalam beberapa '
                    'pilihan warna yang dapat disesuaikan dengan '
                    'kebutuhan kamu.',
                    style: const TextStyle(
                      fontSize: 15,
                      height: 1.5,
                      color: Colors.grey,
                    ),
                  ),

                  const SizedBox(height: 20),

                  const Divider(),

                  // =====================================
                  // TOKO
                  // =====================================
                  const SizedBox(height: 15),

                  const Text(
                    'Informasi Toko',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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

                        Expanded(
                          child: Column(
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
                        ),

                        OutlinedButton(
                          onPressed: () {},
                          child: const Text('Kunjungi'),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 25),

                  // =====================================
                  // ULASAN
                  // =====================================
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Ulasan Produk',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      TextButton(
                        onPressed: () {},
                        child: const Text('Lihat Semua'),
                      ),
                    ],
                  ),

                  const SizedBox(height: 5),

                  // Rating keseluruhan
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.amber, size: 25),

                      const SizedBox(width: 5),

                      Text(
                        '${product.rating}/5',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(width: 8),

                      const Text(
                        '• 120 ulasan',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),

                  const SizedBox(height: 15),

                  // Comment 1
                  _reviewItem(
                    name: 'Andi',
                    rating: 5.0,
                    comment:
                        'Produknya bagus dan sesuai dengan gambar. '
                        'Kualitasnya juga sangat baik.',
                  ),

                  const Divider(),

                  // Comment 2
                  _reviewItem(
                    name: 'Rizky',
                    rating: 4.0,
                    comment:
                        'Barang sampai dengan aman. Kualitasnya '
                        'oke dan pengirimannya cepat.',
                  ),

                  const Divider(),

                  // Comment 3
                  _reviewItem(
                    name: 'Fahmi',
                    rating: 4.5,
                    comment:
                        'Suka banget sama produknya. Warnanya juga '
                        'sesuai dengan yang dipilih.',
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

  // =====================================
  // ITEM WARNA
  // =====================================
  Widget _colorItem(String name, Color color) {
    final isSelected = selectedColor == name;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedColor = name;
        });
      },
      child: Container(
        width: 65,
        height: 65,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isSelected ? Colors.black : Colors.grey.shade300,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 25,
              height: 25,
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.grey.shade400),
              ),
            ),

            const SizedBox(height: 4),

            Text(name, style: const TextStyle(fontSize: 11)),
          ],
        ),
      ),
    );
  }

  // =====================================
  // ITEM ULASAN
  // =====================================
  Widget _reviewItem({
    required String name,
    required double rating,
    required String comment,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 18,
                child: Icon(Icons.person, size: 20),
              ),

              const SizedBox(width: 10),

              Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),

          const SizedBox(height: 6),

          Row(
            children: [
              const Icon(Icons.star, color: Colors.amber, size: 17),

              const SizedBox(width: 3),

              Text('$rating', style: const TextStyle(fontSize: 13)),
            ],
          ),

          const SizedBox(height: 5),

          Text(
            comment,
            style: const TextStyle(
              fontSize: 14,
              height: 1.4,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
