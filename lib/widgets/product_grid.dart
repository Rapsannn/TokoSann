import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProductGrid extends StatefulWidget {
  const ProductGrid({super.key});

  @override
  State<ProductGrid> createState() => _ProductGridState();
}

class _ProductGridState extends State<ProductGrid> {
  // variable yang menampung data produk dari API
  List product = [];

  //request data ke API
  // pakai future karena data didapat nanti
  // karena API membutuhkan waktu
  // menggunakan void karena tdk mengembalikan nilai
  // menggunakan async karena mengembalikan future
  Future<void> fetchProducts() async {
    Uri url = Uri.parse('https://fakestoreapi.com/products');

    // respon dari API dimasukkan ke variable response
    var response = await http.get(url);

    // parsing JSON dan masukkan ke varibel data
    final data = jsonDecode(response.body);

    // data yang sudah di parsing dimasukkan ke variable product
    setState(() {
      product = data;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // panggil fungsi fetchProducts
    fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Produk',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),

      body: product.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : GridView.builder(
              padding: const EdgeInsets.all(16),

              // Jumlah produk
              itemCount: product.length,

              // Mengatur bentuk Grid
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,

                // Jarak antar card secara horizontal
                crossAxisSpacing: 12,

                // Jarak antar card secara vertikal
                mainAxisSpacing: 12,

                // Perbandingan lebar dan tinggi card
                childAspectRatio: 0.62,
              ),

              // Membuat setiap item produk
              itemBuilder: (context, index) {
                // Mengambil data produk berdasarkan index
                final item = product[index];

                return Card(
                  elevation: 3,

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),

                  clipBehavior: Clip.antiAlias,

                  child: InkWell(
                    onTap: () {
                      // Nanti bisa diarahkan ke detail produk
                    },

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // =========================
                        // GAMBAR PRODUK
                        // =========================
                        Expanded(
                          child: Container(
                            width: double.infinity,

                            padding: const EdgeInsets.all(20),

                            color: Colors.white,

                            child: Image.network(
                              item['image'],

                              fit: BoxFit.contain,

                              // Loading gambar
                              loadingBuilder:
                                  (context, child, loadingProgress) {
                                    if (loadingProgress == null) {
                                      return child;
                                    }

                                    return const Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  },
                            ),
                          ),
                        ),

                        // =========================
                        // INFORMASI PRODUK
                        // =========================
                        Padding(
                          padding: const EdgeInsets.all(10),

                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: [
                              // Nama produk
                              Text(
                                item['title'],

                                maxLines: 2,

                                overflow: TextOverflow.ellipsis,

                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              const SizedBox(height: 8),

                              // Harga
                              Text(
                                '\$${item['price']}',

                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              const SizedBox(height: 6),

                              // =========================
                              // RATING
                              // =========================
                              Row(
                                children: [
                                  const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: 18,
                                  ),

                                  const SizedBox(width: 4),

                                  Text(
                                    '${item['rating']['rate']}',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 13,
                                    ),
                                  ),

                                  const SizedBox(width: 4),

                                  Text(
                                    '(${item['rating']['count']})',
                                    style: TextStyle(
                                      color: Colors.grey.shade600,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
